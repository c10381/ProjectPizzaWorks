package _model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MaterialsUnit")
public class MaterialsUnitBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer materialsUnitId;
	private Integer materialsId;
	private double quantityPerUnit;
	private String unit;
	
	public MaterialsUnitBean() {}
	
	public MaterialsUnitBean(Integer materialsId, double quantityPerUnit, String unit) {
		this.setMaterialsId(materialsId);
		this.quantityPerUnit = quantityPerUnit;
		this.unit = unit;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMaterialsUnitId() {
		return materialsUnitId;
	}

	public void setMaterialsUnitId(Integer materialsUnitId) {
		this.materialsUnitId = materialsUnitId;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
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
