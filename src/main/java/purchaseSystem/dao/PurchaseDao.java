package purchaseSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.PurchaseRequestBean;

public interface PurchaseDao {
	
	void setFactory(SessionFactory factory);
	//查詢所有請購單
	List<PurchaseRequestBean> getAllPurchaseRequest();
	//修改請購單(依請購單號)
	void updateOnePurchaseRequest(PurchaseRequestBean prb);
	//判斷請購單狀態
	Integer checkPurchaseReuestStatus(PurchaseRequestBean prb);
	//新增請購單
	void insertOnePurchaseRequest(PurchaseRequestBean prb);
}
