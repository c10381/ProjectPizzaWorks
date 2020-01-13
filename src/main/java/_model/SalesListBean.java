package _model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="SalesList")
public class SalesListBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer salesListId;
	private Integer memberId;
	private Timestamp orderTime;
	private Integer totalSales;
	private Integer salesOrderId;
	private List<SalesListDetailBean> salesListDetails = new ArrayList<>();
	
	public SalesListBean() {}

	public SalesListBean(Integer memberId, Timestamp orderTime, Integer totalSales, Integer salesOrderId) {
		this.memberId = memberId;
		this.orderTime = orderTime;
		this.totalSales = totalSales;
		this.salesOrderId = salesOrderId;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	@OneToMany(mappedBy="salesList", cascade= {CascadeType.ALL})
	public List<SalesListDetailBean> getSalesListDetails() {
		return salesListDetails;
	}

	public void setSalesListDetails(List<SalesListDetailBean> salesListDetails) {
		this.salesListDetails = salesListDetails;
	}
}
