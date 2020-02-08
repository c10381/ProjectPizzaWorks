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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "StockRequest")
public class StockRequestBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer sRequestId;
	private Integer pOrderId;
	private Integer proposalerId;
	private String requestTime;
	private String briefInfo;
	private Integer approverId;
	private String responseComment;
	private String responseTime;
	private String readTime;
	private Integer requestStatus;
	
	private List<StockRequestDetailBean> stockRequestDetails = new ArrayList<>();
	
	public StockRequestBean() {
	}

	public StockRequestBean(Integer pOrderId, Integer proposalerId, String requestTime, String briefInfo, Integer approverId,
			String responseComment, String responseTime, String readTime ,Integer requestStatus) {
		this.pOrderId = pOrderId;
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.briefInfo = briefInfo;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
		this.requestStatus = requestStatus;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getsRequestId() {
		return sRequestId;
	}

	public Integer getpOrderId() {
		return pOrderId;
	}

	public void setpOrderId(Integer pOrderId) {
		this.pOrderId = pOrderId;
	}
	
	public void setsRequestId(Integer sRequestId) {
		this.sRequestId = sRequestId;
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

	public String getBriefInfo() {
		return briefInfo;
	}

	public void setBriefInfo(String briefInfo) {
		this.briefInfo = briefInfo;
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

	public Integer getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}

	@OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH,CascadeType.DETACH }, fetch = FetchType.EAGER)
	@JoinColumn(name="sRequestId", referencedColumnName="sRequestId")
	public List<StockRequestDetailBean> getStockRequestDetails() {
		return stockRequestDetails;
	}

	public void setStockRequestDetails(List<StockRequestDetailBean> stockRequestDetails) {
		this.stockRequestDetails = stockRequestDetails;
	}

	@Override
	public String toString() {
		return "StockRequestBean [sRequestId=" + sRequestId + ", pOrderId=" + pOrderId + ", proposalerId="
				+ proposalerId + ", requestTime=" + requestTime + ", briefInfo=" + briefInfo + ", approverId="
				+ approverId + ", responseComment=" + responseComment + ", responseTime=" + responseTime + ", readTime="
				+ readTime + ", requestStatus=" + requestStatus + ", stockRequestDetails=" + stockRequestDetails + "]";
	}
}
