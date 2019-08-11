package ooad.amazon.com.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import ooad.amazon.com.bean.Category;
import ooad.amazon.com.bean.Product;
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
		catList = ses.createNativeQuery("select * from Category where cat_id = 0 OR super_cat_id= 0",Category.class).list();
		ses.close();
		return catList;
		
	}
	
	public static boolean isSuperCategory(int id) {
		Session ses = CommonSessionFactory.sf.openSession();
		List<Category> catList;
		catList = ses.createNativeQuery("select * from Category where cat_id ="+id + " AND super_cat_id=0",Category.class).list();
		ses.close();
		
		if(catList.isEmpty()) {
			return false;
		} else
			return true;
		
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
	
	public static int addCategory(String catname, int sup_id, String temp1_name, String temp2_name,  String temp3_name, String temp4_name,  String temp5_name, String temp6_name) {
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
		cat.setTemp1_name(temp1_name);
		cat.setTemp2_name(temp2_name);
		cat.setTemp3_name(temp3_name);
		cat.setTemp4_name(temp4_name);
		cat.setTemp5_name(temp5_name);
		cat.setTemp6_name(temp6_name);
		
		Integer id = (Integer) ses.save(cat);
		ses.getTransaction().commit();
		ses.close();
		return id;
	}
	
	public static int updateCategory(int catid, int asupid, String catname, String temp1_name
			,String temp2_name,String temp3_name,String temp4_name,String temp5_name,String temp6_name ) {
		
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();

		Query query = ses.createSQLQuery(
		    "update category set categoryname = :catname , super_cat_id = :asupid , temp1_name = :temp1_name , temp2_name = :temp2_name , temp3_name = :temp3_name , temp4_name = :temp4_name , temp5_name = :temp5_name , temp6_name = :temp6_name "+ " where cat_id = :catid");
		query.setParameter("catname", catname);
		query.setParameter("catid", catid);
		query.setParameter("asupid", asupid);
		query.setParameter("temp1_name", temp1_name);
		query.setParameter("temp2_name", temp2_name);
		query.setParameter("temp3_name", temp3_name);
		query.setParameter("temp4_name", temp4_name);
		query.setParameter("temp5_name", temp5_name);
		query.setParameter("temp6_name", temp6_name);
		
		int result = query.executeUpdate();
		/*session.getTransaction().commit();
		
		
		Category cat1 = ses.load(Category.class, catid);
		
		System.out.println("super of super is :"+CategoryDAO.getCategorybyid(asupid).getSuper_cat().getCat_id());
		
		Category supercat = CategoryDAO.getCategorybyid(asupid);
		
		cat1.setSuper_cat(supercat);
		
 		cat1.setCategoryname(catname);
 		cat1.setTemp1_name(temp1_name);
 		cat1.setTemp2_name(temp2_name);
 		cat1.setTemp3_name(temp3_name);
 		cat1.setTemp4_name(temp4_name);
 		cat1.setTemp5_name(temp5_name);
 		cat1.setTemp6_name(temp6_name);
 	
 		ses.update(supercat);
 		
 		
        ses.update(cat1);*/
		ses.getTransaction().commit();
		ses.close();
		
		return 1;
	}
}
