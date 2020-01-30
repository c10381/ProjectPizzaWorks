package purchaseSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PurchaseRedirectController {

	
	@RequestMapping("/purchase/GetAllMaterials")
	public String fowardMaterials() {
		return "purchaseSystem/GetAllMaterials";
	}
	@RequestMapping("/purchase/FormPurchaseRequest")
	public String fowardPurchaseRequest() {
		return "purchaseSystem/PurchaseRequest";
	}
}
