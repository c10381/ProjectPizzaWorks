package shopSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import _model.ProductBean;
import shopManageSystem.service.ProductService;
import shopSystem.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	ProductService pdService;
	ShopService shopService;

	@Autowired
	public void setPdService(ProductService pdService) {
		this.pdService = pdService;
	}

	@Autowired
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	@RequestMapping("/menu")
	public String getMenu(Model model) {
		List<ProductBean> products = pdService.getAllProducts();
		model.addAttribute("products", products);
		return "shopSystem/menu";
	}

//	@GetMapping(value="/shop/product", produces="text/html")
//	public String getProductByIdjson(Model model, @RequestParam("name") String productName) {
//		String json = shopService.getProductByNameJson(productName);
//		System.out.println(json);
//		model.addAttribute(json);
//		return "shopSystem/product" ;
//	}
	
	@RequestMapping("/product")
	public String getProductById(Model model, @RequestParam("name") String productName) {
		model.addAttribute("products", shopService.getProductByName(productName));
		return "shopSystem/product" ;
	}
	
	


}
