package shopManageSystem.service;

import java.util.List;

import _model.MaterialsBean;
import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesOrderBean;
import shopManageSystem.dao.ProductDao;

public interface ProductService {

	void setDao(ProductDao dao);

	List<ProductBean> getAllProducts();
	
	ProductBean getProductById(Integer productId);
	
	void updateOneProduct(ProductBean pb);

	List<SalesOrderBean> getAllSalesOrders();
	
	List<RecipeBean> getRecipeById(Integer id);

	void updateOneRecipe(RecipeBean recipe);

	void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId);

	SalesOrderBean getSalesOrderById(Integer salesOrderId);

	ProductBean addRecipes(List<RecipeBean> recipes);

	List<MaterialsBean> getAllMaterials();

	List<Object> getSalesOrderDetails(Integer salesOrderId);

	void updateOneSalesOrder(SalesOrderBean salesOrder);

	void updateOneSalesOrderStatus(SalesOrderBean salesOrder);

	void updateOneProductStatus(ProductBean product);

	void updateRecipes(List<RecipeBean> recipes);

	List<ProductBean> getAllActiveProducts();

	String getAllSalesOrdersJson();

	void saveSalesList(SalesOrderBean salesOrder);

	String getAllSalesListsJson();

	String getSalesListJson(Integer salesListId);
}