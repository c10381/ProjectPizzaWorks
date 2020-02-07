package shopSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _model.ProductBean;
import _model.WebInfo;
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

	@RequestMapping("/")
	public String getIndex(Model model) {
		return "shopSystem/index";
	}
	
	
	@RequestMapping("/menu")
	public String getMenu(Model model) {
		//List<ProductBean> products = pdService.getAllProducts();
		List<ProductBean> products = pdService.getAllActiveProducts();
		model.addAttribute("products", products);
		return "shopSystem/menu";
	}
	
	@RequestMapping("/checkout")
	public String checkOut(Model model) {
		return "shopSystem/checkout";
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
	
	@RequestMapping("/cart")
		public String getCart(Model model) {
		
		return "shopSystem/cart";
	}
	@RequestMapping("/story")
	public String getStory(Model model) {
		return "shopSystem/story";
	}
	

	@RequestMapping("/redirectWebInfo")
	public String redirectWebInfo(Model model) {
		model.addAttribute("Bean", new WebInfo());
		return "/shopSystem/backEnd/EditInfo";
	}
	
	
	@RequestMapping("/insertWebInfo")
	public String insertWebInfo(WebInfo webinfo) {
		shopService.insertWebInfo(webinfo);
		return "/shopSystem/SuccessInsertWebInfo";
	}
	
	@RequestMapping("/getWebInfo")
	public @ResponseBody String getWebInfo() {
		Gson gson=new Gson();
		return gson.toJson(shopService.getWebInfo());
	}

}
