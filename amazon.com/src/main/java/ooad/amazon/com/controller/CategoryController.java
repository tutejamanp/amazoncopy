package ooad.amazon.com.controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ooad.amazon.com.bean.Category;
import ooad.amazon.com.dao.CategoryDAO;
import ooad.amazon.com.dao.ProductDAO;



@Path("/CategoryController")
public class CategoryController {

	 @GET
	 @Path("/categories/{id}")
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getCategories(@PathParam("id") int id) {

		 GenericEntity<List<Category>> cats;
	
		 cats  = new GenericEntity<List<Category>>( CategoryDAO.getAllSubCategories(id)) { };
		
		 return Response.ok(cats).build();
	
	    }
	
	 @POST 
		@Path("/addCategory")
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public Response checkLogin(
				@FormParam("catname") String catname,
				@FormParam("supid") String supid){
			
	 		System.out.println("---------------------------------hello-------------------------------------");
	 		int id = Integer.parseInt(supid);
	 		
	 		int resp = CategoryDAO.addCategory(catname, id);
	 		
	 		if(resp >0)
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
