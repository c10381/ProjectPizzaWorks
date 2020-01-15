package shopSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import _model.CrustBean;
import _model.SalesOrderBean;
import shopSystem.service.ShopService;

@RestController
@RequestMapping("/shop")
public class ShopRestController {

	ShopService service;

	@Autowired
	public void setShopService(ShopService service) {
		this.service = service;
	}

	@PostMapping(value = "/order", consumes = "application/json", produces = "application/json")
	public String saveOrder(@RequestBody SalesOrderBean SOB, HttpSession session) {
		service.saveOrder(SOB);
		return "OK";
	}

	@GetMapping(value = "/getCrust" , produces = "application/json")
	public List<CrustBean> getCrust() {
		return service.getCrustTest();
	}
}
