package purchaseSystem.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.PurchaseRequestBean;
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
	
	//修改請購單
	@RequestMapping(value = "/updateOnePurchaseRequestJSON", method = RequestMethod.POST)
	public @ResponseBody String updateOnePurchaseRequest
	(@RequestParam(value = "purchaseRequest") String purchaseRequest_str, 
			@RequestParam(value = "purchaseRequestDetails") String purchaseRequestDetails_str, Model model) {
		JSONObject object = new JSONObject(purchaseRequest_str);
		
		Integer pRequestId = object.getInt("pRequestId");
		String purchaseReason = object.getString("purchaseReason");
		Integer requestStatus = object.getInt("requestStatus");
		
		JSONArray jsonArray = new JSONArray(purchaseRequestDetails_str);
		if (jsonArray != null && jsonArray.length() != 0) {
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				Integer quantity = jsonObject.getInt("quantity");
				Double unitPrice = jsonObject.getDouble("unitPrice");
				service.updateOnePurchaseRequest(pRequestId, purchaseReason, requestStatus, quantity, unitPrice);
			}
		}
		return "OK";
	}
	
}
