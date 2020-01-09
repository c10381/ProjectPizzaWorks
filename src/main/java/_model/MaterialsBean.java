package _model;

import java.io.Serializable;

public class MaterialsBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer materialsId;
	private String materialsName;
	private double quantity;
	private Integer reorderLevel;
	private Integer	supplierId;
	private Integer unitOnOrder;
	private String unit;
	
	public MaterialsBean() {}

	public MaterialsBean(String materialsName, double quantity, Integer reorderLevel, Integer supplierId,
			Integer unitOnOrder, String unit) {
		this.materialsName = materialsName;
		this.quantity = quantity;
		this.reorderLevel = reorderLevel;
		this.supplierId = supplierId;
		this.unitOnOrder = unitOnOrder;
		this.unit = unit;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public String getMaterialsName() {
		return materialsName;
	}

	public void setMaterialsName(String materialsName) {
		this.materialsName = materialsName;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public Integer getReorderLevel() {
		return reorderLevel;
	}

	public void setReorderLevel(Integer reorderLevel) {
		this.reorderLevel = reorderLevel;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public Integer getUnitOnOrder() {
		return unitOnOrder;
	}

	public void setUnitOnOrder(Integer unitOnOrder) {
		this.unitOnOrder = unitOnOrder;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
}
