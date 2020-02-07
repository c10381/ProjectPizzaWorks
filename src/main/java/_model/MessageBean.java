package _model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MessageStore")
public class MessageBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer messageId;
	private String from;
	private String to;
	private String text;
	private String date;
	private Integer beenRead;
	public MessageBean() {
		
	}
	public MessageBean(String from, String to, String text, String date, Integer beenRead) {
		this.from = from;
		this.to = to;
		this.text = text;
		this.date = date;
		this.beenRead = beenRead;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	@Column(name="fromEmail")
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	@Column(name="toEmail")
	public String getTo() {
		return to;
	}
	public void setTo(String toEmail) {
		this.to = toEmail;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Column(name="date", columnDefinition="datetime")
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Integer getBeenRead() {
		return beenRead;
	}
	public void setBeenRead(Integer beenRead) {
		this.beenRead = beenRead;
	}
	@Override
	public String toString() {
		return "MessageBean [messageId=" + messageId + ", fromEmail=" + from + ", toEmail=" + to + ", text=" + text
				+ ", date=" + date + ", beenRead=" + beenRead + "]";
	}
	
}
