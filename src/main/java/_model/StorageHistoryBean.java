package _model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="StorageHistory")
public class StorageHistoryBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer storageHistoryId;
	private Integer sRequestId;
	private Integer materialsId;
	private double unitPrice;
	private double quantity;
	private double remainingQuantity;
	private Timestamp stockTime;
	private Timestamp expiryTime;
	private String unit;
	
	public StorageHistoryBean() {}
	
	public StorageHistoryBean(Integer sRequestId, Integer materialsId, double unitPrice, double quantity,
			double remainingQuantity, Timestamp stockTime, Timestamp expiryTime, String unit) {
		this.sRequestId = sRequestId;
		this.materialsId = materialsId;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.remainingQuantity = remainingQuantity;
		this.stockTime = stockTime;
		this.expiryTime = expiryTime;
		this.unit = unit;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getStorageHistoryId() {
		return storageHistoryId;
	}

	public void setStorageHistoryId(Integer storageHistoryId) {
		this.storageHistoryId = storageHistoryId;
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

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getRemainingQuantity() {
		return remainingQuantity;
	}

	public void setRemainingQuantity(double remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}

	public Timestamp getStockTime() {
		return stockTime;
	}

	public void setStockTime(Timestamp stockTime) {
		this.stockTime = stockTime;
	}

	public Timestamp getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(Timestamp expiryTime) {
		this.expiryTime = expiryTime;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
}
