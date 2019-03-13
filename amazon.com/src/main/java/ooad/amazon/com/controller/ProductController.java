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
import ooad.amazon.com.dao.LabelDAO;
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
	 
	 @Path("/productsBysellerId/{sellerid}")
	 @GET
	 @Produces(MediaType.APPLICATION_JSON)
	    public Response getProductsBySellerId(@PathParam("sellerid") int sellerid) {

		 GenericEntity<List<Product>> products;
	
		 products  = new GenericEntity<List<Product>>(ProductDAO.getProductsbySellerId(sellerid)) { };
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
				@FormDataParam("quantity") int quantity,
				@FormDataParam("category") int category,
				@FormDataParam("subcategory") int subcategory,
				@FormDataParam("price") int price,
				@FormDataParam("discountedprice") int discountedprice,
				@FormDataParam("customlabels") String labels,
				@FormDataParam("manname") String manname,
				@FormDataParam("manDate") String mandate,
				@PathParam("seller_id") int seller_id){
			
		
		 
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
			prod.setQuantityleft(quantity);
			Category cat;
            if(subcategory == -1)
            {
			cat = CategoryDAO.getCategorybyid(category);
		    prod.setCategory(cat);
            }
            
            else
            {
            	cat = CategoryDAO.getCategorybyid(subcategory);
    		    prod.setCategory(cat);
            }
		    
            
            /**YaminiChanges****/
			DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ENGLISH);
			Date date = null;
			try {
				date = format.parse(mandate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(date);
			
			prod.setManufactured_date(date);
			/**YaminiChanges****/
			
		    ProductImages pi1 = new ProductImages();
		    pi1.setUrl(storeUrl);
		    
		    List<ProductImages> npi = new ArrayList<ProductImages>();
		    npi.add(pi1);
		    
		    prod.setProduct_images(npi);
		    
		    int resp = ProductDAO.addproduct(seller_id, prod, cat , npi);
		    
		    /**YaminiChanges****/
		    //Label lb = new Label();
		    LabelDAO lbd = new LabelDAO();
		    System.out.println("labels------------------------------" + labels);
		    String[]tokens = labels.split(",");
		    for (int i = 0; i < tokens.length; i++) {
		    	System.out.println(tokens[i]);
		    	String[]myTokens = tokens[i].split("--");
		    	System.out.println("mytokens:"+ myTokens.toString());
		    	System.out.println(myTokens[0] + " " + myTokens[1]);
		    	lbd.addLabel(myTokens[0], myTokens[1], prod.getId());
//	    		lb.setLname(myTokens[0]);
//	    		lb.setLvalue(myTokens[1]);
		    }		
		   
		    
		    /**YaminiChanges****/
			
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
	 
	 
	 @POST 
		@Path("/updateproductdetails/{productid}")
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response updateproduct(
				@FormDataParam("description") String description,
				@FormDataParam("price") int price,
				@FormDataParam("quantityleft") int quantity,
				@FormDataParam("productname") String productname,
				@FormDataParam("discountedprice") int discountedprice,
				@PathParam("productid") int productid){
			
		
		 
		 	Product prod = ProductDAO.getProductsbyId(productid).get(0);
			prod.setPrice(price);
			prod.setDiscountedprice(discountedprice);
			prod.setDescription(description);
			prod.setQuantityleft(quantity);
			prod.setProductname(productname);
         
		
		    
		    int resp = ProductDAO.upprod (prod);
			
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
		@Path("/deleteproduct/{productid}")
		@Consumes(MediaType.MULTIPART_FORM_DATA)
		public Response deleteselectedproduct(
				@PathParam("productid") int productid){
		 
		 	Product prod = ProductDAO.getProductsbyId(productid).get(0);
		    int resp = ProductDAO.deleteprod (prod);
		    
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
