package shopManageSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	//按下首頁超連結後來此，再跳出oneProduct.jsp
	@RequestMapping("/shopManageSystem/getProductById")
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "shopManageSystem/GetOneProduct";
	}
	
	//參數應為json物件，在此controller進行解包，在此之前應有第二頁前端
	@RequestMapping("/shopManageSystem/updateOneProduct")
	public String updateOneProduct(@RequestParam("pb") ProductBean pb, Model model) {
		return "shopManageSystem/updateProductProperties";
	}
	
	@RequestMapping("/shopManageSystem/products2")
	public String productsList2(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "shopManageSystem/products2";
	}
	
//	@RequestMapping("/_global/images/{imagePath}")
//	public String productImage(@RequestParam("imagePath") String imagePath, Model model) {
////		String imagePath = service.getImagePathById(productId);
//		System.out.println("getImage");
//		System.out.println("_global/images/"+imagePath);
//		return "_global/images/"+imagePath;
//	}
	
}
