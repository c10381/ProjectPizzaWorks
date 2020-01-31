package purchaseSystem.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import purchaseSystem.service.PurchaseService;

@Controller
public class PurchaseController {
	
	PurchaseService service;
	
	@Autowired
	public void setService(PurchaseService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	//查詢所有請購單
	@RequestMapping(value = "/getAllPurchaseRequestJSON", method = RequestMethod.GET, 
			produces = {"application/json"})
	public @ResponseBody String getAllPurchaseRequestJSON(Model model) {
		String PurchaseRequest = service.getAllPurchaseRequest();
		return PurchaseRequest;
	}
	
	//新增請購單
	@RequestMapping(value = "/insertOnePurchaseRequest", method = RequestMethod.POST)
	public @ResponseBody String insertOnePurchaseRequest(@RequestParam(value="purchaseRequests")String jsonStr, Model model) {
		//1. new一個請購單Bean
		PurchaseRequestBean prb = new PurchaseRequestBean();
		System.out.println("yeeeeeeeeeeee");
		//2. 將前端傳來的json字串轉成JSON物件(裏頭為一筆請購單內容，一列請購單內容+多筆請購單明細)
		JSONObject jsonobject = new JSONObject(jsonStr);
		if(jsonobject != null && jsonobject.length()!=0) {
			prb.setProposalerId(jsonobject.getInt("proposalerId"));
			prb.setPurchaseReason(jsonobject.getString("purchaseReason"));
			prb.setTotalPrice(jsonobject.getDouble("totalPrice"));
			//new一個Date物件，取出當下時間，放入時間戳記，變成字串，set進請購單Bean中
			prb.setRequestTime(String.valueOf(new Timestamp(new Date().getTime())) );
			prb.setApproverId(0);
			prb.setRequestStatus(0);
			//從一開始的json物件中，取出Detail的JSON陣列(裏頭包含各種食材的json物件)
			JSONArray prdb_jsona = jsonobject.getJSONArray("purchaseRequestDetails");
			List<PurchaseRequestDetailBean> list = new ArrayList<>();
			//要將請購明細JSON陣列中每個json物件取出，須藉迴圈
			for(int i = 0; i<prdb_jsona.length(); i++) {
				//new一個請購明細Bean，以set前端傳來的新內容
				PurchaseRequestDetailBean purchaseRequestDetail = new PurchaseRequestDetailBean();
				//拿出此次迴圈的json物件
				JSONObject prdb_jsono = prdb_jsona.getJSONObject(i);
				//將上述json物件中的東西set進請購明細bean中，這個請購明細Bean如上述，為此迴圈內new出之獨一之Bean
				purchaseRequestDetail.setMaterialsId(prdb_jsono.getInt("materialsId"));
				purchaseRequestDetail.setUnitPrice(prdb_jsono.getDouble("unitPrice"));
				purchaseRequestDetail.setQuantity(prdb_jsono.getInt("quantity"));
				//將此獨一之Bean加進list
				list.add(purchaseRequestDetail);
				//迴圈重複數次，
			}
			
			service.saveOnePurchaseRequest(prb, list);
		}
		return "OK";
	}
	
	//修改請購單2
	@RequestMapping(value = "/updateOnePurchaseRequestJSON2", method = RequestMethod.POST, 
			produces = {"application/json"})
	public String updateOnePurchaseRequest2(@RequestBody PurchaseRequestBean prb) {
		List<PurchaseRequestDetailBean> prdbList = prb.getPurchaseRequestDetails();
		service.updatePurchaseRequest(prb, prdbList);
//		
//		
//		JSONObject jsonObjFromClient = new JSONObject(jsonStr);
//		if(jsonObjFromClient!=null&&jsonObjFromClient.length()!=0) {
//			Integer pRequestId = jsonObjFromClient.getInt("pRequestId");
//			String purchaseReason = jsonObjFromClient.getString("purchaseReason");
//			Double totalPrice = jsonObjFromClient.getDouble("totalPrice");
//			Integer requestStatus = jsonObjFromClient.getInt("requestStatus");
//			JSONArray detailJsonArrayFromClient = jsonObjFromClient.getJSONArray("purchaseRequestDetails");
//			service.updateOnePurchaseRequestById(pRequestId, purchaseReason, totalPrice, requestStatus);
//			
//			for(int i=0;i<detailJsonArrayFromClient.length();i++) {
//				JSONObject detailJsonObjFromClient = detailJsonArrayFromClient.getJSONObject(i);
//				PurchaseRequestDetailBean newPrdb = new PurchaseRequestDetailBean();
//				Integer materialsId = detailJsonObjFromClient.getInt("materialsId");
//				Integer quantity = detailJsonObjFromClient.getInt("quantity");
//				Double unitPrice = detailJsonObjFromClient.getDouble("unitPrice");
//				
//				service.updateOnePurchaseRequestDetailById(pRequestId, materialsId, unitPrice, quantity);
//			}
//			
//		}
		return "OK";
	}
	
//	//修改請購單
//	@RequestMapping(value = "/updateOnePurchaseRequestJSON", method = RequestMethod.POST)
//	public @ResponseBody String updateOnePurchaseRequest
//	(@RequestParam(value = "purchaseRequest") String purchaseRequest_str, 
//			@RequestParam(value = "purchaseRequestDetails") String purchaseRequestDetails_str, Model model) {
//		JSONObject object = new JSONObject(purchaseRequest_str);
//		
//		Integer pRequestId = object.getInt("pRequestId");
//		String purchaseReason = object.getString("purchaseReason");
//		Integer requestStatus = object.getInt("requestStatus");
//		
//		JSONArray jsonArray = new JSONArray(purchaseRequestDetails_str);
//		if (jsonArray != null && jsonArray.length() != 0) {
//			for (int i = 0; i < jsonArray.length(); i++) {
//				JSONObject jsonObject = jsonArray.getJSONObject(i);
//				Integer quantity = jsonObject.getInt("quantity");
//				Double unitPrice = jsonObject.getDouble("unitPrice");
//				service.updateOnePurchaseRequest(pRequestId, purchaseReason, requestStatus, quantity, unitPrice);
//			}
//		}
//		return "OK";
//	}

}
