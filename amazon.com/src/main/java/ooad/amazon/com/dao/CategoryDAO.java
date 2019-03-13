package ooad.amazon.com.dao;

import java.util.List;

import org.hibernate.Session;

import ooad.amazon.com.bean.Category;
import ooad.amazon.com.resources.CommonSessionFactory;

public class CategoryDAO {
	
	public static List<Category> getAllSubCategories(int id) {
		Session ses = CommonSessionFactory.sf.openSession();
		List<Category> catList;
		
			catList = ses.createNativeQuery("select * from Category where super_cat_id="+id,Category.class).list();
		
		ses.close();
		return catList;
		
	}
	
	
	public static List<Category> getAllrootCategories() {
		Session ses = CommonSessionFactory.sf.openSession();
		List<Category> catList;
		catList = ses.createNativeQuery("select * from Category where super_cat_id = 0",Category.class).list();
		ses.close();
		return catList;
		
	}
	
	
	
	
	public static List<Category> getAllCategories() {
		Session ses = CommonSessionFactory.sf.openSession();
		List<Category> catList;
		catList = ses.createNativeQuery("select * from Category ",Category.class).list();
		ses.close();
		return catList;
		
	}
	
	
	public static Category getCategorybyid(int cat_id) {
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		List<Category> cat_list;
		cat_list = ses.createNativeQuery("select * from Category where cat_id ="+cat_id,Category.class).list();
		return cat_list.get(0);
	}
	
	public static int addCategory(String catname, int sup_id) {
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		Category cat = new Category();
		List<Category> sup_cat_list;
		//sup_cat.
		
		System.out.println("super cat id is : "+sup_id);
		
		sup_cat_list = ses.createNativeQuery("select * from Category where cat_id ="+sup_id,Category.class).list();
		
		Category sup_cat = sup_cat_list.get(0);
		cat.setCategoryname(catname);
		cat.setSuper_cat(sup_cat);
		
		Integer id = (Integer) ses.save(cat);
		ses.getTransaction().commit();
		ses.close();
		return id;
	}
}
