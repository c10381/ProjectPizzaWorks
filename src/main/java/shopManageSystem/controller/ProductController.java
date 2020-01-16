package shopManageSystem.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.ProductBean;
import _model.SalesOrderBean;
import _model.RecipeBean;
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
	@RequestMapping(value="/shopManageSystem/getProductById", method=RequestMethod.GET)
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "shopManageSystem/GetOneProduct";
	}
	
	@RequestMapping(value="/shopManageSystem/getProductById", method=RequestMethod.POST)
	public String UpdateOneProduct(@ModelAttribute("product") ProductBean pb, Model model) {
		service.updateOneProduct(pb);
		return "redirect:/shopManageSystem/products";
	}
	
	@RequestMapping("/shopManageSystem/products2")
	public String productsList2(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "shopManageSystem/products2";
	}
	
	@RequestMapping("/shopManageSystem/salesOrders")
	public String salesOrdersList(Model model) {
		List<SalesOrderBean> list = service.getAllSalesOrders();
		model.addAttribute("salesOrders", list);
		return "shopManageSystem/SalesOrders";
	}
	@RequestMapping(value="/shopManageSystem/updateRecipeById", method=RequestMethod.GET)
	public String getRecipeById(@RequestParam("id") Integer productId, Model model) {
		List<RecipeBean> list = service.getRecipeById(productId);
		model.addAttribute("recipeForm", list);
		model.addAttribute("productId", productId);
		return "shopManageSystem/RecipeByProductId";
	}	
	
	@RequestMapping(value="/shopManageSystem/updateRecipeById", method=RequestMethod.POST)
	public @ResponseBody String updateRecipeById(@RequestParam(value="recipes") String recipe_str, Model model) {
		System.out.println(recipe_str);
		JSONArray jsonArray = new JSONArray(recipe_str);
		if(jsonArray!=null && jsonArray.length()!=0) {
			for(int i = 0;i < jsonArray.length();i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				Integer productId = jsonObject.getInt("productId");
				Integer materialsId = jsonObject.getInt("materialsId");
				Double quantity = jsonObject.getDouble("quantity");
				String unit = jsonObject.getString("unit");
				service.updateOneRecipeJson(quantity, productId, materialsId);
			}
		}		
		return "OK!";
	}
	
	@RequestMapping(value="/shopManageSystem/getSalesOrder", method=RequestMethod.GET)
	public String getSalesOrder(@RequestParam("id") Integer salesOrderId, Model model) {
		model.addAttribute("salesOrder", service.getSalesOrderById(salesOrderId));
		return "shopManageSystem/GetSalesOrder";
	}
	
}