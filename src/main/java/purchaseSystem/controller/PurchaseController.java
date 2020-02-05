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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.MaterialsBean;
import _model.PurchaseOrderBean;
import _model.MaterialsUnitBean;
import _model.PurchaseOrderBean;
import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import _model.SuppliersProvisionBean;
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

	// 1-1.查詢所有請購單
	@RequestMapping(value = "/getAllPurchaseRequestJSON", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody String getAllPurchaseRequestJSON(Model model) {
		String PurchaseRequest = service.getAllPurchaseRequest();
		return PurchaseRequest;
	}
	
	// 1-2.查詢單張請購單
	@RequestMapping(value = "/getOnePurchaseRequest", method = RequestMethod.GET)
	public String getOnePurchaseRequest(@RequestParam(value = "id") Integer id, Model model) {
		String purchaseRequest = service.getOnePurchaseRequestJson(id);
		model.addAttribute("purchaseRequest_jsonStr", purchaseRequest);
		return "placeHolderPage";
	}

	// 2.新增單張請購單
	@RequestMapping(value = "/insertOnePurchaseRequest2", method = RequestMethod.POST)
	public @ResponseBody String insertOnePurchaseRequest2(@RequestBody PurchaseRequestBean purchaseRequest,
			Model model) {
		String timeStr = String.valueOf(new Timestamp(new Date().getTime()));
		String timeStrNoMillisec = timeStr.substring(0, timeStr.length() - 4);
		purchaseRequest.setRequestTime(timeStrNoMillisec);
		purchaseRequest.setRequestStatus(0);
		purchaseRequest.setApproverId(0);
		service.saveOnePurchaseRequest2(purchaseRequest);
		return "OK";
	}

	// 3.修改請購單2
	@RequestMapping(value = "/updateOnePurchaseRequestJSON2", method = RequestMethod.POST, produces = {
			"application/json;charset=UTF-8" })
	public String updateOnePurchaseRequest2(@RequestBody PurchaseRequestBean prb) {
		List<PurchaseRequestDetailBean> prdbList = prb.getPurchaseRequestDetails();
		service.updatePurchaseRequest(prb, prdbList);
		return "OK";
	}
	//修改請購單
		@RequestMapping(value = "/updateOnePurchaseRequest", method = RequestMethod.POST, 
				produces = {"application/json;charset=UTF-8"})
		public @ResponseBody String updateOnePurchaseRequest(@RequestBody PurchaseRequestBean purchaseRequest) {

			Integer flag = service.updateOnePurchaseRequest2(purchaseRequest);
			if(flag.equals(1)) {
				return "OK";
			} else if (flag.equals(0)) {
				return "Error";
			}
			return "";
		}
		
		// 1.查詢所有採購單
		@RequestMapping(value = "/getAllPurchaseOrderJSON", method = RequestMethod.GET, produces = {
				"application/json;charset=UTF-8" })
		public @ResponseBody String getAllPurchaseOrderJSON(Model model) {
			String PurchaseOrder = service.getAllPurchaseOrder();
			return PurchaseOrder;
		}

		// 2.新增單張請購單
		@RequestMapping(value = "/insertOnePurchaseOrder", method = RequestMethod.POST)
		public @ResponseBody String insertOnePurchaseOrder(@RequestBody PurchaseOrderBean purchaseOrder,
				Model model) {
			String timeStr = String.valueOf(new Timestamp(new Date().getTime()));
			String timeStrNoMillisec = timeStr.substring(0, timeStr.length() - 4);
			purchaseOrder.setRequestTime(timeStrNoMillisec);
			purchaseOrder.setApproverId(0);
			service.saveOnePurchaseOrder(purchaseOrder);
			return "OK";
		}

	
//	// 修改請購單
//	@RequestMapping(value = "/updateOnePurchaseRequest", method = RequestMethod.POST, produces = {
//			"application/json;charset=UTF-8" })
//	public @ResponseBody String updateOnePurchaseRequest(@RequestBody PurchaseRequestBean purchaseRequest) {
//		Integer flag = service.updateOnePurchaseRequest2(purchaseRequest);
//		if (flag.equals(1)) {
//			return "OK";
//		} else if (flag.equals(0)) {
//			return "Error";
//		}
//		return "";
//	}


	@RequestMapping(value = "/convertToStockRequestPage", method = RequestMethod.POST)
	public String ConvertToStockRequestPage(@RequestParam("purchaseRequest_jsonStr") String purchaseRequest,
			Model model) {
		List<MaterialsBean> materials = service.getAllMaterials();
//		String materials_string = service.getAllMaterialsJson();
		List<MaterialsUnitBean> materialUnits = service.getAllMaterialsUnits();
		List<SuppliersProvisionBean> suppliersProvisions = service.getAllSuppliersProvisions();
		model.addAttribute("purchaseRequest_jsonStr", purchaseRequest);
		model.addAttribute("materials", materials);
		model.addAttribute("materialsUnits", new JSONArray(materialUnits).toString());
		model.addAttribute("suppliersProvisions", new JSONArray(suppliersProvisions).toString());
//		model.addAttribute("", );
//		JSONObject output = new JSONObject();
//		output.put("purchaseRequest_jsonStr", purchaseRequest);
//		output.put("materials", new JSONArray(materials).toString());
//		output.put("path", "purchaseSystem/AddNewStockRequest");
		
//		return output.toString();
		return "purchaseSystem/AddNewStockRequest";
//		return materials_string;
	}
	
	@PutMapping("/purchase/updateReadTime")
	public @ResponseBody String updateReadTime(@RequestBody PurchaseRequestBean purchaseRequest) {
		String time = service.updateReadTime(purchaseRequest);
		System.out.println(time);
		return time;
	}
	
}
