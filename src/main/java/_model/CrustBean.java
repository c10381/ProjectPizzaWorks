package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Crust")
public class CrustBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer crustId;
	private Integer crustTypeId;
	private String crustTypeName;
	private Integer materialsId;
	private double quantity;
	private Integer unitPrice;
	
	public CrustBean() {}
	
	public CrustBean(Integer crustTypeId, String crustTypeName, Integer materialsId, double quantity,
			Integer unitPrice) {
		this.crustTypeId = crustTypeId;
		this.crustTypeName = crustTypeName;
		this.materialsId = materialsId;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getCrustId() {
		return crustId;
	}

	public void setCrustId(Integer crustId) {
		this.crustId = crustId;
	}

	public Integer getCrustTypeId() {
		return crustTypeId;
	}

	public void setCrustTypeId(Integer crustTypeId) {
		this.crustTypeId = crustTypeId;
	}

	public String getCrustTypeName() {
		return crustTypeName;
	}

	public void setCrustTypeName(String crustTypeName) {
		this.crustTypeName = crustTypeName;
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

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	
}
