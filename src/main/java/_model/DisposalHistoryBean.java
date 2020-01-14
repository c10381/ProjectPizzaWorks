package _model;

import java.io.Serializable;

import javax.persistence.Column;
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
	private String stockTime;
	private double remainingQuantity;
	private String disposalTime;
	private Integer sRequest;
	
	public DisposalHistoryBean() {}
	
	public DisposalHistoryBean(Integer materialsId, String stockTime, double remainingQuantity, String disposalTime,
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
	
	@Column(name="stockTime", columnDefinition="datetime")
	public String getStockTime() {
		return stockTime;
	}

	public void setStockTime(String stockTime) {
		this.stockTime = stockTime;
	}

	public double getRemainingQuantity() {
		return remainingQuantity;
	}

	public void setRemainingQuantity(double remainingQuantity) {
		this.remainingQuantity = remainingQuantity;
	}
	
	@Column(name="disposalTime", columnDefinition="datetime")
	public String getDisposalTime() {
		return disposalTime;
	}

	public void setDisposalTime(String disposalTime) {
		this.disposalTime = disposalTime;
	}

	public Integer getsRequest() {
		return sRequest;
	}

	public void setsRequest(Integer sRequest) {
		this.sRequest = sRequest;
	}
	
}
