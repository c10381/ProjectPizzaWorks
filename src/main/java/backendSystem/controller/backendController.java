package backendSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.SalesOrderBean;
import backendSystem.msgService.msgService;


@RestController
@SessionAttributes("Mem_LoginOK")
public class backendController {
	
	msgService service;
	
	@Autowired
	public void setService(msgService service) {
		this.service = service;
	}

	@GetMapping(value = "/backendSystem/getOrders" , produces = "application/json")
	public List<SalesOrderBean> getOrders() {
		return service.getOrders();
	}
}