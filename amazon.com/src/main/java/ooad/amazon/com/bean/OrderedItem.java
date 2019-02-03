package ooad.amazon.com.bean;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;

@Embeddable
public class OrderedItem {

	private int productid;
	private int quantity;
	private int unitamount;
	private int unitdiscountedamount;
	
	public OrderedItem() {
		super();
	}
	
	public OrderedItem(int productid, int quantity, int unitamount, int unitdiscountedamount) {
		super();
		this.productid = productid;
		this.quantity = quantity;
		this.unitamount = unitamount;
		this.unitdiscountedamount = unitdiscountedamount;
	}
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitamount() {
		return unitamount;
	}
	public void setUnitamount(int unitamount) {
		this.unitamount = unitamount;
	}
	public int getUnitdiscountedamount() {
		return unitdiscountedamount;
	}
	public void setUnitdiscountedamount(int unitdiscountedamount) {
		this.unitdiscountedamount = unitdiscountedamount;
	}
	
	
	
	
	
}
