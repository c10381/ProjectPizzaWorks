package _model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table
@Entity(name="SalesListDetail")
public class SalesListDetailBean {
	private Integer salesListDetailId;
//	private Integer salesListId;
	private Integer materialsId;
	private double quantity;
	private String unit;
	private SalesListBean salesList;
	
	public SalesListDetailBean() {}

	public SalesListDetailBean(Integer materialsId, double quantity, String unit) {
		this.materialsId = materialsId;
		this.quantity = quantity;
		this.unit = unit;
	}
	
//	public SalesListDetailBean(Integer salesListId, Integer materialsId, double quantity, String unit) {
//		this.salesListId = salesListId;
//		this.materialsId = materialsId;
//		this.quantity = quantity;
//		this.unit = unit;
//	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getSalesListDetailId() {
		return salesListDetailId;
	}

	public void setSalesListDetailId(Integer salesListDetailId) {
		this.salesListDetailId = salesListDetailId;
	}
	
//	public Integer getSalesListId() {
//		return salesListId;
//	}
//
//	public void setSalesListId(Integer salesListId) {
//		this.salesListId = salesListId;
//	}

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
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="salesListId", nullable=false)
	public SalesListBean getSalesList() {
		return salesList;
	}

	public void setSalesList(SalesListBean salesList) {
		this.salesList = salesList;
	}
}
