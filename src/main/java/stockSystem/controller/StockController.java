package stockSystem.controller;

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
import _model.StorageHistoryBean;
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
		
//	@RequestMapping(value = "/getOneStockRequest", method = RequestMethod.GET)
//	public String getOneStockRequest(@RequestParam(value = "id") Integer pOrderId, Model model) {
//		String StockRequest = service.getOneStockRequestJson(pOrderId);
//		model.addAttribute("StockRequest_jsonStr", StockRequest);
//		return "StockSystem/GetStockRequest";
//	}
	
	@RequestMapping(value = "/getOneStockRequest", method = RequestMethod.GET)
	public String getOneStockRequestRead(@RequestParam(value = "id") Integer pRequestId, @RequestParam(value="read") boolean read, Model model) {
		String stockRequest = service.getOneStockRequestJson(pRequestId, read);
		model.addAttribute("stockRequest_jsonStr", stockRequest);
		return "stockSystem/GetStockRequest";
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

	@RequestMapping(value = "/convertToStockHistoryPage", method = RequestMethod.POST)
	public String ConvertToStockHistoryPage(@RequestParam("stockRequest_jsonStr") String stockRequest,
			Model model) {
//		String materials_string = service.getAllMaterialsJson();
		List<MaterialsUnitBean> materialUnits = service.getAllMaterialsUnits();
		List<SuppliersProvisionBean> suppliersProvisions = service.getAllSuppliersProvisions();
		JSONObject stockRequest_jso = new JSONObject(stockRequest);
		StockRequestBean temp_stockRequest = service.getOneStockRequest(stockRequest_jso.getInt("sRequestId"));
		stockRequest_jso.put("pOrderId",temp_stockRequest.getpOrderId());
		model.addAttribute("stockRequest_jsonStr", stockRequest_jso.toString());
		model.addAttribute("materialsUnits", new JSONArray(materialUnits).toString());
		model.addAttribute("suppliersProvisions", new JSONArray(suppliersProvisions).toString());
//		model.addAttribute("", );
//		JSONObject output = new JSONObject();
//		output.put("StockRequest_jsonStr", StockRequest);
//		output.put("materials", new JSONArray(materials).toString());
//		output.put("path", "StockSystem/AddNewStockRequest");
		
//		return output.toString();
		return "stockSystem/AddNewStockHistory";
//		return materials_string;
	}
	
	@PutMapping("/stock/updateReadTime")
	public @ResponseBody String updateReadTime(@RequestBody StockRequestBean StockRequest) {
		String time = service.updateReadTime(StockRequest);
		System.out.println(time);
		return time;
	}
	
	@PutMapping("/stock/updateResponse")
	public @ResponseBody String updateResponse(@RequestBody StockRequestBean StockRequest) {
		service.updateResponse(StockRequest);
		return "OK";
	}
	
	
	@RequestMapping(value = "/saveStockHistory", method = RequestMethod.POST)
	public @ResponseBody String saveStockRequest(@RequestParam("stockRequest") String stockRequest,
			Model model) {
		// Initialize variables
		JSONObject stockRequest_jso = new JSONObject(stockRequest);
		StockRequestBean newStockRequest = new StockRequestBean();
		List<StorageHistoryBean> storageHistorys = new ArrayList<>();
		// Get values to set Beans' property. 
		Integer sRequestId = stockRequest_jso.getInt("sRequestId");
		String timeStr = String.valueOf(new Timestamp(new Date().getTime()));
		String timeStrNoMillisec = timeStr.substring(0, timeStr.length() - 4);
		Integer approverId = stockRequest_jso.getInt("approverId");
		JSONArray stockRequestDetails_jsa = stockRequest_jso.getJSONArray("stockRequestDetails");
		Integer total_boxes = 0;
		// Set newStockRequest bean.
		newStockRequest.setpOrderId(stockRequest_jso.getInt("pOrderId"));
		newStockRequest.setsRequestId(sRequestId);
		newStockRequest.setApproverId(approverId);
		newStockRequest.setRequestStatus(2);
		for(int i = 0; i<stockRequestDetails_jsa.length(); i++) {
			// Initialize variables
			JSONObject stockRequestDetails_jso = stockRequestDetails_jsa.getJSONObject(i);
			StorageHistoryBean storageHistory = new StorageHistoryBean();
			// Get values to set Beans' property.
			Integer materialsId = stockRequestDetails_jso.getInt("materialsId");
			Double quantity = stockRequestDetails_jso.getDouble("quantity");
			Double unitPrice = stockRequestDetails_jso.getDouble("unitPrice");
			Integer quantityPerUnit = stockRequestDetails_jso.getInt("quantityPerUnit");
			Integer preciseQuantity = quantity.intValue()*quantityPerUnit;
			// Set stockHistory bean.
			storageHistory.setsRequestId(sRequestId);
			storageHistory.setMaterialsId(materialsId);
			storageHistory.setUnitPrice(unitPrice);
			storageHistory.setQuantity(preciseQuantity);
			storageHistory.setRemainingQuantity(preciseQuantity);
			storageHistory.setStockTime(timeStrNoMillisec);
			storageHistory.setExpiryTime(stockRequestDetails_jso.getString("expiryDate"));
			storageHistory.setUnit(stockRequestDetails_jso.getString("unit"));
			storageHistorys.add(storageHistory);
			total_boxes = total_boxes + quantity.intValue();
		}
		newStockRequest.setResponseComment("共有"+total_boxes+"箱貨品已入庫");
		// 
		service.updateApprovedStockRequest(newStockRequest);
		service.insertStockHistory(storageHistorys);
		service.updateMaterialsByHistory(storageHistorys);
		return "/stock/GetAllStockRequest";
	}
	
}
