package _model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PurchaseRequest")
public class PurchaseRequestBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pRequestId;
	private Integer proposalerId;
	private String requestTime;
	private String purchaseReason;
	private Integer approverId;
	private String responseComment;
	private String responseTime;
	private String readTime;
	private Integer requestStatus;
	private Double totalPrice;
	private List<PurchaseRequestDetailBean> purchaseRequestDetails = new ArrayList<>();
	
	public PurchaseRequestBean() {
	}

	public PurchaseRequestBean(Integer proposalerId, String requestTime, String purchaseReason, Integer approverId,
			String responseComment, String responseTime, String readTime, Integer requestStatus, Double totalPrice) {
		super();
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.purchaseReason = purchaseReason;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
		this.requestStatus = requestStatus;
		this.totalPrice = totalPrice;
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
	@Column(name="requestTime", columnDefinition="datetime")
	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
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
	@Column(name="responseTime", columnDefinition="datetime") 
	public String getResponseTime() {
		return responseTime;
	}

	public void setResponseTime(String responseTime) {
		this.responseTime = responseTime;
	}
	@Column(name="readTime", columnDefinition="datetime")
	public String getReadTime() {
		return readTime;
	}

	public void setReadTime(String readTime) {
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

	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH,CascadeType.DETACH }, fetch = FetchType.EAGER)
	@JoinColumn(name="pRequestId", referencedColumnName="pRequestId")
	public List<PurchaseRequestDetailBean> getPurchaseRequestDetails() {
		return purchaseRequestDetails;
	}

	public void setPurchaseRequestDetails(List<PurchaseRequestDetailBean> purchaseRequestDetails) {
		this.purchaseRequestDetails = purchaseRequestDetails;
	}
}
