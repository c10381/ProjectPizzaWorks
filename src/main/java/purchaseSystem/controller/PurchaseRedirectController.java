package purchaseSystem.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.SuppliersProvisionBean;
import purchaseSystem.service.PurchaseService;

@Controller
public class PurchaseRedirectController {
	
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
	

	@RequestMapping("/purchase/GetAllMaterials")
	public String fowardMaterials() {
		return "purchaseSystem/GetAllMaterials";
	}
	
	@RequestMapping("/purchase/GetAllPurchaseRequest")
	public String fowardGetAllPurchaseRequest() {
		return "purchaseSystem/GetAllPurchaseRequest";
	}
	@RequestMapping("/purchase/AddPurchaseRequest")
	public String fowardPurchaseRequest(Model model) {
		
		List<MaterialsBean> materials = service.getAllMaterials();
		List<MaterialsUnitBean> materialUnits = service.getAllMaterialsUnits();
		List<SuppliersProvisionBean> suppliersProvisions = service.getAllSuppliersProvisions();
		
		model.addAttribute("materials", materials);
		model.addAttribute("materialsUnits", new JSONArray(materialUnits).toString());
		model.addAttribute("suppliersProvisions", new JSONArray(suppliersProvisions).toString());
		return "purchaseSystem/AddPurchaseRequest";
	}
	
	
	@RequestMapping("/purchase/GetAllPurchaseOrder")
	public String forwardGetAllPurchaseOrder() {
		return "purchaseSystem/GetAllPurchaseOrder";
	}
}
