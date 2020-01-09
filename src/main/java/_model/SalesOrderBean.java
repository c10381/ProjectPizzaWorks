package _model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="SalesOrder")
public class SalesOrderBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer salesOrderId;
	private Integer memberId;
	private Timestamp orderTime;
	private Timestamp requireTime;
	private Integer needDelivery;
	private String deliverAddress;
	private Integer totalSales;
	private SalesOrderDetailBean salesOrderDetail;
	
	public SalesOrderBean() {}
	
	public SalesOrderBean(Integer memberId, Timestamp orderTime, Timestamp requireTime, Integer needDelivery,
			String deliverAddress, Integer totalSales) {
		this.memberId = memberId;
		this.orderTime = orderTime;
		this.requireTime = requireTime;
		this.needDelivery = needDelivery;
		this.deliverAddress = deliverAddress;
		this.totalSales = totalSales;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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

	public Integer getTotalSales() {
		return totalSales;
	}

	public void setTotalSales(Integer totalSales) {
		this.totalSales = totalSales;
	}
	
	@OneToMany(mappedBy="salesOrder", cascade= {CascadeType.ALL})
	public SalesOrderDetailBean getSalesOrderDetail() {
		return salesOrderDetail;
	}

	public void setSalesOrderDetail(SalesOrderDetailBean salesOrderDetail) {
		this.salesOrderDetail = salesOrderDetail;
	}
	
}
