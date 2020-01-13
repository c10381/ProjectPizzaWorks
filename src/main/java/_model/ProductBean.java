package _model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Product")
public class ProductBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer productId;
	private String productName;
	private String briefInfo;
	private Integer unitPrice; 
	private Integer activeStatus;
	private Integer spicyLevel;
	private Integer vegetableOnly;
	private Integer seafood;
	private Integer pork;
	private Integer beef;
	private Integer chicken;
	private String imagePath;
	
	private List<RecipeBean> recipes = new ArrayList<>();
	
	public ProductBean() {}
	
	public ProductBean(String productName, String briefInfo, Integer unitPrice, Integer activeStatus,
			Integer spicyLevel, Integer vegetableOnly, Integer seafood, Integer pork, Integer beef, Integer chicken,
			String imagePath) {
		this.productName = productName;
		this.briefInfo = briefInfo;
		this.unitPrice = unitPrice;
		this.activeStatus = activeStatus;
		this.spicyLevel = spicyLevel;
		this.vegetableOnly = vegetableOnly;
		this.seafood = seafood;
		this.pork = pork;
		this.beef = beef;
		this.chicken = chicken;
		this.imagePath = imagePath;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBriefInfo() {
		return briefInfo;
	}

	public void setBriefInfo(String briefInfo) {
		this.briefInfo = briefInfo;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(Integer activeStatus) {
		this.activeStatus = activeStatus;
	}

	public Integer getSpicyLevel() {
		return spicyLevel;
	}

	public void setSpicyLevel(Integer spicyLevel) {
		this.spicyLevel = spicyLevel;
	}

	public Integer getVegetableOnly() {
		return vegetableOnly;
	}

	public void setVegetableOnly(Integer vegetableOnly) {
		this.vegetableOnly = vegetableOnly;
	}

	public Integer getSeafood() {
		return seafood;
	}

	public void setSeafood(Integer seafood) {
		this.seafood = seafood;
	}

	public Integer getPork() {
		return pork;
	}

	public void setPork(Integer pork) {
		this.pork = pork;
	}

	public Integer getBeef() {
		return beef;
	}

	public void setBeef(Integer beef) {
		this.beef = beef;
	}

	public Integer getChicken() {
		return chicken;
	}

	public void setChicken(Integer chicken) {
		this.chicken = chicken;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	@Override
	public String toString() {
		return "ProductBean [productId=" + productId + ", productName=" + productName + ", briefInfo=" + briefInfo
				+ ", unitPrice=" + unitPrice + ", activeStatus=" + activeStatus + ", spicyLevel=" + spicyLevel
				+ ", vegetableOnly=" + vegetableOnly + ", seafood=" + seafood + ", pork=" + pork + ", beef=" + beef
				+ ", chicken=" + chicken + ", imagePath=" + imagePath + ", recipes=" + recipes + "]";
	}

	@OneToMany(mappedBy="product", cascade= {CascadeType.ALL}, fetch=FetchType.EAGER)
	public List<RecipeBean> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<RecipeBean> recipes) {
		this.recipes = recipes;
	}
	
}
