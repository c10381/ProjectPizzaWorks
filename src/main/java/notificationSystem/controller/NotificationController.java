package notificationSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.PurchaseRequestBean;
import _model.SalesOrderBean;
import _model.StockRequestBean;
import _model.ValidationRequestBean;
import _model.customerRequestBean;
import notificationSystem.service.NotificationService;


@RestController
@SessionAttributes("Mem_LoginOK")
public class NotificationController {
	
	NotificationService service;
	
	@Autowired
	public void setService(NotificationService service) {
		this.service = service;
	}

	@GetMapping(value = "/backendSystem/getOrderNotification" , produces = "application/json")
	public List<SalesOrderBean> getOrderNotification() {
		List<SalesOrderBean> uncheckedOrders = service.getUncheckedOrders();
		return uncheckedOrders;
	}
	
	@GetMapping(value = "/backendSystem/getPurchaseNotification" , produces = "application/json")
	public List<PurchaseRequestBean> getPurchaseNotification() {
		List<PurchaseRequestBean> requests = service.getPurchaseRequests();
		return requests;
	}
	
	@GetMapping(value = "/backendSystem/getStockNotification" , produces = "application/json")
	public List<StockRequestBean> getStockNotification() {
		List<StockRequestBean> requests = service.getStockRequests();
		return requests;
	}
	
	@GetMapping(value = "/backendSystem/getPwdChangeNotification" , produces = "application/json")
	public List<ValidationRequestBean> getPwdChangeNotification() {
		List<ValidationRequestBean> requests = service.getPwdChangeRequests();
		return requests;
	}
	
	@GetMapping(value = "/backendSystem/getUnreadRequestNotification" , produces = "application/json")
	public List<customerRequestBean> getUnreadRequestNotification() {
		List<customerRequestBean> requests = service.getUnreadRequests();
		return requests;
	}
}