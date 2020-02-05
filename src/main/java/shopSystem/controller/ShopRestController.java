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
import _model.MembersBean;
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
	System.out.println(session.getAttribute("CLoginOK"));
	MembersBean mb = (MembersBean) session.getAttribute("CLoginOK");
	SOB.setMemberId(mb.getMemberId());
	service.saveOrder(SOB);
		// 可以的話改為新增後的訂單編號
		return "OK";
	}

	@GetMapping(value = "/getCrust" , produces = "application/json")
	public List<CrustBean> getCrust() {
		return service.getCrust();
	}
}
