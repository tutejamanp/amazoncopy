package ooad.amazon.com.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import ooad.amazon.com.bean.Customer;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.User;
import ooad.amazon.com.resources.CommonSessionFactory;

public class UserDAO {

	
	public static String CheckLogin(String username, String password) {
	
		try {
			
			Session ses = CommonSessionFactory.sf.openSession();
			System.out.println("select * from User where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'");
			List<User> lusers  = ses.createNativeQuery("select * from User where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'").list();
			System.out.println("lusers to string is  :"+lusers.toString());
			ses.close();
			int k = lusers.size();
			System.out.println("size of list lusers is :"+lusers.size());
			if(k == 1) {
				//System.out.println("returning "+lusers.get(0).getId());
				return username;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
	
	
	public static boolean isbirthday(int id) {
		
		try {
			
			Session ses = CommonSessionFactory.sf.openSession();
			//System.out.println("select * from customer where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'");
			List<Customer> lcust  = ses.createNativeQuery("select * from customer where id = "+id).list();
			ses.close();
			//System.out.println("size of list lusers is :"+lusers.size());
		//	System.out.println("lcust date is "+Calendar.lcust.get(0).getDob());
			if(lcust.size() == 1) {
				return true;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
	
}
