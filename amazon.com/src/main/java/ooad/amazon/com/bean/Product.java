package ooad.amazon.com.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CollectionId;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;

@Entity
public class Product {
	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String productname;
	private int price;
	private int discountedprice;
	private int quantityleft;
	private String description;
	private float starratings = 0f;
	private int totalreviews = 0;
	private int seller;
	private int bdayprice;
	private boolean is_bdayproduct;
	
	private int stock;
	private String color;
	private String manufacturer;
	private Date manufactured_date;
	
	
	
	public int getBdayprice() {
		return bdayprice;
	}

	public void setBdayprice(int bdayprice) {
		this.bdayprice = bdayprice;
	}

	public boolean isIs_bdayproduct() {
		return is_bdayproduct;
	}

	public void setIs_bdayproduct(boolean is_bdayproduct) {
		this.is_bdayproduct = is_bdayproduct;
	}

	@OneToOne
	private Category category;
	
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getTotalreviews() {
		return totalreviews;
	}

	public void setTotalreviews(int totalreviews) {
		this.totalreviews = totalreviews;
	}

	@OneToMany
	@JoinColumn(name="prodId")
	List<ProductImages> product_images = new ArrayList<ProductImages>();
	
	@OneToMany
	@JoinColumn(name="proId")
	List<ProdReview> product_reviews = new ArrayList<ProdReview>();
	
	@OneToMany
	@JoinColumn(name="proId")
	List<Label> labels = new ArrayList<Label>();
	
	
	public Product() {
		super();
	}

	public Product(String productname, int price, int discountedprice, int quantityleft, String description) {
		super();
		this.productname = productname;
		this.price = price;
		this.discountedprice = discountedprice;
		this.quantityleft = quantityleft;
		this.description = description;
			}

	
	public List<ProductImages> getProduct_images() {
		return product_images;
	}

	public void setProduct_images(List<ProductImages> product_images) {
		this.product_images = product_images;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountedprice() {
		return discountedprice;
	}

	public void setDiscountedprice(int discountedprice) {
		this.bdayprice = discountedprice;
		this.discountedprice = discountedprice;
	}

	public int getQuantityleft() {
		return quantityleft;
	}

	public void setQuantityleft(int quantityleft) {
		this.quantityleft = quantityleft;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public float getStarratings() {
		return starratings;
	}

	public void setStarratings(float starratings) {
		this.starratings = starratings;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<ProdReview> getProduct_reviews() {
		return product_reviews;
	}

	public void setProduct_reviews(List<ProdReview> product_reviews) {
		this.product_reviews = product_reviews;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", productname=" + productname + ", price=" + price + ", discountedprice="
				+ discountedprice + ", quantityleft=" + quantityleft + ", description=" + description + ", starratings="
				+ starratings + ", totalreviews=" + totalreviews + ", seller=" + seller + ", product_images="
				+ product_images + ", product_reviews=" + product_reviews + " ]";
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public Date getManufactured_date() {
		return manufactured_date;
	}

	public void setManufactured_date(Date manufactured_date) {
		this.manufactured_date = manufactured_date;
	}

	public List<Label> getLabels() {
		return labels;
	}

	public void setLabels(List<Label> labels) {
		this.labels = labels;
	}

	

	
	
	
	
	
}
