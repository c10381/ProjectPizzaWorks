package shopSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import _model.MembersBean;
import _model.ProductBean;
import _model.WebInfo;
import shopManageSystem.service.ProductService;
import shopSystem.service.ShopService;

@Controller
@SessionAttributes("CLoginOK")
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

	// 取得所有產品
	@RequestMapping("/shop/menu")
	public String getMenu(Model model) {
		// List<ProductBean> products = pdService.getAllProducts();
		List<ProductBean> products = pdService.getAllActiveProducts();
		model.addAttribute("products", products);
		return "shopSystem/menu";
	}

	// 導向結帳頁面
	@RequestMapping("/shop/checkout")
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
	// 導向單一頁面
	@RequestMapping("/shop/product")
	public String getProductById(Model model, @RequestParam("name") String productName) {
		model.addAttribute("products", shopService.getProductByName(productName));
		return "shopSystem/product";
	}

	// 導向購物車頁面
	@RequestMapping("/shop/cart")
	public String getCart(Model model) {
		return "shopSystem/cart";
	}

	// 導向關於我們頁面
	@RequestMapping("/shop/story")
	public String getStory(Model model) {
		return "shopSystem/story";
	}

	// 轉址後台修改前台網站頁面
	@RequestMapping("/shop/redirectWebInfo")
	public String redirectWebInfo(Model model) {
		model.addAttribute("Bean", new WebInfo());
		return "/shopSystem/backEnd/EditInfo";
	}

	// 轉址後台修改成功頁面
	@RequestMapping("/insertWebInfo")
	public String insertWebInfo(WebInfo webinfo) {
		shopService.insertWebInfo(webinfo);
		return "/shopSystem/SuccessInsertWebInfo";
	}

	// 取得網站資訊，回傳給前台修改
	@RequestMapping("/getWebInfo")
	public @ResponseBody String getWebInfo() {
		Gson gson = new Gson();
		return gson.toJson(shopService.getWebInfo());
	}

	// 依照顧客登入Bean取得所有訂單
	@GetMapping("/member/orders")
	public String getAllOrders(@ModelAttribute("CLoginOK") MembersBean member, Model model) {
		Integer memberId = member.getMemberId();
		String orders = shopService.getMemberAllOrders(memberId);
		System.out.println(orders);
		model.addAttribute("orders", orders);
		return "/shopSystem/GetMemberOrders";
	}

	// 導向聯絡我們
	@RequestMapping("/shop/contactUs")
	public String getContactUs() {
		return "shopSystem/ContactUs";
	}
}
