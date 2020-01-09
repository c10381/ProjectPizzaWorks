package shopManageSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _model.ProductBean;
import shopManageSystem.service.ProductService;

@Controller
public class ProductController {
	ProductService service;
	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}
	
	@RequestMapping("/shopManageSystem/products")
	public String productsList(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "shopManageSystem/products";
	}
	
//	@RequestMapping("/")
//	public String home(Model model) {
//		System.out.println("YEe");
//		return "index";
//	}
	
}
