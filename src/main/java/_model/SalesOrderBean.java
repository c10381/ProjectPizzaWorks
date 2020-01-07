package _model;

import java.io.Serializable;
import java.sql.Timestamp;

public class SalesOrderBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer salesOrderId;
	private Integer memberId;
	private Timestamp orderTime;
	private Timestamp requireTime;
	private Integer needDelivery;
	private String deliverAddress;
	
	public SalesOrderBean() {}
	
	public SalesOrderBean(Integer memberId, Timestamp orderTime, Timestamp requireTime, Integer needDelivery,
			String deliverAddress) {
		this.memberId = memberId;
		this.orderTime = orderTime;
		this.requireTime = requireTime;
		this.needDelivery = needDelivery;
		this.deliverAddress = deliverAddress;
	}

	public Integer getSalesOrderId() {
		return salesOrderId;
	}

	public void setSalesOrderId(Integer salesOrderId) {
		this.salesOrderId = salesOrderId;
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

	public Timestamp getRequireTime() {
		return requireTime;
	}

	public void setRequireTime(Timestamp requireTime) {
		this.requireTime = requireTime;
	}

	public Integer getNeedDelivery() {
		return needDelivery;
	}

	public void setNeedDelivery(Integer needDelivery) {
		this.needDelivery = needDelivery;
	}

	public String getDeliverAddress() {
		return deliverAddress;
	}

	public void setDeliverAddress(String deliverAddress) {
		this.deliverAddress = deliverAddress;
	}
	
}
