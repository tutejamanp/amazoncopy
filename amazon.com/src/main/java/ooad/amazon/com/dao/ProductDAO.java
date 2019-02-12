package ooad.amazon.com.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import ooad.amazon.com.bean.Advertisment;
import ooad.amazon.com.bean.Category;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.ProductImages;
import ooad.amazon.com.resources.CommonSessionFactory;

public class ProductDAO {

	
	public static List<Product> getAllProducts() {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from product",Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategorylist());
		Hibernate.initialize(p.getProduct_reviews());
		}
		ses.close();
		
		return prodlist;
	}
	
	public static List<Product> getProductsbyCategory(String categoryname) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from Product where id in (select Product_id from product_categorylist where categoryname = "+"'"+categoryname+"'"+" )", Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategorylist());
		Hibernate.initialize(p.getProduct_reviews());
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	public static List<Product> getProductsbyId(int id) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from Product where id ="+ id + ";", Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategorylist());
		Hibernate.initialize(p.getProduct_reviews());		
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	public static int addproduct(Product prod1, List<Category> categories, List<ProductImages> images) {
		
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		
//		for(Category cat: categories) {
//			ses.save(cat);
//		}
		for(ProductImages img: images) {
			ses.save(img);
		}
		Integer id = (Integer) ses.save(prod1);
		ses.getTransaction().commit();
		ses.close();
		return id;
	}
	
	
}
