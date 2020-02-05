package statisticalAnalysisSystem.controller;

import java.text.ParseException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

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

	// 圓餅圖測試1
	@GetMapping(value = "/PieChartTest")
	public String showPieChart(Model model) {
		return "/StatisticalAnalysis/ProductShare";
	}

	// 圓餅圖測試JSON
	@RequestMapping(value = "/PieChartTest_proto", method = RequestMethod.GET, produces = "application/json")
	public String showPieChartJson(Model model) throws ParseException {
		service.getOneProductSalesShare(1);
		service.getOneProductSalesShare(2);
		service.getOneProductSalesShare(3);
		System.out.println(service.getOneProductSalesShare(1));
		return "StatisticalAnalysis/ProductShare";
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
				totalSales += unitPrice*quantity;
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