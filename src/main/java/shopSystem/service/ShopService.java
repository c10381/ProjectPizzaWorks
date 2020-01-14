package shopSystem.service;

import java.util.List;

import _model.ProductBean;
import _model.SalesOrderBean;

public interface ShopService {

	List<ProductBean> getProductByName(String productName);

	String getProductByNameJson(String productName);

	void saveOrder(SalesOrderBean SOB);

}
