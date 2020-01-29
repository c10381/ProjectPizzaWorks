package purchaseSystem.service;

import java.util.List;

import _model.PurchaseRequestBean;
import purchaseSystem.dao.PurchaseDao;

public interface PurchaseService {
	
	void setDao(PurchaseDao dao);	
	//查詢所有請購單
	List<PurchaseRequestBean> getAllPurchaseRequest();
	//修改請購單(依請購單號)
	void updateOnePurchaseRequest(PurchaseRequestBean prb);
	//判斷請購單狀態
	Integer checkPurchaseReuestStatus(PurchaseRequestBean prb);
	//新增請購單
	void insertOnePurchaseRequest(PurchaseRequestBean prb);
}
