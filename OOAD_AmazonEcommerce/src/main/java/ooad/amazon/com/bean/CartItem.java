package ooad.amazon.com.bean;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Embeddable
public class CartItem{

	
	private int quantity;
	private int freequantity = 0;
	
	public int getFreequantity() {
		return freequantity;
	}

	public void setFreequantity(int freequantity) {
		this.freequantity = freequantity;
	}

	@OneToOne
	private Product product;
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	

	

	public CartItem(int quantity, Product product) {
		super();
		this.quantity = quantity;
		this.product = product;
	}

	public CartItem() {
		super();
	}

	
		
}
