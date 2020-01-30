package purchaseSystem.service;


import _model.PurchaseRequestBean;
import purchaseSystem.dao.PurchaseDao;

public interface PurchaseService {
	
	void setDao(PurchaseDao dao);	
	//查詢所有請購單
	String getAllPurchaseRequest();
	//修改請購單(依請購單號)
	void updateOnePurchaseRequest(Integer pRequestId, String purchaseReason, Integer requestStatus, Integer quantity, Double unitPrice);
	//新增請購單
	void insertOnePurchaseRequest(PurchaseRequestBean prb);
}
