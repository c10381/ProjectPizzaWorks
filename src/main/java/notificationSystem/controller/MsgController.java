package notificationSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.SalesOrderBean;
import notificationSystem.service.MsgService;


@RestController
@SessionAttributes("Mem_LoginOK")
public class MsgController {
	
	MsgService service;
	
	@Autowired
	public void setService(MsgService service) {
		this.service = service;
	}

	@GetMapping(value = "/backendSystem/getOrders" , produces = "application/json")
	public List<SalesOrderBean> getOrders() {

		List<SalesOrderBean> salesOrders = service.getOrders();
//		for(SalesOrderBean salesOrder : salesOrders) {
//			//salesOrders.setSalesOrderDetails(null);
//			for(SalesOrderDetailBean saleOrderDetail : salesOrder.getSalesOrderDetails()) {
//				saleOrderDetail.setSalesOrder(null);
//			}
//		}
		return salesOrders;
	}
}