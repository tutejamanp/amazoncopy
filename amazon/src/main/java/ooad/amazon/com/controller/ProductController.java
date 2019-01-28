package ooad.amazon.com.controller;

import java.util.List;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ooad.amazon.com.bean.Product;
import ooad.amazon.com.dao.ProductDAO;

@Path("/ProductController")
public class ProductController {
	
	
	@Path("/products")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getProducts() {

		 GenericEntity<List<Product>> products;
	
		 products  = new GenericEntity<List<Product>>(ProductDAO.getAllProducts()) { };
		 return Response.ok(products).build();
		 
	    }
	
	 @Path("/productsByCategory/{categoryname}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getProductsByCategory(@PathParam("categoryname") String categoryname) {

		 GenericEntity<List<Product>> products;
	
		 products  = new GenericEntity<List<Product>>(ProductDAO.getProductsbyCategory(categoryname)) { };
		 return Response.ok(products).build();

		 
	    }
	

	

}
