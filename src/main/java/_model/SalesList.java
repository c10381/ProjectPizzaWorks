package _model;

import java.sql.Timestamp;

public class SalesList {
	private Integer salesListId;
	private Integer memberId;
	private Timestamp orderTime;
	private Integer totalSales;
	private Integer salesOrderId;
	
	public SalesList() {}

	public SalesList(Integer memberId, Timestamp orderTime, Integer totalSales, Integer salesOrderId) {
		super();
		this.memberId = memberId;
		this.orderTime = orderTime;
		this.totalSales = totalSales;
		this.salesOrderId = salesOrderId;
	}

	public Integer getSalesListId() {
		return salesListId;
	}

	public void setSalesListId(Integer salesListId) {
		this.salesListId = salesListId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Timestamp getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Timestamp orderTime) {
		this.orderTime = orderTime;
	}

	public Integer getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(Integer totalSales) {
		this.totalSales = totalSales;
	}

	public Integer getSalesOrderId() {
		return salesOrderId;
	}

	public void setSalesOrderId(Integer salesOrderId) {
		this.salesOrderId = salesOrderId;
	}
}
