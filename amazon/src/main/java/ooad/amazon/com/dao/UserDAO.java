package ooad.amazon.com.dao;

import java.util.List;

import org.hibernate.Session;

import ooad.amazon.com.bean.User;
import ooad.amazon.com.resources.CommonSessionFactory;

public class UserDAO {

	
	public static int CheckLogin(String username, String password) {
	
		try {
			
			Session ses = CommonSessionFactory.sf.openSession();
			System.out.println("select * from User where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'");
			List<User> lusers  = ses.createNativeQuery("select * from User where emailid = "+"'"+username+"'"+" and password = "+"'"+password+"'").list();
			ses.close();
			System.out.println("size of list lusers is :"+lusers.size());
			if(lusers.size() == 1) {
				return lusers.get(0).getId();
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	
}
