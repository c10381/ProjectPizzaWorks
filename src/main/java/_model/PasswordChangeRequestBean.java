package _model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PasswordChangeRequest")
public class PasswordChangeRequestBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer pcRequestId;
	private String email;
	private Timestamp requestTime;
	private Integer approverId;
	private String responseComment;
	private Timestamp responseTime;
	private Integer requestStatus;
	
	public PasswordChangeRequestBean() {

	}

	public PasswordChangeRequestBean(String email, Timestamp requestTime, Integer approverId, String responseComment,
			Timestamp responseTime, Integer requestStatus) {
		super();
		this.email = email;
		this.requestTime = requestTime;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.requestStatus = requestStatus;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getPcRequestId() {
		return pcRequestId;
	}

	public void setPcRequestId(Integer pcRequestId) {
		this.pcRequestId = pcRequestId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Integer getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}
	
}
