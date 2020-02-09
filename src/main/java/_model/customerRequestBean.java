package _model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="CustomerRequest")
public class customerRequestBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer queryId;
	public String memberEmail;
	@Column(columnDefinition ="NVARCHAR(MAX)")
	public String queryContent;
	@Column(columnDefinition = "DATETIME")
	public String queryDate;
	public Integer replyStatus;
	
	public Integer coworkerID;
	@Column(columnDefinition ="NVARCHAR(MAX)")
	public String replyContent;
	
	@Column(columnDefinition = "DATETIME")
	public String replyDate;

	public customerRequestBean() {}
	
	
	public customerRequestBean(String memberEmail, String queryContent, String queryDate,
			Integer replyStatus, Integer coworkerID, String replyContent, String replyDate) {
		
		this.memberEmail = memberEmail;
		this.queryContent = queryContent;
		this.queryDate = queryDate;
		this.replyStatus = replyStatus;
		this.coworkerID = coworkerID;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
	}

	public Integer getQueryId() {
		return queryId;
	}

	public void setQueryId(Integer queryId) {
		this.queryId = queryId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getQueryContent() {
		return queryContent;
	}

	public void setQueryContent(String queryContent) {
		this.queryContent = queryContent;
	}

	public String getQueryDate() {
		return queryDate;
	}

	public void setQueryDate(String queryDate) {
		this.queryDate = queryDate;
	}

	public Integer getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(Integer replyStatus) {
		this.replyStatus = replyStatus;
	}

	public Integer getCoworkerID() {
		return coworkerID;
	}

	public void setCoworkerID(Integer coworkerID) {
		this.coworkerID = coworkerID;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	
	
	
}
