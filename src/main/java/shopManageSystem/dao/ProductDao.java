package shopManageSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.CrustBean;
import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.MembersBean;
import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesListBean;
import _model.SalesListDetailBean;
import _model.SalesOrderBean;

public interface ProductDao {

	void setFactory(SessionFactory factory);

	List<ProductBean> getAllProducts();

	// 供網站管理員修改商品上架否之方法
	void updateOneProduct(ProductBean pb);

	ProductBean getProductById(Integer productId);
	
	List<SalesOrderBean> getAllSalesOrders();
	
	void updateOneRecipe(RecipeBean recipe);

	void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId);

	SalesOrderBean getSalesOrderById(Integer salesOrderId);

	List<MaterialsBean> getAllMaterials();

	ProductBean InsertProduct(ProductBean product);

	void InsertRecipes(List<RecipeBean> recipes);

	void InsertRecipe(RecipeBean recipe);

	List<CrustBean> getCrustByTypeId(Integer crustTypeId);

	void updateOneSalesOrder(SalesOrderBean salesOrder);

	void updateProductStatus(ProductBean product);

	void updateSalesOrderStatus(SalesOrderBean salesOrder);

	List<ProductBean> getAllActiveProducts();

	MaterialsUnitBean getMaterialsUnitByMId(Integer materialsId);

	Integer InsertSalesList(SalesListBean salesList);

	void InsertSalesListDetail(SalesListDetailBean salesListDetail);

	void updateMaterialBySalesList(SalesListDetailBean salesListDetail);

	MembersBean getMemberById(Integer membersId);

	void updateStorageHistoryBySalesList(SalesListDetailBean salesListDetail);
}