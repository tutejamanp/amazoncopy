package ooad.amazon.com.bean;
import javax.persistence.CascadeType;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Category{
	
	public Category() {
		super();
	}
	public Category(String categoryname) {
		this.categoryname = categoryname;
	}
	
	private String categoryname;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int cat_id ;
	@ManyToOne(cascade={CascadeType.ALL})
	@JoinColumn(name="super_cat_id")
	private Category super_cat;

	
	public String getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}
	public int getCat_id() {
		return cat_id;
	}
	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}
	public Category getSuper_cat() {
		return super_cat;
	}
	public void setSuper_cat(Category super_cat) {
		this.super_cat = super_cat;
	}
}
