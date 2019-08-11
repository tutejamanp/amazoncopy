package ooad.amazon.com.dao;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import ooad.amazon.com.bean.Advertisment;
import ooad.amazon.com.bean.Category;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.ProductImages;
import ooad.amazon.com.bean.User;
import ooad.amazon.com.resources.CommonSessionFactory;

public class ProductDAO {

	
	public static List<Product> getAllProducts() {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from product",Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	
	
	public static List<Product> getAllSellerProducts(int sellerid) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from product where seller = "+sellerid,Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	public static List<Product> getProductsbyCategory(int categoryname) {
		Session ses = CommonSessionFactory.sf.openSession();
		System.out.println(categoryname);
		List<Category> catlist = ses.createNativeQuery("select * from category where super_cat_id =" +categoryname , Category.class).list();
		
	
		List<Product> prodlist = ses.createNativeQuery("select * from Product where category_cat_id =" + categoryname , Product.class).list();
		
		for(Category cat : catlist) {
			List<Product> miniProdList = ses.createNativeQuery("select * from Product where category_cat_id =" + cat.getCat_id() , Product.class).list();
			prodlist.addAll(miniProdList);
		}
		
		
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}
	
	public static List<Product> getProductByOffer(String offername) {
		Session ses = CommonSessionFactory.sf.openSession();
		Date todaysDate = new Date();
		List<Product> prodlist = ses.createNativeQuery("select * from Product where offerType = '" + offername + "'" , Product.class).list();
		List<Product> finallist = new ArrayList<Product>();
		for(Product p: prodlist)
		{
			
	    Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
		
		System.out.println(p.toString());
		
		if( p.getOfferEndDate().compareTo(todaysDate) > 0 && p.getOfferStartDate().compareTo(todaysDate)<=0) {
			finallist.add(p);
		} 
		
		}
		ses.close();
		return finallist;
	}
	
	
	public static List<Product> getProductsbySearch(String id) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		//List<Product> prodlist = ses.createNativeQuery("select * from Product where productid LIKE '" + id+"' COLLATE utf8_general_ci" , Product.class).list();

		List<Product> prodlist = ses.createNativeQuery("select * from Product where LOWER(productid) LIKE LOWER('%" + id+"%')" , Product.class).list();
		
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}
	
	

	public static List<Product> getProductsbypricerange(int price1 , int price2) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		//List<Product> prodlist = ses.createNativeQuery("select * from Product where productid LIKE '" + id+"' COLLATE utf8_general_ci" , Product.class).list();

		List<Product> prodlist = ses.createNativeQuery("select * from Product where price>="+price1+" AND price<="+price2 , Product.class).list();
		
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());
		Hibernate.initialize(p.getLabels());
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
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());	
		Hibernate.initialize(p.getLabels());
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}

	
	public static List<Product> getProductsbySellerId(int sellerid) {
		Session ses = CommonSessionFactory.sf.openSession();
		
		List<Product> prodlist = ses.createNativeQuery("select * from Product where seller_id ="+ sellerid + ";", Product.class).list();
		for(Product p: prodlist)
		{Hibernate.initialize(p.getProduct_images());
		Hibernate.initialize(p.getCategory());
		Hibernate.initialize(p.getProduct_reviews());	
		Hibernate.initialize(p.getLabels());
		System.out.println(p.toString());
		}
		ses.close();
		
		return prodlist;
	}
	
	
	
	
	public static String addproduct(int sellerid, Product prod1, Category category, List<ProductImages> images)  throws SQLIntegrityConstraintViolationException{
		
		
		Session ses = CommonSessionFactory.sf.openSession();
		
		try {
			ses.beginTransaction();
			
			User seller = (User)ses.get(User.class, sellerid);
			System.out.println(seller.toString());
			List<Product> prods = seller.getProductlist();
			prod1.setSeller(sellerid);
			
			ses.save(prod1);
			prods.add(prod1);
			ses.save(seller);
			seller.setProductlist(prods);
			for(ProductImages img: images) {
				ses.save(img);
			}
			
			Integer id = (Integer) ses.save(prod1);
			if(id>0)
				return "success";
			else
				return "failure";
		}finally {
			ses.getTransaction().commit();
			ses.close();
		}
		
	}
	
	
	
public static String updateproduct(int sellerid, Product prod1, Category category)  throws SQLIntegrityConstraintViolationException{
		
		
		Session ses = CommonSessionFactory.sf.openSession();
		
		try {
			ses.beginTransaction();
			
			User seller = (User)ses.get(User.class, sellerid);
			System.out.println(seller.toString());
			List<Product> prods = seller.getProductlist();
			prod1.setSeller(sellerid);
			
			ses.update(prod1);
			prods.add(prod1);
			ses.update(seller);
			seller.setProductlist(prods);
			
			ses.update(prod1);
			return "success";
		}finally {
			ses.getTransaction().commit();
			ses.close();
		}
		
	}
	
	
	
	
public static int setOffer(int pid , String type , int perc, String message, Date endDate, Date startDate) {
		
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		

		//System.out.println(sellerid + " ");
		
		Product product = (Product)ses.load(Product.class, pid);
		System.out.println(product.toString());
		product.setOfferType(type);
		product.setOfferdiscpercent(perc);
		product.setOfferMessage(message);
		product.setOfferEndDate(endDate);
		product.setOfferStartDate(startDate);
		
		ses.save(product);
		ses.getTransaction().commit();
		ses.close();
		
		return pid;
	}
	

public static int upprod (Product prod) {
	
	Session ses = CommonSessionFactory.sf.openSession();
	ses.beginTransaction();
	ses.update(prod);
	ses.getTransaction().commit();
	ses.close();
	
	return 1;
}

public static int deleteprod (Product prod) {
	
	Session ses = CommonSessionFactory.sf.openSession();
	ses.beginTransaction();
	ses.delete(prod);
	ses.getTransaction().commit();
	ses.close();
	return 1;
}





	
}
