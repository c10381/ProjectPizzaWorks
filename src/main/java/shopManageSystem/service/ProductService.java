package shopManageSystem.service;

import java.util.List;

import _model.ProductBean;
import _model.RecipeBean;
import shopManageSystem.dao.ProductDao;

public interface ProductService {

	void setDao(ProductDao dao);

	List<ProductBean> getAllProducts();
	
	ProductBean getProductById(int productId);
	
	void updateOneProduct(ProductBean pb);

	List<RecipeBean> getRecipeById(Integer id);

	void updateOneRecipe(RecipeBean recipe);

	void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId);

}