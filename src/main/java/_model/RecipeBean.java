package _model;

import java.io.Serializable;

public class RecipeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer productId;
	private Integer materialsId;
	private double quantity;
	
	public RecipeBean() {}
	
	public RecipeBean(Integer materialsId, double quantity) {
		this.materialsId = materialsId;
		this.quantity = quantity;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
}
