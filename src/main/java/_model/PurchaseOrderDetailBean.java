package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name="PurchaseOrderDetail")
public class PurchaseOrderDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pOrderDetailId;
	private Integer pOrderId;
	private Integer materialsId;
	private Double quantity;
	private Double price;
	
	public PurchaseOrderDetailBean() {}

	public PurchaseOrderDetailBean(Integer pOrderId, Integer materialsId, Double price, Double quantity) {
		this.pOrderId = pOrderId;
		this.materialsId = materialsId;
		this.price = price;
		this.quantity = quantity;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getpOrderDetailId() {
		return pOrderDetailId;
	}

	public void setpOrderDetailId(Integer pOrderDetailId) {
		this.pOrderDetailId = pOrderDetailId;
	}

	public Integer getpOrderId() {
		return pOrderId;
	}

	public void setpOrderId(Integer pOrderId) {
		this.pOrderId = pOrderId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public double gePrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getQuantity() {
		return quantity;
	}

	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	
}
