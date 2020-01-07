package shopManageSystem.service;

import java.util.List;

import _model.ProductBean;
import shopManageSystem.dao.ProductDao;

public interface ProductService {

	void setDao(ProductDao dao);

	List<ProductBean> getAllProducts();

}