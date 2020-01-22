package _model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PurchaseRequest")
public class PurchaseRequestBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pRequestId;
	private Integer proposalerId;
	private Timestamp requestTime;
	private String purchaseReason;
	private Integer approverId;
	private String responseComment;
	private Timestamp responseTime;
	private Timestamp readTime;
	private Integer requestStatus;
	private Double totalPrice;
	
	public PurchaseRequestBean() {
	}

	public PurchaseRequestBean(Integer proposalerId, Timestamp requestTime, String purchaseReason, Integer approverId,
			String responseComment, Timestamp responseTime, Timestamp readTime, Integer requestStatus, Double totalPrice) {
		super();
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.purchaseReason = purchaseReason;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
		this.totalPrice = totalPrice;
		this.setRequestStatus(requestStatus);
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getpRequestId() {
		return pRequestId;
	}

	public void setpRequestId(Integer pRequestId) {
		this.pRequestId = pRequestId;
	}

	public Integer getProposalerId() {
		return proposalerId;
	}

	public void setProposalerId(Integer proposalerId) {
		this.proposalerId = proposalerId;
	}

	public Timestamp getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Timestamp requestTime) {
		this.requestTime = requestTime;
	}

	public Integer getApproverId() {
		return approverId;
	}

	public void setApproverId(Integer approverId) {
		this.approverId = approverId;
	}

	public String getResponseComment() {
		return responseComment;
	}

	public void setResponseComment(String responseComment) {
		this.responseComment = responseComment;
	}

	public Timestamp getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(Timestamp responseTime) {
		this.responseTime = responseTime;
	}

	public Timestamp getReadTime() {
		return readTime;
	}

	public void setReadTime(Timestamp readTime) {
		this.readTime = readTime;
	}

	public String getPurchaseReason() {
		return purchaseReason;
	}

	public void setPurchaseReason(String purchaseReason) {
		this.purchaseReason = purchaseReason;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}
}
