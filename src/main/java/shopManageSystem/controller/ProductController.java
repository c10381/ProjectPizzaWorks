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
import _model.SalesListBean;
import _model.SalesListDetailBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopManageSystem.service.ProductService;

@Controller
public class ProductController {
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

	@RequestMapping(value = "/shopManageSystem/getProductById", method = RequestMethod.POST)
	public String UpdateOneProduct(@ModelAttribute("product") ProductBean pb, Model model)
			throws ServletException, IOException {
		MultipartFile productImage = pb.getProductImage();
		System.out.println(productImage);
		String originalFilename = productImage.getOriginalFilename();
		pb.setImagePath(originalFilename);

		if (productImage != null && !productImage.isEmpty()) {
			try {
				byte[] b = productImage.getBytes();
				SerialBlob blob = new SerialBlob(b);
				pb.setCoverImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
			}
		}
		service.updateOneProduct(pb);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = context.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "image");
			if (!imageFolder.exists()) {
				imageFolder.mkdirs();
			}
			File file = new File(imageFolder, pb.getProductId() + ext);
			productImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常" + e.getMessage());
		}
		return "redirect:/shopManageSystem/products";
	}

	@RequestMapping(value = "/picture/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(@PathVariable Integer productId) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		ProductBean product = service.getProductById(productId);
		if (product == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = product.getImagePath();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = product.getCoverImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		return re;
	}

	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value="/shopManageSystem/getAllSalesOrdersJson", method = RequestMethod.GET, produces = {
	"application/json;charset=UTF-8" })
	public @ResponseBody String salesOrdersList(Model model) {
		String salesOrders = service.getAllSalesOrdersJson();
		//model.addAttribute("salesOrders", list);
		return salesOrders;
	}

//	@RequestMapping(value = "/shopManageSystem/updateRecipeById", method = RequestMethod.GET)
//	public String getRecipeById(@RequestParam("id") Integer productId, Model model) {
//		List<RecipeBean> list = service.getRecipeById(productId);
//		model.addAttribute("recipeForm", list);
//		model.addAttribute("productId", productId);
//		return "shopManageSystem/RecipeByProductId";
//	}

	@RequestMapping(value = "/shopManageSystem/updateRecipeById", method = RequestMethod.POST)
	public @ResponseBody String updateRecipeById(@RequestParam(value = "recipes") String recipe_str, Model model) {
		System.out.println(recipe_str);
		JSONArray jsonArray = new JSONArray(recipe_str);
		if (jsonArray != null && jsonArray.length() != 0) {
			for (int i = 0; i < jsonArray.length(); i++) {
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

	@RequestMapping(value = "/shopManageSystem/updateRecipeBean", method = RequestMethod.POST)
	public @ResponseBody String updateRecipeBean(@RequestBody List<RecipeBean> recipes, Model model) {
		for(RecipeBean recipe : recipes) {
			System.out.println(recipe.getProductId()+", "+recipe.getMaterialsId()+", "+recipe.getQuantity());
		}
		service.updateRecipes(recipes);
		return "OK!";
	}

//	@RequestMapping(value = "/shopManageSystem/getSalesOrder", method = RequestMethod.GET)
//	public String getSalesOrder(@RequestParam("id") Integer salesOrderId, Model model) {
//		List<Object> output = service.getSalesOrderDetails(salesOrderId);
//		model.addAttribute("salesOrder", output.get(0));
//		model.addAttribute("products", output.get(1));
//		model.addAttribute("crusts", output.get(2));
//		return "shopManageSystem/GetSalesOrder";
//	}
//
//	@RequestMapping(value = "/shopManageSystem/AddNewProduct", method = RequestMethod.GET)
//	public String getAllMaterials(Model model) {
//		model.addAttribute("materials", service.getAllMaterials());
//		return "shopManageSystem/AddNewProduct";
//	}

	@RequestMapping(value = "/shopManageSystem/AddNewProduct", method = RequestMethod.POST)
	public @ResponseBody String addProductRecipes(@RequestParam(value = "recipes") String recipe_str, Model model) {
		System.out.println(recipe_str);
		List<RecipeBean> recipes = new ArrayList<>();
		JSONArray jsonArray = new JSONArray(recipe_str);
		if (jsonArray != null && jsonArray.length() != 0) {
			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				RecipeBean recipe = new RecipeBean();
//				recipe.setProductId(jsonObject.getInt("productId"));
				recipe.setMaterialsId(jsonObject.getInt("materialsId"));
				recipe.setQuantity(jsonObject.getDouble("quantity"));
				recipe.setUnit(jsonObject.getString("unit"));
				recipes.add(recipe);
			}
			ProductBean product = service.addRecipes(recipes);
			model.addAttribute("product", product);
			return "shopManageSystem/getProductById?id=" + product.getProductId();
		}
		return "";
//		return "shopManageSystem/updateRecipeById?id="+product.getProductId();
	}

	@RequestMapping(value = "/getAllMaterialsJSON", method = RequestMethod.GET, produces = { "application/json" })
	public @ResponseBody List<MaterialsBean> getAllMaterialsJSON(Model model) {
		List<MaterialsBean> materials = service.getAllMaterials();
		return materials;
	}

	@RequestMapping(value = "/shopManageSystem/updateProductStatus", method = RequestMethod.POST)
	public @ResponseBody String updateProductStatus(@RequestParam(value = "product") String product_str, Model model) {
		System.out.println(product_str);
		ProductBean product = null;
		JSONObject jsonObject = new JSONObject(product_str);
		if (jsonObject != null && jsonObject.length() != 0) {
			product = new ProductBean();
			product.setProductId(jsonObject.getInt("productId"));
			product.setActiveStatus(jsonObject.getInt("activeStatus"));
			service.updateOneProductStatus(product);
			return "OK!";
		}
		return "";
	}

	@RequestMapping(value = "/shopManageSystem/updateSalesOrderStatus", method = RequestMethod.POST)
	public @ResponseBody String updateSalesOrderStatus(@RequestParam(value = "salesOrder") String salesOrder_str,
			Model model) {
		System.out.println(salesOrder_str);
		SalesOrderBean salesOrder = null;
		JSONObject jsonObject = new JSONObject(salesOrder_str);
		if (jsonObject != null && jsonObject.length() != 0) {
			salesOrder = new SalesOrderBean();
			salesOrder.setSalesOrderId(jsonObject.getInt("salesOrderId"));
			salesOrder.setOrderStatus(jsonObject.getInt("orderStatus"));
			service.updateOneSalesOrderStatus(salesOrder);
			return "OK!";
		}
		return "";
	}
	
	@RequestMapping(value = "/shopManageSystem/saveSalesList", method=RequestMethod.POST)
	public @ResponseBody String saveSalesList(@RequestParam(value = "salesOrder_str") SalesOrderBean salesOrder, Model model) {
		service.saveSalesList(salesOrder);
		return "/shopManageSystem/GetAllSalesOrder";
	} 
}