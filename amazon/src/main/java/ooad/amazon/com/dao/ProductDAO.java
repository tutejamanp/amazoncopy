package ooad.amazon.com.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;


import ooad.amazon.com.bean.Product;
import ooad.amazon.com.resources.CommonSessionFactory;

public class ProductDAO {

	
	public static List<Product> getAllProducts() {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from product",Product.class).list();
		ses.close();
		
		return prodlist;
	}
	
	public static List<Product> getProductsbyCategory(String categoryname) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from Product where id in (select Product_id from product_categorylist where categoryname = "+"'"+categoryname+"'"+" )", Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategorylist());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	
	
	
}
