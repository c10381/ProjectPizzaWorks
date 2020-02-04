package shopManageSystem.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.sql.rowset.serial.SerialBlob;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import _model.MaterialsBean;
import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesOrderBean;
import shopManageSystem.service.ProductService;

@Controller
public class ProductRedirectController {
	ProductService service;

	@Autowired
	public void setService(ProductService service) {
		this.service = service;
	}

	ServletContext context;

	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}

	@RequestMapping("/shopManageSystem/products")
	public String productsList(Model model) {
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products", list);
		return "shopManageSystem/products";
	}

	// 按下首頁超連結後來此，再跳出oneProduct.jsp
	@RequestMapping(value = "/shopManageSystem/getProductById", method = RequestMethod.GET)
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("product", service.getProductById(id));
		return "shopManageSystem/GetOneProduct";
	}

	@RequestMapping("/shopManageSystem/salesOrders")
	public String salesOrdersList(Model model) {
		List<SalesOrderBean> list = service.getAllSalesOrders();
		model.addAttribute("salesOrders", list);
		return "shopManageSystem/SalesOrders";
	}

	@RequestMapping(value = "/shopManageSystem/updateRecipeById", method = RequestMethod.GET)
	public String getRecipeById(@RequestParam("id") Integer productId, Model model) {
		List<RecipeBean> list = service.getRecipeById(productId);
		model.addAttribute("recipeForm", list);
		model.addAttribute("productId", productId);
		return "shopManageSystem/RecipeByProductId";
	}

	@RequestMapping(value = "/shopManageSystem/getSalesOrder", method = RequestMethod.GET)
	public String getSalesOrder(@RequestParam("id") Integer salesOrderId, Model model) {
		List<Object> output = service.getSalesOrderDetails(salesOrderId);
		model.addAttribute("salesOrder", output.get(0));
		model.addAttribute("products", output.get(1));
		model.addAttribute("crusts", output.get(2));
		return "shopManageSystem/GetSalesOrder";
	}

	@RequestMapping(value = "/shopManageSystem/AddNewProduct", method = RequestMethod.GET)
	public String getAllMaterials(Model model) {
		model.addAttribute("materials", service.getAllMaterials());
		return "shopManageSystem/AddNewProduct";
	}

}