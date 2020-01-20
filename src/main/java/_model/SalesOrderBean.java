package _model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
	private String orderTime;
	private String requireTime;
	private Integer needDelivery;
	private String deliverAddress;
	private Integer totalSales;
	private Integer orderStatus;
	private List<SalesOrderDetailBean> salesOrderDetails = new ArrayList<>();

	public SalesOrderBean() {}
	
	public SalesOrderBean(Integer memberId, String orderTime, String requireTime, Integer needDelivery,
			String deliverAddress, Integer totalSales,Integer orderStatus) {
		this.memberId = memberId;
		this.orderTime = orderTime;
		this.requireTime = requireTime;
		this.needDelivery = needDelivery;
		this.deliverAddress = deliverAddress;
		this.totalSales = totalSales;
		this.orderStatus = orderStatus;
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
	@Column(name="orderTime", columnDefinition="datetime")
	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}
	@Column(name="requireTime", columnDefinition="datetime")
	public String getRequireTime() {
		return requireTime;
	}

	public void setRequireTime(String requireTime) {
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
	
	@OneToMany(mappedBy="salesOrder", cascade= {CascadeType.ALL}, fetch=FetchType.EAGER)
	public List<SalesOrderDetailBean> getSalesOrderDetails() {
		return salesOrderDetails;
	}

	public void setSalesOrderDetails(List<SalesOrderDetailBean> salesOrderDetails) {
		this.salesOrderDetails = salesOrderDetails;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
}
