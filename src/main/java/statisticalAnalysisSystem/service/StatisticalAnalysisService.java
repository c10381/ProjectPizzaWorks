package statisticalAnalysisSystem.service;

import java.text.ParseException;

import _model.SalesOrderBean;
import shopManageSystem.dao.ProductDao;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;

public interface StatisticalAnalysisService {

	void addFakeSalesOrder(SalesOrderBean salesOrder);

	void setpDao(ProductDao pdao);

	void setDao(StatisticalAnalysisDao dao);
	//取得[一定期間][單一產品]之[銷售額]
	Double getOneProductSales(Integer productId) throws ParseException;
	//取得[一定期間][所有產品]之[銷售額]
	Double getAllProductSales() throws ParseException;
	//取得[一定期間][單一產品]對[所有產品]之[銷售額比例]
	Double getOneProductSalesShare(Integer productId) throws ParseException;
	
}
