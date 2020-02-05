package _model;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="PurchaseRequestDetail")
public class PurchaseRequestDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pRequestDetailId;
	private Integer pRequestId;
	private Integer materialsId;
	private Double unitPrice;
	private Integer quantity;
	private Integer actualQuantity;
//	private PurchaseRequestBean purchaseRequest;
	
	public PurchaseRequestDetailBean() {}

	public PurchaseRequestDetailBean(Integer pRequestId, Integer materialsId, double unitPrice, Integer quantity) {
		this.pRequestId = pRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.actualQuantity = actualQuantity;
	}
	public PurchaseRequestDetailBean(Integer materialsId, Double unitPrice, Integer quantity, Integer actualQuantity) {
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.actualQuantity = actualQuantity;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getpRequestDetailId() {
		return pRequestDetailId;
	}

	public void setpRequestDetailId(Integer pRequestDetailId) {
		this.pRequestDetailId = pRequestDetailId;
	}
	
//	@Transient
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

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
//	@ManyToOne(cascade=CascadeType.PERSIST)
//	@JoinColumn(name="pRequestId", nullable=false)
//	public PurchaseRequestBean getPurchaseRequest() {
//		return purchaseRequest;
//	}
//
//	public void setPurchaseRequest(PurchaseRequestBean purchaseRequest) {
//		this.purchaseRequest = purchaseRequest;
//	}

	public Integer getActualQuantity() {
		return actualQuantity;
	}

	public void setActualQuantity(Integer actualQuantity) {
		this.actualQuantity = actualQuantity;
	}

	@Override
	public String toString() {
		return "PurchaseRequestDetailBean [pRequestDetailId=" + pRequestDetailId + ", pRequestId=" + pRequestId
				+ ", materialsId=" + materialsId + ", unitPrice=" + unitPrice + ", quantity=" + quantity
				+ ", actualQuantity=" + actualQuantity + "]";
	}
}
