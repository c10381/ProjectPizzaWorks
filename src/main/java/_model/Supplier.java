package _model;

public class Supplier {
	private Integer supplierId;
	private String companyName;
	private String phone;
	
	public Supplier() {}
	
	public Supplier(String companyName, String phone) {
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
