package _model;

import java.sql.Timestamp;

public class DisposalHistory {
	private Integer materialsId;
	private Timestamp stockTime;
	private double remainingQuantity;
	private Timestamp disposalTime;
	private Integer sRequest;
	
	public DisposalHistory() {}
	
	public DisposalHistory(Integer materialsId, Timestamp stockTime, double remainingQuantity, Timestamp disposalTime,
			Integer sRequest) {
		this.materialsId = materialsId;
		this.stockTime = stockTime;
		this.remainingQuantity = remainingQuantity;
		this.disposalTime = disposalTime;
		this.sRequest = sRequest;
	}

	public Integer getMaterialsId() {
		return materialsId;
	}

	public void setMaterialsId(Integer materialsId) {
		this.materialsId = materialsId;
	}

	public Timestamp getStockTime() {
		return stockTime;
	}

	public void setStockTime(Timestamp stockTime) {
		this.stockTime = stockTime;
	}

	public double getRemainingQuantity() {
		return remainingQuantity;
	}

	public void setRemainingQuantity(double remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}

	public Timestamp getDisposalTime() {
		return disposalTime;
	}

	public void setDisposalTime(Timestamp disposalTime) {
		this.disposalTime = disposalTime;
	}

	public Integer getsRequest() {
		return sRequest;
	}

	public void setsRequest(Integer sRequest) {
		this.sRequest = sRequest;
	}
	
}
