package _model;

public class StockRequestDetail {
	private Integer sRequestId;
	private Integer materialsId;
	private double unitPrice;
	private Integer quantity;
	
	public StockRequestDetail() {}

	public StockRequestDetail(Integer sRequestId, Integer materialsId, double unitPrice, Integer quantity) {
		this.sRequestId = sRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}

	public Integer getsRequestId() {
		return sRequestId;
	}

	public void setsRequestId(Integer sRequestId) {
		this.sRequestId = sRequestId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
