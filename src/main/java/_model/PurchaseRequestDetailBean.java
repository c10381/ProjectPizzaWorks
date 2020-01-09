package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name="PurchaseRequestDetail")
public class PurchaseRequestDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pRequestDetailId;
	private Integer pRequestId;
	private Integer materialsId;
	private double unitPrice;
	private Integer quantity;
	
	public PurchaseRequestDetailBean() {}

	public PurchaseRequestDetailBean(Integer pRequestId, Integer materialsId, double unitPrice, Integer quantity) {
		this.pRequestId = pRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getpRequestDetailId() {
		return pRequestDetailId;
	}

	public void setpRequestDetailId(Integer pRequestDetailId) {
		this.pRequestDetailId = pRequestDetailId;
	}
	
	public Integer getpRequestId() {
		return pRequestId;
	}

	public void setpRequestId(Integer pRequestId) {
		this.pRequestId = pRequestId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
