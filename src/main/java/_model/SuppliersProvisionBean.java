package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SuppliersProvision")
public class SuppliersProvisionBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer suppliersProvisionId;
	private Integer supplierId;
	private Integer materialId;
	private double unitPrice;
	
	public SuppliersProvisionBean() {
	}

	public SuppliersProvisionBean(Integer supplierId, Integer materialId, double unitPrice) {
		this.supplierId = supplierId;
		this.materialId = materialId;
		this.unitPrice = unitPrice;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getSuppliersProvisionId() {
		return suppliersProvisionId;
	}

	public void setSuppliersProvisionId(Integer suppliersProvisionId) {
		this.suppliersProvisionId = suppliersProvisionId;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public Integer getMaterialId() {
		return materialId;
	}

	public void setMaterialId(Integer materialId) {
		this.materialId = materialId;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	
}
