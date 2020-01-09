package _model;

public class SalesListDetail {
	private Integer salesListId;
	private Integer materialsId;
	private double quantity;
	private String unit;
	
	public SalesListDetail() {}

	public SalesListDetail(Integer salesListId, Integer materialsId, double quantity, String unit) {
		super();
		this.salesListId = salesListId;
		this.materialsId = materialsId;
		this.quantity = quantity;
		this.unit = unit;
	}

	public Integer getSalesListId() {
		return salesListId;
	}

	public void setSalesListId(Integer salesListId) {
		this.salesListId = salesListId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
}
