package _model;

public class PurchaseRequestDetail {
	private Integer pRequestId;
	private Integer materialsId;
	private double unitPrice;
	private Integer quantity;
	
	public PurchaseRequestDetail() {}

	public PurchaseRequestDetail(Integer pRequestId, Integer materialsId, double unitPrice, Integer quantity) {
		this.pRequestId = pRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}

	public Integer getpRequestId() {
		return pRequestId;
	}

	public void setpRequestId(Integer pRequestId) {
		this.pRequestId = pRequestId;
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
