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
@Table(name="SalesOrderDetail")
public class SalesOrderDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer salesOrderDetailId;
//	private Integer salesOrderId;
	private Integer productId;
	private double unitPrice;
	private Integer quantity;
	private Integer doubleCheese;
	private Integer crustTypeId;
	private double discount;
	private SalesOrderBean salesOrder;
	
	public SalesOrderDetailBean() {} 
	
	public SalesOrderDetailBean(Integer productId, double unitPrice, Integer quantity,
			Integer doubleCheese, Integer crustTypeId, double discount) {
		this.productId = productId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.doubleCheese = doubleCheese;
		this.crustTypeId = crustTypeId;
		this.discount = discount;
	}
	
//	public SalesOrderDetailBean(Integer salesOrderId, Integer productId, double unitPrice, Integer quantity,
//			Integer doubleCheese, Integer crustId, double discount) {
//		this.salesOrderId = salesOrderId;
//		this.productId = productId;
//		this.unitPrice = unitPrice;
//		this.quantity = quantity;
//		this.doubleCheese = doubleCheese;
//		this.crustId = crustId;
//		this.discount = discount;
//	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getSalesOrderDetailId() {
		return salesOrderDetailId;
	}

	public void setSalesOrderDetailId(Integer salesOrderDetailId) {
		this.salesOrderDetailId = salesOrderDetailId;
	} 
	
//	public Integer getSalesOrderId() {
//		return salesOrderId;
//	}
//
//	public void setSalesOrderId(Integer salesOrderId) {
//		this.salesOrderId = salesOrderId;
//	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
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

	public Integer getDoubleCheese() {
		return doubleCheese;
	}

	public void setDoubleCheese(Integer doubleCheese) {
		this.doubleCheese = doubleCheese;
	}

	public Integer getCrustTypeId() {
		return crustTypeId;
	}

	public void setCrustTypeId(Integer crustId) {
		this.crustTypeId = crustId;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}
	
	@ManyToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="salesOrderId", nullable=false)
	public SalesOrderBean getSalesOrder() {
		return salesOrder;
	}

	public void setSalesOrder(SalesOrderBean salesOrder) {
		this.salesOrder = salesOrder;
	}

}
