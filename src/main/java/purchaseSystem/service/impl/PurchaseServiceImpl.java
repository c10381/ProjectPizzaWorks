package purchaseSystem.service.impl;

import java.util.ArrayList;
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
	public void insertOnePurchaseRequest(PurchaseRequestBean prb) {
		dao.insertOnePurchaseRequest(prb);
	}

}
