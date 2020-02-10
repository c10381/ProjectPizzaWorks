package shopManageSystem.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _model.CrustBean;
import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesListBean;
import _model.SalesListDetailBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopManageSystem.dao.ProductDao;
import shopManageSystem.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {
	ProductDao dao; 
	
	@Override
	@Autowired
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public List<ProductBean> getAllProducts(){
		return dao.getAllProducts();
	}
	
	@Transactional
	@Override
	public List<ProductBean> getAllActiveProducts(){
		return dao.getAllActiveProducts();
	}
	
	@Transactional
	@Override
	public ProductBean getProductById(Integer productId) {
		return dao.getProductById(productId);
	}
	
	@Transactional
	@Override
	public void updateOneProduct(ProductBean pb) {
		if(pb.getActiveStatus() == null) {
			pb.setActiveStatus(0);
		}
		dao.updateOneProduct(pb);
	}
	
	@Transactional
	@Override
	public List<RecipeBean> getRecipeById(Integer productId) {
		ProductBean product = dao.getProductById(productId);
//		List<RecipeBean> list = dao.getRecipeById(id);
		return product.getRecipes();
	}
	@Transactional
	@Override
	public void updateOneRecipe(RecipeBean recipe) {
		dao.updateOneRecipe(recipe);		
	}
	@Transactional
	@Override
	public void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId) {
		dao.updateOneRecipeJson(quantity, productId, materialsId);
	}
	
	@Transactional
	@Override
	public List<SalesOrderBean> getAllSalesOrders(){
		return dao.getAllSalesOrders();
	}
	
	@Transactional
	@Override
	public SalesOrderBean getSalesOrderById(Integer salesOrderId) {
		return dao.getSalesOrderById(salesOrderId);
		
	}
	
	@Transactional
	@Override
	public ProductBean addRecipes(List<RecipeBean> recipes) {
		ProductBean product_temp = new ProductBean("PlaceHolderName", "PlaceHoldingInfo", 100, 0, 0, 0, 0, 0, 0, 0, "PlaceHoldingPath");
		product_temp = dao.InsertProduct(product_temp);
		for(RecipeBean recipe: recipes) {
			recipe.setProductId(product_temp.getProductId());
		}
		dao.InsertRecipes(recipes);
		return product_temp;
	}
	
	@Transactional
	@Override
	public List<MaterialsBean> getAllMaterials(){
		return dao.getAllMaterials();
	}
	
	@Transactional
	@Override
	public List<Object> getSalesOrderDetails(Integer salesOrderId) {
		//依照訂單Id取出單一訂單資訊
		SalesOrderBean salesOrder = dao.getSalesOrderById(salesOrderId);
		List<ProductBean> products = new ArrayList<>();
		List<CrustBean> crusts = new ArrayList<>();
		for(SalesOrderDetailBean saleOrderDetail: salesOrder.getSalesOrderDetails()) {
			ProductBean product = new ProductBean();
			product = dao.getProductById(saleOrderDetail.getProductId());
			products.add(product);
			
			CrustBean crust = new CrustBean();
			crust = dao.getCrustByTypeId(saleOrderDetail.getCrustTypeId()).get(0);
			crusts.add(crust);
		}
		List<Object> output = new ArrayList<>();
		output.add(salesOrder);
		output.add(products);
		output.add(crusts);
		return output;
	}
	
	@Transactional
	@Override
	public void updateOneSalesOrder(SalesOrderBean salesOrder) {
		if(salesOrder.getOrderStatus() == null) {
			salesOrder.setOrderStatus(0);
		}
		dao.updateOneSalesOrder(salesOrder);
	}
	
	@Transactional
	@Override
	public void updateOneSalesOrderStatus(SalesOrderBean salesOrder) {
		if(salesOrder.getOrderStatus() == null) {
			salesOrder.setOrderStatus(0);
		}
		dao.updateSalesOrderStatus(salesOrder);
	}
	
	@Transactional
	@Override
	public void updateOneProductStatus(ProductBean product) {
		if(product.getActiveStatus() == null) {
			product.setActiveStatus(0);
		}
		dao.updateProductStatus(product);
	}
	
	@Transactional
	@Override
	public void updateRecipes(List<RecipeBean> recipes) {
		for(RecipeBean recipe: recipes) {
			dao.updateOneRecipe(recipe);
		}
	}

	@Transactional
	@Override
	public String getAllSalesOrdersJson() {
		List<SalesOrderBean> salesOrders = dao.getAllSalesOrders();
		JSONArray salesOrders_jsa = new JSONArray(salesOrders);
		for(int i=0;i<salesOrders_jsa.length();i++) {
			JSONObject salesOrders_jso = salesOrders_jsa.getJSONObject(i);
			salesOrders_jso.put("salesOrderId", salesOrders.get(i).getSalesOrderId());
			JSONArray salesOrderDetails_jsa = salesOrders_jso.getJSONArray("salesOrderDetails");
			for(int j=0;j<salesOrderDetails_jsa.length();j++) {
				JSONObject salesOrderDetails_jso = salesOrderDetails_jsa.getJSONObject(j);
				salesOrderDetails_jso.put("salesOrderDetails", salesOrders.get(i).getSalesOrderDetails().get(j).getSalesOrderDetailId());
			}
		}
		String salesOrders_str = salesOrders_jsa.toString();
		return salesOrders_str;
	}
	
	@Transactional
	@Override
	public void saveSalesList(SalesOrderBean salesOrder) { 
		SalesListBean salesList = new SalesListBean();
		salesList.setSalesOrderId(salesOrder.getSalesOrderId());
		salesList.setMemberId(salesOrder.getMemberId());
		salesList.setOrderTime(salesOrder.getOrderTime());
		salesList.setTotalSales(salesOrder.getTotalSales());
		List<SalesListDetailBean> salesListDetails = new ArrayList<>();
		Map<Integer, Integer> materials_cost = new HashMap<>();
		for(SalesOrderDetailBean salesOrderDetail: salesOrder.getSalesOrderDetails()) {
			SalesListDetailBean salesListDetail = new SalesListDetailBean();
			List<CrustBean> crusts = dao.getCrustByTypeId(salesOrderDetail.getCrustTypeId());
			// Start From HERE
//			List<MaterialsUnitBean> materialsUnits = dao.getMaterialsUnitsByRecipes(dao.getProductById(salesOrderDetail.getProductId()).getRecipes());
			for(CrustBean crust: crusts) {
				if(materials_cost.containsKey(crust.getMaterialsId())) {
					Integer materials_quantity = materials_cost.get(crust.getMaterialsId())+crust.getQuantity().intValue();
//					materials_cost.get(crust.getMaterialsId()) = materials_quantity;
//					materials_cost.
				} else {
					materials_cost.put(crust.getMaterialsId(), crust.getQuantity().intValue());
				}
			}
//			if(materials_cost.containsKey(crusts.get(0).getMaterialsId()))
//			materials_cost.put(key, value)
//			salesListDetail.setMaterialsId(salesOrderDetail.get);
		}
	}
	
	
}
