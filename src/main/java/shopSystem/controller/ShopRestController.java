package shopSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopSystem.service.ShopService;

@RestController
@RequestMapping("/shop")
public class ShopRestController {
	
	ShopService service;
	@Autowired
	public void setShopService(ShopService service) {
		this.service = service;
	}
	
	@PostMapping(value="/order", consumes="application/json", produces="application/json")
	public String saveOrder(@RequestBody SalesOrderBean SOB) {
		List<SalesOrderDetailBean> list = SOB.getSalesOrderDetails();
		for(SalesOrderDetailBean sd: list) {
			sd.setSalesOrder(SOB);
//			System.out.println(sd.getProductId());
//			System.out.println(sd.getSalesOrder());
		}
		service.saveOrder(SOB);
		
		
		return "OK";
	}
}
