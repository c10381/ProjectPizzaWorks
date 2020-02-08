package stockSystem.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import stockSystem.service.StockService;

@Controller
public class StockRedirectController {
	
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

	@RequestMapping("/stock/GetAllMaterials")
	public String fowardMaterials() {
		return "stockSystem/GetAllMaterials";
	}
	
	@RequestMapping("/stock/GetAllStockRequest")
	public String fowardGetAllStockRequest() {
		return "stockSystem/GetAllStockRequest";
	}
	
	@RequestMapping("/stock/GetAllStockHistory")
	public String forwardGetAllStockHistory() {
		return "stockSystem/GetAllStockHistory";
	}
}
