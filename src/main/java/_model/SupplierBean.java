package _model;

import java.io.Serializable;

public class SupplierBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer supplierId;
	private String companyName;
	private String phone;
	
	public SupplierBean() {}
	
	public SupplierBean(String companyName, String phone) {
		this.companyName = companyName;
		this.phone = phone;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}
