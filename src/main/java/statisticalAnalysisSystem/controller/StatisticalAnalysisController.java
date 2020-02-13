package statisticalAnalysisSystem.controller;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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

	// 接收上述下拉式選單資料Controller
	@RequestMapping(value="/catchPInfoFromClient", method = RequestMethod.POST,
			produces = "application/json")
		public @ResponseBody String catchPInfoFromClient(@RequestParam("jsa_str") String jsa_str
				, Model model) throws JSONException, ParseException {
		System.out.println(jsa_str);
		Integer productId = Integer.parseInt(jsa_str);
		JSONObject jso = new JSONObject();
		jso.put("product1", service.getOneProductSalesShare(productId, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
//			JSONArray jsa = new JSONArray(jsa_str);
//			
//			if(jsa != null && jsa.length() != 0) {
//				for(int i = 0; i<jsa.length(); i++) {
//					JSONObject jso = (JSONObject)jsa.get(i);
//					System.out.println("jso = " + jso);
//				}
//			}
			return jso.toString();
		}

	// 圓餅圖Controller(使用者初次進入數據分析頁面時所顯示的預設畫面)
	@RequestMapping(value = "/PieChartTest_proto", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String showPieChartJson(Model model) throws ParseException {
		JSONObject jso = new JSONObject();
		jso.put("product1", service.getOneProductSalesShare(1, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product2", service.getOneProductSalesShare(2, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product3", service.getOneProductSalesShare(3, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		return jso.toString();
	}

	// 折線圖Controller
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
		System.out.println("prolineChartInfoduct = " + lineChartInfo);
		JSONObject jso = new JSONObject(lineChartInfo);
		Integer productId = Integer.parseInt(jso.getString("productId"));
		String startDateLine = jso.getString("startDateLine");
		// 若兩某時段，該產品原物料皆未被進貨，算出之兩比例會相等，折線圖會變成水平線
		//以下計算第二時間點、第三時間點
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime endDate1 = LocalDateTime.parse(startDateLine + " 23:59:59", formatter);
		LocalDateTime endDate2 = endDate1.plusMonths(1);
		LocalDateTime endDate3 = endDate2.plusMonths(1);
		LocalDateTime startDate1 = endDate1.minusMonths(4).minusDays(1).plusSeconds(1);
		LocalDateTime startDate2 = endDate2.minusMonths(4).minusDays(1).plusSeconds(1);
		LocalDateTime startDate3 = endDate3.minusMonths(4).minusDays(1).plusSeconds(1);
		
		
//		LocalDateTime startDate2 = startDate1.plusMonths(1);
//		LocalDateTime startDate3 = startDate2.plusMonths(1);
		String startDate1_str = startDate1.format(formatter);
		String startDate2_str = startDate2.format(formatter);
		String startDate3_str = startDate3.format(formatter);
		String endDate1_str = endDate1.format(formatter);
		String endDate2_str = endDate2.format(formatter);
		String endDate3_str = endDate3.format(formatter);
		
		Double oneProductGp1_0000 = service.getOneProductGp(productId, startDate1_str, endDate1_str);
		Double oneProductGp2_0000 = service.getOneProductGp(productId, startDate2_str, endDate2_str);
		Double oneProductGp3_0000 = service.getOneProductGp(productId, startDate3_str, endDate3_str);
		// 把GP小數位數改成小數點兩位
		DecimalFormat df = new DecimalFormat("######0.00");
		String oneProductGp1_0000_string = df.format(oneProductGp1_0000);
		String oneProductGp2_0000_string = df.format(oneProductGp2_0000);
		String oneProductGp3_0000_string = df.format(oneProductGp3_0000);
		Double oneProductGp1_00 = Double.parseDouble(oneProductGp1_0000_string);
		Double oneProductGp2_00 = Double.parseDouble(oneProductGp2_0000_string);
		Double oneProductGp3_00 = Double.parseDouble(oneProductGp3_0000_string);

		// 把起日拆成年、月、日
		String startYear = startDate1_str.substring(0, 4);
		String startMonth = startDate1_str.substring(5, 7);
		String startDay = startDate1_str.substring(8, 10);
		System.out.println("yyyy = " + startYear + ";mm = " + startMonth + ";dd = " + startDay);

		JSONObject jso2 = new JSONObject();
		jso2.put("oneProductGp1", oneProductGp1_00);
		jso2.put("oneProductGp2", oneProductGp2_00);
		jso2.put("oneProductGp3", oneProductGp3_00);
		jso2.put("startYear", startYear);
		jso2.put("startMonth", startMonth);
		jso2.put("startDay", startDay);

		return jso2.toString();
	}

	// HistogramGet
	@RequestMapping(value = "/HistogramGet", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String HistogramGet(Model model) throws ParseException {
		JSONObject jso = new JSONObject();
		jso.put("product1", service.getOneProductSalesShare(1, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product2", service.getOneProductSalesShare(2, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product3", service.getOneProductSalesShare(3, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product4", service.getOneProductSalesShare(4, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		jso.put("product5", service.getOneProductSalesShare(5, "2020-02-01 00:00:00", "2020-02-05 00:00:00"));
		return jso.toString();
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
		Integer orderSize = 189;
		LocalDateTime now = LocalDateTime.parse("2020-09-05 12:00:00",formatter);
//		LocalDateTime now = LocalDateTime.now();
		Integer days = 0;
		Integer hours = 0;
		Integer timeInterval = 6;
		for (int i = 0; i < orderSize; i++) {
			SalesOrderBean salesOrder = new SalesOrderBean();
			Integer memberId = rand.nextInt(19) + 9;
			salesOrder.setMemberId(memberId);
			days += rand.nextInt(timeInterval);
			hours += rand.nextInt(timeInterval);
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