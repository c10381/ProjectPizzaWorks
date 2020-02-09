package shopSystem.dao;

import java.util.List;

import _model.CrustBean;
import _model.ProductBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import _model.WebInfo;

public interface ShopDao {

	List<ProductBean> getProductByName(String productName);

	Integer saveOrder(SalesOrderBean sOB);

	List<Object[]> getCrust();

	List<CrustBean> getCrustTest();

	List<CrustBean> getCrustError();

	void insertOneSalesOrderDetail(SalesOrderDetailBean salesOrderDetail);

	void insertInfo(WebInfo webinfo);

	List<WebInfo> getInfo();

	List<SalesOrderBean> getMemberAllOrders(Integer memberId);

	ProductBean getProductById(Integer productId);

}
