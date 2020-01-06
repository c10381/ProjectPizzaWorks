package _model;

public class Product {
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
	
	public Product() {}
	
	public Product(String productName, String briefInfo, Integer unitPrice, Integer activeStatus,
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
}
