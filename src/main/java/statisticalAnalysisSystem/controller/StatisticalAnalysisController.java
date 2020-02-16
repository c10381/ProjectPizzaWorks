package statisticalAnalysisSystem.controller;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
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

	// 導向ShowPieChart.jsp
	@GetMapping(value = "/toPieChart")
	public String redirectPieChart(Model model) {
		return "/StatisticalAnalysis/ShowPieChart";
	}

	// 導向GrossProfitTrend.jsp(暫無用)
	@GetMapping(value = "/LineChartTest")
	public String showLineChart(Model model) {
		return "/StatisticalAnalysis/GrossProfitTrend";
	}
	
	// 導向ProductHisotgram.jsp
	@GetMapping(value = "/toHistogram")
	public String showHisotgram(Model model) {
		return "/StatisticalAnalysis/ProductHistogram";
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
		System.out.println("prolineChartInfoduct = " + lineChartInfo);
		JSONObject jso = new JSONObject(lineChartInfo);
		Integer productId = Integer.parseInt(jso.getString("productId"));
		String startDateLine = jso.getString("startDateLine");
		// 若兩某時段，該產品原物料皆未被進貨，算出之兩比例會相等，折線圖會變成水平線
		// 以下計算第二時間點、第三時間點
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime endDate1 = LocalDateTime.parse(startDateLine + " 23:59:59", formatter);
		LocalDateTime endDate2 = endDate1.plusMonths(1);
		LocalDateTime endDate3 = endDate2.plusMonths(1);
		LocalDateTime startDate1 = endDate1.minusMonths(3).minusDays(1).plusSeconds(1);
		LocalDateTime startDate2 = startDate1.plusMonths(1);
		LocalDateTime startDate3 = startDate2.plusMonths(1);

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
	// 取出有key值為product開頭的產品去進行計算，再放到輸出物件中
	@RequestMapping(value = "/HistogramPost", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String HistogramPost(@RequestParam("HistogramInfo") String HistogramInfo, Model model)
			throws JSONException, ParseException {
		JSONObject jso = new JSONObject(HistogramInfo);
		JSONObject cloneToOutput = new JSONObject(HistogramInfo); // 用來輸出的
		// 取出開始/ 結尾日
		String startDate = jso.getString("startDate");
		String endDate = jso.getString("endDate");
		String startDateSec = startDate + " 00:00:00";
		String endDateSec = endDate + " 23:59:59";
		
		Iterator<String> keys = jso.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			if(key.substring(0, 7).equals("product")) {
				String index = "product" + (key.substring(key.length()-1, key.length())); 
				Integer valProductId = Integer.parseInt(jso.getString(key));
				Double val = service.getOneProductSalesShare(valProductId, startDateSec, endDateSec);
//				keys.remove();
				cloneToOutput.put(index, val ); 
			}
		} ;
		return cloneToOutput.toString();
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
	
	// PieChartPost
		@RequestMapping(value = "/GetPieChartValue", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		public @ResponseBody String GetPieChartValue(@RequestParam("input_json") String input_json, Model model)
				throws JSONException, ParseException {
			JSONArray output_jsa = new JSONArray();
			System.out.println(input_json);
			JSONObject input_jso = new JSONObject(input_json);
			String startDate = input_jso.getString("startDate") + " 00:00:00";
			String endDate= input_jso.getString("endDate") + " 23:59:59";
			JSONArray input_option_jsa = input_jso.getJSONArray("input_option");
			for(int i = 0; i<input_option_jsa.length();i++) {
				JSONObject input_option_jso = input_option_jsa.getJSONObject(i);
				Double y = service.getOneProductSalesShare(input_option_jso.getInt("productId"), startDate, endDate);
				JSONObject output_jso = new JSONObject();
				output_jso.put("productName", input_option_jso.getString("productName"));
				output_jso.put("productValue", y);
				output_jsa.put(output_jso);
			}
			return output_jsa.toString();
		}
}