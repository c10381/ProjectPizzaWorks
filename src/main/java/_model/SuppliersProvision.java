package _model;

public class SuppliersProvision {
	private Integer supplierId;
	private Integer materialId;
	private double unitPrice;
	
	public SuppliersProvision() {
	}

	public SuppliersProvision(Integer supplierId, Integer materialId, double unitPrice) {
		this.supplierId = supplierId;
		this.materialId = materialId;
		this.unitPrice = unitPrice;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public Integer getMaterialId() {
		return materialId;
	}

	public void setMaterialId(Integer materialId) {
		this.materialId = materialId;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	
}
