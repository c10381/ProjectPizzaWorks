package _model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="ValidationRequest")
public class ValidationRequestBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer vRequestId;
	private String email;
	private String requestTime;
	private Integer approverId;
	private String responseComment;
	private String responseTime;
	private Integer requestStatus;
	private String validationCode;
	private MembersBean approver;
	
	public ValidationRequestBean() {

	}

	public ValidationRequestBean(String email, String requestTime, Integer approverId, String responseComment,
			String responseTime, Integer requestStatus, String validationCode) {
		this.email = email;
		this.requestTime = requestTime;
		this.approverId = approverId;
		this.responseComment = responseComment;
		this.responseTime = responseTime;
		this.requestStatus = requestStatus;
		this.validationCode = validationCode;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getvRequestId() {
		return vRequestId;
	}

	public void setvRequestId(Integer vRequestId) {
		this.vRequestId = vRequestId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequestTime() {
		return requestTime;
	}
	
	@Column(name="requestTime", columnDefinition="datetime")
	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}
	
	@Transient
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

	public Integer getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(Integer requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getValidationCode() {
		return validationCode;
	}

	public void setValidationCode(String validationCode) {
		this.validationCode = validationCode;
	}
	
	@OneToOne(cascade=CascadeType.PERSIST)
	@JoinColumn(name="appoverId")
	public MembersBean getApprover() {
		return approver;
	}

	public void setApprover(MembersBean approver) {
		this.approver = approver;
	}
	
}