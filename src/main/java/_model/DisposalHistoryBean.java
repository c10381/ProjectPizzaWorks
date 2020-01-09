package _model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="DisposalHistory")
public class DisposalHistoryBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer disposalHistoryId;
	private Integer materialsId;
	private Timestamp stockTime;
	private double remainingQuantity;
	private Timestamp disposalTime;
	private Integer sRequest;
	
	public DisposalHistoryBean() {}
	
	public DisposalHistoryBean(Integer materialsId, Timestamp stockTime, double remainingQuantity, Timestamp disposalTime,
			Integer sRequest) {
		this.materialsId = materialsId;
		this.stockTime = stockTime;
		this.remainingQuantity = remainingQuantity;
		this.disposalTime = disposalTime;
		this.sRequest = sRequest;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getDisposalHistoryId() {
		return disposalHistoryId;
	}

	public void setDisposalHistoryId(Integer disposalHistoryId) {
		this.disposalHistoryId = disposalHistoryId;
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
