package purchaseSystem.service.impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import purchaseSystem.dao.PurchaseDao;
import purchaseSystem.service.PurchaseService;

@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {
	
	PurchaseDao dao;
	
	@Override
	@Autowired
	public void setDao(PurchaseDao dao) {
		this.dao = dao;
	}

	@Override
	public String getAllPurchaseRequest() {			
		List<PurchaseRequestBean> list = dao.getAllPurchaseRequest();
		JSONObject purchaseRequestJsonObj = null;
		JSONArray combinationJson = new JSONArray();
		for(PurchaseRequestBean prb:list) {
			purchaseRequestJsonObj = new JSONObject();
			purchaseRequestJsonObj.put("pRequestId", prb.getpRequestId());
			purchaseRequestJsonObj.put("proposalerId", prb.getProposalerId());
			purchaseRequestJsonObj.put("requestTime", prb.getRequestTime());
			purchaseRequestJsonObj.put("purchaseReason", prb.getPurchaseReason());
			purchaseRequestJsonObj.put("approverId", prb.getApproverId());
			purchaseRequestJsonObj.put("responseComment", prb.getResponseComment());
			purchaseRequestJsonObj.put("responseTime", prb.getResponseTime());
			purchaseRequestJsonObj.put("readTime", prb.getReadTime());
			purchaseRequestJsonObj.put("totalPrice", prb.getTotalPrice());
			purchaseRequestJsonObj.put("requestStatus", prb.getRequestStatus());
			JSONArray jsonArray = new JSONArray();
			List<PurchaseRequestDetailBean> list2 = prb.getPurchaseRequestDetails();
			for(PurchaseRequestDetailBean prdb:list2) {
				String materialsName = dao.getOneMaterialsById(prdb.getMaterialsId()).getMaterialsName();
				JSONObject purchaseRequestDetailJsonObj = new JSONObject();
				purchaseRequestDetailJsonObj.put("pRequestDetailId", prdb.getpRequestDetailId());
				purchaseRequestDetailJsonObj.put("materialsId", prdb.getMaterialsId());
				purchaseRequestDetailJsonObj.put("materialsName", materialsName);
				purchaseRequestDetailJsonObj.put("unitPrice", prdb.getUnitPrice());
				purchaseRequestDetailJsonObj.put("qunatity", prdb.getQuantity());
				purchaseRequestDetailJsonObj.put("ActualQuantity", prdb.getActualQuantity());
				jsonArray.put(purchaseRequestDetailJsonObj);
			}
			purchaseRequestJsonObj.put("PurchaseRequestDetail", jsonArray);
			combinationJson.put(purchaseRequestJsonObj);
		}
		
		String jsonString = combinationJson.toString();
		return jsonString;
	}

	@Override
	public void updateOnePurchaseRequest(Integer pRequestId, String purchaseReason, Integer requestStatus, Integer quantity, Double unitPrice) {
		if(requestStatus==0) {
			dao.updateOnePurchaseRequest(pRequestId, purchaseReason, requestStatus, quantity, unitPrice);
		}else {
			System.out.println("請購已被核准，無法修改");
		}
	}

	@Override
	public void saveOnePurchaseRequest(PurchaseRequestBean prb, List<PurchaseRequestDetailBean> list) {
		//將在controller處理過後的prb新增至資料庫，至此請購單Bean被更新，此處之載有資訊之請購單Bean(prb)，其中被更新的東西不包含Detail這個list
		//因為本例為雙向一對多，FK在明細(多)方，資料表中請購單表中未有FK及參照。
		PurchaseRequestBean purchaseRequest = dao.insertOnePurchaseRequest(prb);
		//將在Controller處理過後的list新增置資料庫，該list包含新的諸Detail Bean
		for(PurchaseRequestDetailBean purchaseRequestDetail: list ) {
			//因第一行所述，請購單Bean中之明細List尚未被更新，此處反先對請購明細Bean更新，將帶有新的Id的前端傳來的請購單Bean，放進Detail Bean中
			//purchaseRequestDetail中有Controller中處理過的detail資訊，尚差還有Id之新請購單Bean，現在補足
			purchaseRequestDetail.setPurchaseRequest(purchaseRequest);
			//把完整的purchaseRequestDetail放進資料庫中。
			dao.insertOnePurchaseRequestDetail(purchaseRequestDetail);
		} 
	}

}
