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
	@RequestMapping("/purchase/FormPurchaseRequest")
	public String fowardPurchaseRequest() {
		return "purchaseSystem/PurchaseRequest";
	}
	@RequestMapping("/purchase/GetAllPRequest")
	public String fowardGetAllPRequest(Model model) {
		model.addAttribute("product" ,"AAAAAAA");
		return "purchaseSystem/GetAllPurchaseRequest";
	}
}
