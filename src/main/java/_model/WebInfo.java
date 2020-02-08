package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="WebInfo")
public class WebInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	//店名 電話 地址 email  營業日起 營業日End 營業時起 營業End 關於我們 品牌故事標 品牌故事內文 (edited)
	//storeName phone address email 
	//businessdayStart businessdayEnd aboutUs 
	//brandStory
	//brandstoryEdited

	private Integer webInfoId;
	private String storeName;
	private Integer phone;
	private String address;
	private String email;
	private String businessdayStart;
	private String businessdayEnd;
	private String businessdayStartTime;
	private String businessdayEndTime;
	private String brandStory;
	private String brandstoryEdited;
	public WebInfo() {}
	
	public WebInfo(String storeName, Integer phone, String address, String email, String businessdayStart,
			String businessdayEnd, String businessdayStartTime, String businessdayEndTime, String brandStory,
			String brandstoryEdited) {
		super();
		this.storeName = storeName;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.businessdayStart = businessdayStart;
		this.businessdayEnd = businessdayEnd;
		this.businessdayStartTime = businessdayStartTime;
		this.businessdayEndTime = businessdayEndTime;
		this.brandStory = brandStory;
		this.brandstoryEdited = brandstoryEdited;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getWebInfoId() {
		return webInfoId;
	}


	public void setWebInfoId(Integer webInfoId) {
		this.webInfoId = webInfoId;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public Integer getPhone() {
		return phone;
	}


	public void setPhone(Integer phone) {
		this.phone = phone;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	
	public String getBusinessdayStart() {
		return businessdayStart;
	}


	public void setBusinessdayStart(String businessdayStart) {
		this.businessdayStart = businessdayStart;
	}


	public String getBusinessdayEnd() {
		return businessdayEnd;
	}


	public void setBusinessdayEnd(String businessdayEnd) {
		this.businessdayEnd = businessdayEnd;
	}


	public String getBusinessdayStartTime() {
		return businessdayStartTime;
	}


	public void setBusinessdayStartTime(String businessdayStartTime) {
		this.businessdayStartTime = businessdayStartTime;
	}


	public String getBusinessdayEndTime() {
		return businessdayEndTime;
	}


	public void setBusinessdayEndTime(String businessdayEndTime) {
		this.businessdayEndTime = businessdayEndTime;
	}


	public String getBrandStory() {
		return brandStory;
	}


	public void setBrandStory(String brandStory) {
		this.brandStory = brandStory;
	}


	public String getBrandstoryEdited() {
		return brandstoryEdited;
	}


	public void setBrandstoryEdited(String brandstoryEdited) {
		this.brandstoryEdited = brandstoryEdited;
	}
	

	
}
