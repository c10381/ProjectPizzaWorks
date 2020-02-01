package purchaseSystem.service;


import java.util.List;

import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import purchaseSystem.dao.PurchaseDao;

public interface PurchaseService {
	
	void setDao(PurchaseDao dao);	
	//查詢所有請購單
	String getAllPurchaseRequest();
	//修改請購單(依請購單號)
	void updatePurchaseRequest(PurchaseRequestBean prb, List<PurchaseRequestDetailBean> prdbList);
	//新增請購單
	void saveOnePurchaseRequest(PurchaseRequestBean prb, List<PurchaseRequestDetailBean> list);
	
	void saveOnePurchaseRequest2(PurchaseRequestBean purchaseRequest);

	Integer updateOnePurchaseRequest2(PurchaseRequestBean purchaseRequest);
}
