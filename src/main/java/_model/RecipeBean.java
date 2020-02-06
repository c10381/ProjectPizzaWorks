package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Recipe")
public class RecipeBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer recipeId;
	private Integer productId;
	private Integer materialsId;
	private Double quantity;
	private String unit;
	
//	private ProductBean product;
	
	private MaterialsBean material;
	
	public RecipeBean() {}
	
	public RecipeBean(Double quantity, String unit) {
		this.quantity = quantity;
		this.unit = unit;
	}
	
	public RecipeBean(Integer productId, Integer materialsId, Double quantity, String unit) {
		this.productId = productId;
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
	
//	@Transient
	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	
	@Transient
	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
//	@ManyToOne
//	@JoinColumn(name="productId", nullable=false)
//	public ProductBean getProduct() {
//		return product;
//	}
//
//	public void setProduct(ProductBean product) {
//		this.product = product;
//	}
	
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="materialsId")
	public MaterialsBean getMaterial() {
		return material;
	}

	public void setMaterial(MaterialsBean material) {
		this.material = material;
	}
}
