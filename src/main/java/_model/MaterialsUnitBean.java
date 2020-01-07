package _model;

import java.io.Serializable;

public class MaterialsUnitBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer materials;
	private double quantityPerUnit;
	
	public MaterialsUnitBean() {}
	
	public MaterialsUnitBean(Integer materials, double quantityPerUnit) {
		this.materials = materials;
		this.quantityPerUnit = quantityPerUnit;
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
	
}
