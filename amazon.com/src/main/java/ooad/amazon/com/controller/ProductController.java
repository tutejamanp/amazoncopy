package ooad.amazon.com.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import ooad.amazon.com.bean.Category;
import ooad.amazon.com.bean.Customer;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.ProductImages;
import ooad.amazon.com.dao.CustomerDAO;
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
	 
	 @Path("/productsById/{id}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getProductsById(@PathParam("id") int id) {

		 GenericEntity<List<Product>> products;
	
		 products  = new GenericEntity<List<Product>>(ProductDAO.getProductsbyId(id)) { };
		 return Response.ok(products).build();

		 
	    }
	

	 @POST 
		@Path("/saveproduct/{seller_id}")
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public Response registercus(
				@FormParam("productname") String productname,
				@FormParam("description") String description,@FormParam("category") String category,@FormParam("subcategory") String subcategory,
				@FormParam("price") int price,@FormParam("discountedprice") int discountedprice
				, @PathParam("seller_id") int seller_id){
			
			Product prod = new Product();
			prod.setPrice(price);
			prod.setDiscountedprice(discountedprice);
			prod.setProductname(productname);
			prod.setDescription(description);

		    Category cat1 = new Category ();
		    cat1.setCategoryname(category);
		    cat1.setLevelid(1);
		    Category cat2 = new Category ();
		    cat2.setCategoryname(subcategory);
		    cat2.setLevelid(2);
		    
		    List<Category> catlist = new ArrayList<Category>();
		    catlist.add(cat1);
		    catlist.add(cat2);
		    
		    prod.setCategorylist(catlist);
		    
		    
		    ProductImages pi1 = new ProductImages();
		    pi1.setUrl("");
		    
		    List<ProductImages> npi = new ArrayList<ProductImages>();
		    npi.add(pi1);
		    
		    prod.setProduct_images(npi);
		    
		    int resp = ProductDAO.addproduct(prod, catlist, npi);
			
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
