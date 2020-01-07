package _model;

import java.io.Serializable;

public class SalesOrderDetailBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer salesOrderId;
	private Integer productId;
	private double unitPrice;
	private Integer quantity;
	private Integer doubleCheese;
	private Integer crustId;
	private double discount;
	
	public SalesOrderDetailBean() {} 
	
	public SalesOrderDetailBean(Integer salesOrderId, Integer productId, double unitPrice, Integer quantity,
			Integer doubleCheese, Integer crustId, double discount) {
		super();
		this.salesOrderId = salesOrderId;
		this.productId = productId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.doubleCheese = doubleCheese;
		this.crustId = crustId;
		this.discount = discount;
	}

	public Integer getSalesOrderId() {
		return salesOrderId;
	}

	public void setSalesOrderId(Integer salesOrderId) {
		this.salesOrderId = salesOrderId;
	}

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

	public Integer getCrustId() {
		return crustId;
	}

	public void setCrustId(Integer crustId) {
		this.crustId = crustId;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	} 
}
