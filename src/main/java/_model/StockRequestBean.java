package _model;

import java.io.Serializable;
import java.sql.Timestamp;

public class StockRequestBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer sRequestId;
	private Integer proposalerId;
	private Timestamp requestTime;
	private String briefInfo;
	private Integer approverId;
	private String responseComment;
	private Timestamp responseTime;
	private Timestamp readTime;
	
	public StockRequestBean() {
	}

	public StockRequestBean(Integer proposalerId, Timestamp requestTime, String briefInfo, Integer approverId,
			String responseComment, Timestamp responseTime, Timestamp readTime) {
		this.proposalerId = proposalerId;
		this.requestTime = requestTime;
		this.briefInfo = briefInfo;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.readTime = readTime;
	}

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

	public Timestamp getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Timestamp requestTime) {
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
	
	
}
