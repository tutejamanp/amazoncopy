package ooad.amazon.com.dao;

import java.util.Calendar;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import ooad.amazon.com.bean.Admin;
import ooad.amazon.com.bean.Customer;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.User;
import ooad.amazon.com.resources.CommonSessionFactory;

public class AdminDAO {

	
	public static List<Admin> CheckLogin(String username, String password) {
		
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		try {
			System.out.println("select * from Admin where aName = "+"'"+username+"'"+" and password = "+"'"+password+"'");
			Query query = ses.createQuery("from Admin where aName = "+"'"+username+"'"+" and password = "+"'"+password+"'");
			List<Admin> lusers  = (List<Admin>) query.list(); 
			//List<User> lusers  = ses.createNativeQuery("select * from User where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'").list();
			System.out.println("lusers to string is  :"+lusers.toString());
			
			int k = lusers.size();
			System.out.println("size of list lusers is :"+lusers.size());
			if(k >= 1) {
				System.out.println("returning "+lusers.get(0).getaName());
				Query query1 = ses.createQuery("from Admin where aName = '"+lusers.get(0).getaName() + "'");
				List<Admin> lcustomers  = (List<Admin>) query1.list(); 
				
				
				System.out.println(lcustomers.get(0).toString());
				return lcustomers;
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			ses.getTransaction().commit();
			ses.close();
		}
		return null;
	}
	
public static int registercustomer (Admin adm) {
		
		Session ses = CommonSessionFactory.sf.openSession();
		ses.beginTransaction();
		ses.save(adm);
		ses.getTransaction().commit();
		ses.close();
		
		return 1;
	} 
	
	
	
	
}
