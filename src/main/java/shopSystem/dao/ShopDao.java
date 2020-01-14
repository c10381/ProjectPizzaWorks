package shopSystem.dao;

import java.util.List;

import _model.ProductBean;
import _model.SalesOrderBean;

public interface ShopDao {

	List<ProductBean> getProductByName(String productName);

	void saveOrder(SalesOrderBean sOB);

}
