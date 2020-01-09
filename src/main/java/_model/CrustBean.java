package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Crust")
public class CrustBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer crustId;
	private Integer materialsId;
	private double quantity;
	
	public CrustBean() {}
	
	public CrustBean(Integer materialsId, double quantity) {
		this.materialsId = materialsId;
		this.quantity = quantity;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
