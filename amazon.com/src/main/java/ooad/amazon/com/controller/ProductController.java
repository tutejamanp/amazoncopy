package ooad.amazon.com.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
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

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import ooad.amazon.com.bean.Category;
import ooad.amazon.com.bean.Customer;
import ooad.amazon.com.bean.Product;
import ooad.amazon.com.bean.ProductImages;
import ooad.amazon.com.dao.CategoryDAO;
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
	
	 @Path("/productsByCategory/{categoryid}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getProductsByCategory(@PathParam("categoryid") int categoryid) {

		 GenericEntity<List<Product>> products;
	
		 products  = new GenericEntity<List<Product>>(ProductDAO.getProductsbyCategory(categoryid)) { };
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
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response registercus(
				@FormDataParam("addImageSelect") InputStream uploadedInputStream,
				@FormDataParam("addImageSelect") FormDataContentDisposition fileDetail,
				@FormDataParam("productname") String productname,
				@FormDataParam("description") String description,
				@FormDataParam("category") int category,
				@FormDataParam("price") int price,
				@FormDataParam("discountedprice") int discountedprice
				, @PathParam("seller_id") int seller_id){
			
		
		 
		 //String uploadedFileLocation = "C:\\Users\\Rikki\\eclipse-workspace\\student-management-system\\src\\main\\webapp\\imageData\\" + roll + "." +  fileDetail.getFileName().split("\\.")[1];
		 String uploadedFileLocation = "C:\\Users\\Manpreet\\eclipse-workspace\\amazon.com\\src\\main\\webapp\\images\\products\\" + productname + "." +  fileDetail.getFileName().split("\\.")[1];
		 //String uploadedFileLocation = "D:\\pics"  + productname + "." +  fileDetail.getFileName().split("\\.")[1];;
		 
		 String storeUrl = "images/products/" +  productname + "." +  fileDetail.getFileName().split("\\.")[1];
		//	st.setPicUrl(storeUrl);
		 System.out.println("CAT ID: " + category);
		 System.out.println("file details" + fileDetail.toString() + " -- " + storeUrl + " -- " + uploadedFileLocation);
		 
			writeToFile(uploadedInputStream, uploadedFileLocation);
			
			Product prod = new Product();
			prod.setPrice(price);
			prod.setDiscountedprice(discountedprice);
			prod.setProductname(productname);
			prod.setDescription(description);

			Category cat = CategoryDAO.getCategorybyid(category);
		
		    prod.setCategory(cat);
		    
		    
		    ProductImages pi1 = new ProductImages();
		    pi1.setUrl(storeUrl);
		    
		    List<ProductImages> npi = new ArrayList<ProductImages>();
		    npi.add(pi1);
		    
		    prod.setProduct_images(npi);
		    
		    int resp = ProductDAO.addproduct(seller_id, prod, cat, npi);
			
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
	 
	 
	 

	 @POST 
		@Path("/updateproduct/{pid}")
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response updateprd(
				@FormDataParam("isbdayavil") int bdayavail,
				@FormDataParam("bdayspprice") int bdayprice
				, @PathParam("pid") int pid){
			
		
		 
		 System.out.println("bday avil is : "+bdayavail);
		 System.out.println("bday price is : "+bdayprice);
		 System.out.println("pid is : "+pid);
		 
		 int resp =  ProductDAO.updateproduct(pid , bdayprice , bdayavail);
			
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
	 
	 
	 
	 
	 private void writeToFile(InputStream uploadedInputStream,
				String uploadedFileLocation) {
				try {
					OutputStream out = new FileOutputStream(new File(uploadedFileLocation));
					int read = 0;
					byte[] bytes = new byte[1024];

					out = new FileOutputStream(new File(uploadedFileLocation));
					while ((read = uploadedInputStream.read(bytes)) != -1) {
						out.write(bytes, 0, read);
					}
					out.flush();
					out.close();
				} catch (Exception e) {
					System.out.println("Exception "+e);
					//e.printStackTrace();
				}

			}

}
