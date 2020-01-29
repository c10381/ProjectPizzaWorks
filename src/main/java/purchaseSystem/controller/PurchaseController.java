package purchaseSystem.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.PurchaseRequestBean;
import purchaseSystem.service.PurchaseService;

@Controller
public class PurchaseController {
	
	PurchaseService service;
	
	@Autowired
	public void setService(PurchaseService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	
	//查詢所有請購單
	@RequestMapping(value = "/getAllPurchaseRequestJSON", method = RequestMethod.GET, 
			produces = {"application/json"})
	public @ResponseBody List<PurchaseRequestBean> getAllPurchaseRequestJSON(Model model) {
		List<PurchaseRequestBean> PurchaseRequest = service.getAllPurchaseRequest();
		return PurchaseRequest;
	}
	
	
}
