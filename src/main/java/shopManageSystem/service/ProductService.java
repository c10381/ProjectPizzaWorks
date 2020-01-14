package shopManageSystem.service;

import java.util.List;

import _model.ProductBean;
import _model.SalesOrderBean;
import shopManageSystem.dao.ProductDao;

public interface ProductService {

	void setDao(ProductDao dao);

	List<ProductBean> getAllProducts();
	
	ProductBean getProductById(Integer productId);
	
	void updateOneProduct(ProductBean pb);

	
	List<SalesOrderBean> getAllSalesOrders();

	SalesOrderBean getSalesOrderById(Integer salesOrderId);
}