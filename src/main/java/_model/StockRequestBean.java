package _model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table
@Entity(name = "StockRequest")
public class StockRequestBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer sRequestId;
	private Integer proposalerId;
	private String requestTime;
	private String briefInfo;
	private Integer approverId;
	private String responseComment;
	private String responseTime;
	private String readTime;

	public StockRequestBean() {
	}

	public StockRequestBean(Integer proposalerId, String requestTime, String briefInfo, Integer approverId,
			String responseComment, String responseTime, String readTime) {
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.briefInfo = briefInfo;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getsRequestId() {
		return sRequestId;
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

}
