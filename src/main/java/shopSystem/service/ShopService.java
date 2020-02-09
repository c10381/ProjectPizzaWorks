package shopSystem.service;

import java.util.List;

import _model.CrustBean;
import _model.ProductBean;
import _model.SalesOrderBean;
import _model.WebInfo;

public interface ShopService {

	List<ProductBean> getProductByName(String productName);

	String getProductByNameJson(String productName);

	void saveOrder(SalesOrderBean SOB);

	List<CrustBean> getCrust();

	List<CrustBean> getCrustTest();

	void insertWebInfo(WebInfo webinfo);

	WebInfo getWebInfo();

	String getMemberAllOrders(Integer memberId);
	
}
