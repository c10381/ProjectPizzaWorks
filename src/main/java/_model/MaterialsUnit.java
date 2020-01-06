package _model;

public class MaterialsUnit {
	private Integer materials;
	private double quantityPerUnit;
	
	public MaterialsUnit() {}
	
	public MaterialsUnit(Integer materials, double quantityPerUnit) {
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
