package _model;

import java.io.Serializable;

public class MaterialsUnitBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer materials;
	private double quantityPerUnit;
	private String unit;
	
	public MaterialsUnitBean() {}
	
	public MaterialsUnitBean(Integer materials, double quantityPerUnit, String unit) {
		this.materials = materials;
		this.quantityPerUnit = quantityPerUnit;
		this.unit = unit;
	}

	public Integer getMaterials() {
		return materials;
	}

	public void setMaterials(Integer materials) {
		this.materials = materials;
	}

	public double getQuantityPerUnit() {
		return quantityPerUnit;
	}

	public void setQuantityPerUnit(double quantityPerUnit) {
		this.quantityPerUnit = quantityPerUnit;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
}
