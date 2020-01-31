package purchaseSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MaterialsBean;
import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import _model.SupplierBean;

public interface PurchaseDao {
	
	void setFactory(SessionFactory factory);
	//查詢所有請購單
	List<PurchaseRequestBean> getAllPurchaseRequest();
	//查詢單一請購單(依請購單ID)
	PurchaseRequestBean getOnePurchaseRequestById(Integer pRequestId);
	//查詢單一食材(依食材ID)
	MaterialsBean getOneMaterialsById(Integer MaterialId);
	//查詢所有供應商資料(依廠商ID)
	SupplierBean getOneSupplierById(Integer supplierId);
	//修改請購單(依請購單ID)
	void updateOnePurchaseRequest(Integer pRequestId, String purchaseReason, Integer requestStatus, Integer quantity, Double unitPrice);
	//新增請購單
	PurchaseRequestBean insertOnePurchaseRequest(PurchaseRequestBean prb);
	//新增請購單明細
	void insertOnePurchaseRequestDetail(PurchaseRequestDetailBean list);
}
