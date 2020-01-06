package _model;

public class Crust {
	private Integer crustId;
	private Integer materialsId;
	private double quantity;
	
	public Crust() {}
	
	public Crust(Integer materialsId, double quantity) {
		this.materialsId = materialsId;
		this.quantity = quantity;
	}

	public Integer getCrustId() {
		return crustId;
	}

	public void setCrustId(Integer crustId) {
		this.crustId = crustId;
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
	
}
