package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name="StockRequestDetail")
public class StockRequestDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer sRequestDetailId;
	private Integer sRequestId;
	private Integer materialsId;
	private Double unitPrice;
	private Integer quantity;
	
	public StockRequestDetailBean() {}

	public StockRequestDetailBean(Integer sRequestId, Integer materialsId, Double unitPrice, Integer quantity) {
		this.sRequestId = sRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getsRequestDetailId() {
		return sRequestDetailId;
	}

	public void setsRequestDetailId(Integer sRequestDetailId) {
		this.sRequestDetailId = sRequestDetailId;
	}
	
	public Integer getsRequestId() {
		return sRequestId;
	}

	public void setsRequestId(Integer sRequestId) {
		this.sRequestId = sRequestId;
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
}
