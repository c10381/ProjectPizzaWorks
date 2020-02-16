package statisticalAnalysisSystem.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.ProductBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopManageSystem.service.ProductService;
import statisticalAnalysisSystem.service.StatisticalAnalysisService;

@Controller
@SessionAttributes("Mem_LoginOK")
public class StatisticalAnalysisController {

	ProductService pService;

	@Autowired
	public void setpService(ProductService pService) {
		this.pService = pService;
	}

	StatisticalAnalysisService service;

	@Autowired
	public void setService(StatisticalAnalysisService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	// 導向ProductShare.jsp
	@GetMapping(value = "/PieChartTest")
	public String showPieChart(Model model) {
		return "/StatisticalAnalysis/ProductShare";
	}

	// 導向GrossProfitTrend.jsp(暫無用)
	@GetMapping(value = "/LineChartTest")
	public String showLineChart(Model model) {
		return "/StatisticalAnalysis/GrossProfitTrend";
	}

	// 回傳下拉式選單資料Controller
	@RequestMapping(value = "/pDropDownMenu", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getProductIdName(Model model) {
		List<ProductBean> list = pService.getAllProducts();
		JSONObject jso = null;
		JSONArray jsa = new JSONArray();
		for (ProductBean pb : list) {
			jso = new JSONObject();
			jso.put("productId", pb.getProductId());
			jso.put("productName", pb.getProductName());
			jsa.put(jso);
		}
		String jsa_str = jsa.toString();
		return jsa_str;
	}

	// PieChartPostGet
	@RequestMapping(value = "/PieChartTest_proto", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showPieChartJson(Model model) throws ParseException {
		JSONObject jso = new JSONObject();
		jso.put("product1", service.getOneProductSalesShare(1, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product2", service.getOneProductSalesShare(2, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product3", service.getOneProductSalesShare(3, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		return jso.toString();
	}

	// PieChartPost
	@RequestMapping(value = "/PieChartPost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String catchPInfoFromClient(@RequestParam("jsa_str") String jsa_str,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, Model model)
			throws JSONException, ParseException {
		String startDateSec = startDate + " 00:00:00";
		String endDateSec = endDate + " 23:59:59";
		Integer productId = Integer.parseInt(jsa_str);
		JSONObject jso = new JSONObject();
		jso.put("product1", service.getOneProductSalesShare(productId, startDateSec, endDateSec));
		return jso.toString();
	}

	// LineChartGET
	@RequestMapping(value = "/LineChart", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody Double showLineChartJson(Model model) throws JSONException, ParseException {
		Double oneProductGp = service.getOneProductGp(1, "2020-01-29 00:00:00", "2020-05-21 00:00:00");
		System.out.println("oneProductGp = " + oneProductGp);
		return oneProductGp;
	}

	// LineChartPOST
	@RequestMapping(value = "/LineChartPost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String LineChartPost(@RequestParam("lineChartInfo") String lineChartInfo, Model model)
			throws ParseException {
		JSONObject jso = new JSONObject(lineChartInfo);

		Integer productId = Integer.parseInt(jso.getString("productId"));
		Integer productId2 = Integer.parseInt(jso.getString("productId2"));
		// 傳入前端一個時間點，傳回五個時間區段
		HashMap<String, String> map = service.LineChartDateTransfer(jso.getString("startDateLine"));
		// 呼叫五個點
		Double oneProductGp1_0000 = service.getOneProductGp(productId, map.get("startDate1_str"),
				map.get("endDate1_str"));
		Double oneProductGp2_0000 = service.getOneProductGp(productId, map.get("startDate2_str"),
				map.get("endDate2_str"));
		Double oneProductGp3_0000 = service.getOneProductGp(productId, map.get("startDate3_str"),
				map.get("endDate3_str"));
		Double oneProductGp4_0000 = service.getOneProductGp(productId, map.get("startDate4_str"),
				map.get("endDate4_str"));
		Double oneProductGp5_0000 = service.getOneProductGp(productId, map.get("startDate5_str"),
				map.get("endDate5_str"));

		Double oneProductGp6_0000 = service.getOneProductGp(productId2, map.get("startDate1_str"),
				map.get("endDate1_str"));
		Double oneProductGp7_0000 = service.getOneProductGp(productId2, map.get("startDate2_str"),
				map.get("endDate2_str"));
		Double oneProductGp8_0000 = service.getOneProductGp(productId2, map.get("startDate3_str"),
				map.get("endDate3_str"));
		Double oneProductGp9_0000 = service.getOneProductGp(productId2, map.get("startDate4_str"),
				map.get("endDate4_str"));
		Double oneProductGp10_0000 = service.getOneProductGp(productId2, map.get("startDate5_str"),
				map.get("endDate5_str"));

		// 把GP小數位數改成小數點兩位，不然太長
		HashMap<String, Double> mapDecimal = service.GP4DicimalTo2(oneProductGp1_0000, oneProductGp2_0000,
				oneProductGp3_0000, oneProductGp4_0000, oneProductGp5_0000);
		HashMap<String, Double> mapDecimal2 = service.GP4DicimalTo2(oneProductGp6_0000, oneProductGp7_0000,
				oneProductGp8_0000, oneProductGp9_0000, oneProductGp10_0000);

		// 把起日拆成年、月、日
		String startYear = map.get("startDate1_str").substring(0, 4);
		String startMonth = map.get("startDate1_str").substring(5, 7);
		String startDay = map.get("startDate1_str").substring(8, 10);

		JSONObject jso2 = new JSONObject();
		jso2.put("oneProductGp1", mapDecimal.get("oneProductGp1_00"));
		jso2.put("oneProductGp2", mapDecimal.get("oneProductGp2_00"));
		jso2.put("oneProductGp3", mapDecimal.get("oneProductGp3_00"));
		jso2.put("oneProductGp4", mapDecimal.get("oneProductGp4_00"));
		jso2.put("oneProductGp5", mapDecimal.get("oneProductGp5_00"));

		jso2.put("oneProductGp6", mapDecimal2.get("oneProductGp1_00"));
		jso2.put("oneProductGp7", mapDecimal2.get("oneProductGp2_00"));
		jso2.put("oneProductGp8", mapDecimal2.get("oneProductGp3_00"));
		jso2.put("oneProductGp9", mapDecimal2.get("oneProductGp4_00"));
		jso2.put("oneProductGp10", mapDecimal2.get("oneProductGp5_00"));
		jso2.put("startYear", startYear);
		jso2.put("startMonth", startMonth);
		jso2.put("startDay", startDay);

		return jso2.toString();
	}

	// LineChartPostSheet
	@RequestMapping(value = "/LineChartPostSheet", method = RequestMethod.POST)
	public @ResponseBody String LineChartPostSheet(@RequestParam("lineChartInfo") String lineChartInfo, Model model) 
			throws ParseException {
		JSONObject jso = new JSONObject(lineChartInfo);
		Integer productId = Integer.parseInt(jso.getString("productId"));
		Integer productId2 = Integer.parseInt(jso.getString("productId2"));
		HashMap<String, String> map = service.LineChartDateTransfer(jso.getString("startDateLine"));
		Double unitCost1 = service.getUnitCost(productId, map.get("startDate1_str"), map.get("endDate1_str"));
		Double unitCost2 = service.getUnitCost(productId, map.get("startDate2_str"), map.get("endDate2_str"));
		Double unitCost3 = service.getUnitCost(productId, map.get("startDate3_str"), map.get("endDate3_str"));
		Double unitCost4 = service.getUnitCost(productId, map.get("startDate4_str"), map.get("endDate4_str"));
		Double unitCost5 = service.getUnitCost(productId, map.get("startDate5_str"), map.get("endDate5_str"));
		Double unitCost6 = service.getUnitCost(productId2, map.get("startDate1_str"), map.get("endDate1_str"));
		Double unitCost7 = service.getUnitCost(productId2, map.get("startDate2_str"), map.get("endDate2_str"));
		Double unitCost8 = service.getUnitCost(productId2, map.get("startDate3_str"), map.get("endDate3_str"));
		Double unitCost9 = service.getUnitCost(productId2, map.get("startDate4_str"), map.get("endDate4_str"));
		Double unitCost10 = service.getUnitCost(productId2, map.get("startDate5_str"), map.get("endDate5_str"));
		
		JSONObject jso2 = new JSONObject();
		return "";
	}

	// HistogramPost
	@RequestMapping(value = "/HistogramPost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String HistogramPost(@RequestParam("HistogramInfo") String HistogramInfo, Model model)
			throws JSONException, ParseException {
		JSONObject jso = new JSONObject(HistogramInfo);
		Integer productId1 = Integer.parseInt(jso.getString("productId1"));
		Integer productId2 = Integer.parseInt(jso.getString("productId2"));
		Integer productId3 = Integer.parseInt(jso.getString("productId3"));
		Integer productId4 = Integer.parseInt(jso.getString("productId4"));
		Integer productId5 = Integer.parseInt(jso.getString("productId5"));
		
		String startDate = jso.getString("startDate");
		String endDate = jso.getString("endDate");
		String startDateSec = startDate + " 00:00:00";
		String endDateSec = endDate + " 23:59:59";
		
		jso.put("product1", service.getOneProductSalesShare(productId1, startDateSec, endDateSec));
		jso.put("product2", service.getOneProductSalesShare(productId2, startDateSec, endDateSec));
		jso.put("product3", service.getOneProductSalesShare(productId3, startDateSec, endDateSec));
		jso.put("product4", service.getOneProductSalesShare(productId4, startDateSec, endDateSec));
		jso.put("product5", service.getOneProductSalesShare(productId5, startDateSec, endDateSec));
		return jso.toString();
	}

	@RequestMapping(value = "/addFakeSalesOrders", method = RequestMethod.GET)
	public void addFakeSalesOrders() {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		Random rand = new Random();
		Integer orderSize = 50;
		LocalDateTime now = LocalDateTime.now();
		Integer days = 0;
		Integer hours = 0;
		for (int i = 0; i < orderSize; i++) {
			SalesOrderBean salesOrder = new SalesOrderBean();
			days += rand.nextInt(2);
			hours += rand.nextInt(2);
			Integer memberId = rand.nextInt(19) + 9;
			salesOrder.setMemberId(memberId);
			LocalDateTime nowTime = now.plusDays(days).plusHours(hours);
//			nowTime.plusDays(days);
//			nowTime.plusHours(rand.nextInt(5)+2);
			LocalDateTime later = nowTime.plusHours(rand.nextInt(4) + 2);
			String now_format = nowTime.format(formatter);
			String later_format = later.format(formatter);
			salesOrder.setOrderTime(now_format);
			salesOrder.setRequireTime(later_format);
			salesOrder.setNeedDelivery(rand.nextInt(2));
			salesOrder.setDeliverAddress("WonderLand");
			salesOrder.setOrderStatus(5);
			salesOrder.setNote("So_hungry");
			Integer totalSales = 0;
			Integer detailSize = rand.nextInt(5) + 1;
			List<SalesOrderDetailBean> salesOrderDetails = new ArrayList<>();
			for (int j = 0; j < detailSize; j++) {
				SalesOrderDetailBean salesOrderDetail = new SalesOrderDetailBean();
				Integer productId = rand.nextInt(32) + 1;
				salesOrderDetail.setProductId(productId);
				Integer unitPrice = (productId % 2 == 1 ? 329 : 229);
				Integer quantity = rand.nextInt(4) + 1;
				Integer doubleCheese = rand.nextInt(2);
				Integer crustTypeId = rand.nextInt(3);
				unitPrice += doubleCheese * 25 + (crustTypeId == 2 ? 60 : 0);
				totalSales += unitPrice * quantity;
				salesOrderDetail.setUnitPrice(unitPrice);
				salesOrderDetail.setQuantity(quantity);
				salesOrderDetail.setSalesListId(0);
				salesOrderDetail.setDiscount(1.0);
				salesOrderDetail.setDoubleCheese(doubleCheese);
				salesOrderDetail.setCrustTypeId(crustTypeId);
				salesOrderDetails.add(salesOrderDetail);
			}
			salesOrder.setTotalSales(totalSales);
			salesOrder.setSalesOrderDetails(salesOrderDetails);
			service.addFakeSalesOrder(salesOrder);
		}
	}
}