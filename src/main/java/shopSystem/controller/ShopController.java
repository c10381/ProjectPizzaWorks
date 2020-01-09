package shopSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import _model.ProductBean;
import shopManageSystem.service.ProductService;

@Controller
public class ShopController {
	ProductService pdService;
	
	@Autowired
	public void setService(ProductService pdService) {
		this.pdService = pdService;
	}
	
	@RequestMapping("/shop/menu")
	public String getMenu(Model model) {
		List<ProductBean> products = pdService.getAllProducts();
		model.addAttribute("products", products);
		return "shopSystem/menu";
	}
	
	
//	@RequestMapping("/getPicture")
//	public void getPicture(@PathVariable String imgname, HttpServletResponse response) {
//		
//		BufferedInputStream in = null;
//		BufferedOutputStream out = null;
//
//	}

}
