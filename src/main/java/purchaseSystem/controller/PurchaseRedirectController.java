package purchaseSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PurchaseRedirectController {

	@RequestMapping("/purchase/GetAllMaterials")
	public String fowardMaterials() {
		return "purchaseSystem/GetAllMaterials";
	}
	@RequestMapping("/purchase/AddPurchaseRequest")
	public String fowardPurchaseRequest() {
		return "purchaseSystem/AddPurchaseRequest";
	}
	@RequestMapping("/purchase/GetAllPurchaseRequest")
	public String fowardGetAllPurchaseRequest() {
		return "purchaseSystem/GetAllPurchaseRequest";
	}
	@RequestMapping("/purchase/GetAllPurchaseOrder")
	public String forwardGetAllPurchaseOrder() {
		return "purchaseSystem/GetAllPurchaseOrder";
	}
}
