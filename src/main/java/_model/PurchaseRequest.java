package _model;

import java.sql.Timestamp;

public class PurchaseRequest {
	private Integer pRequestId;
	private Integer proposalerId;
	private Timestamp requestTime;
	private String purchaseReason;
	private Integer approverId;
	private String responseComment;
	private Timestamp responseTime;
	private Timestamp readTime;
	private double totalPrice;
	
	public PurchaseRequest() {
	}

	public PurchaseRequest(Integer proposalerId, Timestamp requestTime, String purchaseReason, Integer approverId,
			String responseComment, Timestamp responseTime, Timestamp readTime, double totalPrice) {
		super();
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.purchaseReason = purchaseReason;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
		this.totalPrice = totalPrice;
	}

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

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
