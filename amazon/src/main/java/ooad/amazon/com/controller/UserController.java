package ooad.amazon.com.controller;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;

import javax.ws.rs.POST;
import javax.ws.rs.Path;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ooad.amazon.com.dao.UserDAO;

@Path("/UserController")
public class UserController {
	
	@POST 
	@Path("/checkLogin")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Response checkLogin(
			@FormParam("username") String username,
			@FormParam("password") String password){
		
 		System.out.println(username + " " + password);
		 int resp = UserDAO.CheckLogin(username, password);
		 if(resp >-1)
		 {
			 String result = resp+"";
			 return Response.status(201).entity(result).build();
		 }
		 else
		 {
			 String result = resp+"";
			 return Response.status(404).entity(result).build();
		 }
		
	}
	
}
