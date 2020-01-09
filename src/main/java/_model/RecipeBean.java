package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Recipe")
public class RecipeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer recipeId;
	private Integer productId;
	private Integer materialsId;
	private double quantity;
	private String unit;
	
	public RecipeBean() {}
	
	public RecipeBean(Integer materialsId, double quantity, String unit) {
		this.materialsId = materialsId;
		this.quantity = quantity;
		this.unit = unit;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(Integer recipeId) {
		this.recipeId = recipeId;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
}
