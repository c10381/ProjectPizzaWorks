package stockSystem.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SuppliersProvisionBean;
import stockSystem.service.StockService;

@Controller
public class StockController {

	StockService service;

	@Autowired
	public void setService(StockService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	
	// 2.新增單張請購單
	@RequestMapping(value = "/insertOneStockRequest2", method = RequestMethod.POST)
	public @ResponseBody String insertOneStockRequest2(@RequestBody StockRequestBean StockRequest,
			Model model) {
		String timeStr = String.valueOf(new Timestamp(new Date().getTime()));
		String timeStrNoMillisec = timeStr.substring(0, timeStr.length() - 4);
		StockRequest.setRequestTime(timeStrNoMillisec);
		StockRequest.setRequestStatus(0);
		StockRequest.setApproverId(0);
		service.saveOneStockRequest2(StockRequest);
		return "OK";
	}
	// 3.修改請購單2
	@RequestMapping(value = "/updateOneStockRequestJSON2", method = RequestMethod.POST, produces = {
			"application/json;charset=UTF-8" })
	public String updateOneStockRequest2(@RequestBody StockRequestBean prb) {
		List<StockRequestDetailBean> prdbList = prb.getStockRequestDetails();
		service.updateStockRequest(prb, prdbList);
		return "OK";
	}
	//修改請購單
	@RequestMapping(value = "/updateOneStockRequest", method = RequestMethod.POST, 
			produces = {"application/json;charset=UTF-8"})
	public @ResponseBody String updateOneStockRequest(@RequestBody StockRequestBean StockRequest) {
		Integer flag = service.updateOneStockRequest(StockRequest);
		if(flag.equals(1)) {
			return "OK";
		} else if (flag.equals(0)) {
			return "Error";
		}
		return "";
	}
		
	@RequestMapping(value = "/getAllStockRequestJSON", method = RequestMethod.GET, produces = {
			"application/json;charset=UTF-8" })
	public @ResponseBody String getAllStockRequestJSON(Model model) {
		String stockRequest = service.getAllStockRequest();
		return stockRequest;
	}
		
	@RequestMapping(value = "/getOneStockRequest", method = RequestMethod.GET)
	public String getOneStockRequest(@RequestParam(value = "id") Integer pOrderId, Model model) {
		String StockRequest = service.getOneStockRequestJson(pOrderId);
		model.addAttribute("StockRequest_jsonStr", StockRequest);
		return "StockSystem/GetStockRequest";
	}
	
//	// 修改請購單
//	@RequestMapping(value = "/updateOneStockRequest", method = RequestMethod.POST, produces = {
//			"application/json;charset=UTF-8" })
//	public @ResponseBody String updateOneStockRequest(@RequestBody StockRequestBean StockRequest) {
//		Integer flag = service.updateOneStockRequest2(StockRequest);
//		if (flag.equals(1)) {
//			return "OK";
//		} else if (flag.equals(0)) {
//			return "Error";
//		}
//		return "";
//	}

//	@RequestMapping(value = "/convertToStockRequestPage", method = RequestMethod.POST)
//	public String ConvertToStockRequestPage(@RequestParam("StockRequest_jsonStr") String StockRequest,
//			Model model) {
//		List<MaterialsBean> materials = service.getAllMaterials();
////		String materials_string = service.getAllMaterialsJson();
//		List<MaterialsUnitBean> materialUnits = service.getAllMaterialsUnits();
//		List<SuppliersProvisionBean> suppliersProvisions = service.getAllSuppliersProvisions();
//		model.addAttribute("StockRequest_jsonStr", StockRequest);
//		model.addAttribute("materials", materials);
//		model.addAttribute("materialsUnits", new JSONArray(materialUnits).toString());
//		model.addAttribute("suppliersProvisions", new JSONArray(suppliersProvisions).toString());
////		model.addAttribute("", );
////		JSONObject output = new JSONObject();
////		output.put("StockRequest_jsonStr", StockRequest);
////		output.put("materials", new JSONArray(materials).toString());
////		output.put("path", "StockSystem/AddNewStockRequest");
//		
////		return output.toString();
//		return "StockSystem/AddNewStockRequest";
////		return materials_string;
//	}
	
	@PutMapping("/Stock/updateReadTime")
	public @ResponseBody String updateReadTime(@RequestBody StockRequestBean StockRequest) {
		String time = service.updateReadTime(StockRequest);
		System.out.println(time);
		return time;
	}
	
	@PutMapping("/Stock/updateResponse")
	public @ResponseBody String updateResponse(@RequestBody StockRequestBean StockRequest) {
		service.updateResponse(StockRequest);
		return "OK";
	}
	
	/*
	@RequestMapping(value = "/saveStockRequest", method = RequestMethod.POST)
	public @ResponseBody String saveStockRequest(@RequestParam("StockRequest") String StockRequest,
			Model model) {
		// Initialize variables
		JSONObject StockRequest_jso = new JSONObject(StockRequest);
		StockRequestBean StockRequest = new StockRequestBean();
		StockRequestBean stockRequest = new StockRequestBean();
		StockRequestBean newStockRequest = new StockRequestBean();
		List<StockRequestDetailBean> StockRequestDetails = new ArrayList<>();
		List<StockRequestDetailBean> stockRequestDetails = new ArrayList<>();
		List<StockRequestDetailBean> StockRequestDetails = new ArrayList<>();
		// Get values to set Beans' property. 
		Integer sRequestId = StockRequest_jso.getInt("sRequestId");
		String timeStr = String.valueOf(new Timestamp(new Date().getTime()));
		String timeStrNoMillisec = timeStr.substring(0, timeStr.length() - 4);
		Integer proposalerId = StockRequest_jso.getInt("proposalerId");
		String briefInfo = StockRequest_jso.getString("briefInfo");
		JSONArray StockRequestDetails_jsa = StockRequest_jso.getJSONArray("StockRequestDetails");
		// Set StockRequest bean.
		StockRequest.setsRequestId(sRequestId);
		StockRequest.setProposalerId(proposalerId);
		StockRequest.setBriefInfo(briefInfo);
		StockRequest.setRequestTime(timeStrNoMillisec);
		StockRequest.setApproverId(4);
		// Set stockRequest bean.
		stockRequest.setProposalerId(proposalerId);
		stockRequest.setBriefInfo(briefInfo);
		stockRequest.setRequestTime(timeStrNoMillisec);
		stockRequest.setApproverId(0);
		stockRequest.setRequestStatus(0);
		// Set newStockRequest bean.
		newStockRequest.setsRequestId(sRequestId);
		newStockRequest.setApproverId(proposalerId);
//		newStockRequest.setResponseComment(briefInfo);
//		newStockRequest.setResponseTime(timeStrNoMillisec);
		newStockRequest.setTotalPrice(StockRequest_jso.getDouble("totalSale"));
		newStockRequest.setRequestStatus(2);
		for(int i = 0; i<StockRequestDetails_jsa.length(); i++) {
			// Initialize variables
			JSONObject StockRequestDetails_jso = StockRequestDetails_jsa.getJSONObject(i);
			StockRequestDetailBean StockRequestDetail = new StockRequestDetailBean();
			StockRequestDetailBean stockRequestDetail = new StockRequestDetailBean();
			StockRequestDetailBean StockRequestDetail = new StockRequestDetailBean();
			// Get values to set Beans' property.
			Integer materialsId = StockRequestDetails_jso.getInt("materialsId");
			Double quantity = StockRequestDetails_jso.getDouble("quantity");
			Double unitPrice = StockRequestDetails_jso.getDouble("unitPrice");
			// Set StockRequestDetail bean.
			StockRequestDetail.setMaterialsId(materialsId);
			StockRequestDetail.setQuantity(quantity);
			StockRequestDetail.setUnitPrice(quantity*unitPrice);
			StockRequestDetails.add(StockRequestDetail);
			// Set stockRequestDetail bean.
			stockRequestDetail.setMaterialsId(materialsId);
			stockRequestDetail.setQuantity(quantity.intValue());
			stockRequestDetail.setUnitPrice(unitPrice);
			stockRequestDetails.add(stockRequestDetail);
			// Set StockRequestDetail bean.
			StockRequestDetail.setsRequestId(sRequestId);
			StockRequestDetail.setMaterialsId(materialsId);
			StockRequestDetail.setUnitPrice(unitPrice);
			StockRequestDetails.add(StockRequestDetail);
		}
		// Set StockRequestDetails into the StockRequest bean.
		StockRequest.setStockRequestDetails(StockRequestDetails);
		// Set stockRequestDetails into the stockRequest bean.
		stockRequest.setStockRequestDetails(stockRequestDetails);
		// Set StockRequestDetails into the newStockRequest bean.
		newStockRequest.setStockRequestDetails(StockRequestDetails);
		// Insert two beans and Update one bean
		Integer pOrderId = service.insertStockRequest(StockRequest);
		stockRequest.setpOrderId(pOrderId);
		service.insertStockRequest(stockRequest);
		service.updateApprovedStockRequest(newStockRequest);
		
		return "/Stock/GetAllStockRequest";
	}*/
	
}
