package shopManageSystem.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _model.CrustBean;
import _model.MaterialsBean;
import _model.ProductBean;
import _model.RecipeBean;
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
}
