package statisticalAnalysisSystem.service;

import java.text.ParseException;
import java.util.HashMap;

import _model.SalesOrderBean;
import purchaseSystem.dao.PurchaseDao;
import shopManageSystem.dao.ProductDao;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;

public interface StatisticalAnalysisService {

	void addFakeSalesOrder(SalesOrderBean salesOrder);

	void setpDao(ProductDao pdao);
	void setDao(StatisticalAnalysisDao dao);
	void setprdao(PurchaseDao prdao);
	
	//取得[一定期間][單一產品]之[銷售額]
	Double getOneProductSales(Integer productId, String startingDate, String endDate) throws ParseException;
	//取得[一定期間][所有產品]之[銷售額]
	Double getAllProductSales(String startingDate, String endDate) throws ParseException;
	//取得[一定期間][單一產品]對[所有產品]之[銷售額比例]
	Double getOneProductSalesShare(Integer productId, String startingDate, String endDate) throws ParseException;
	//取得[一定期間][單一原料]之[進貨成本]
	Double getOneMaterialCost(Integer materialsId) throws ParseException;
	// 取得[一定期間][單一產品]之[毛利率]
	Double getOneProductGp(Integer productId, String startingDate, String endDate) throws ParseException;

	HashMap<String, String> LineChartDateTransfer(String date);

	HashMap<String, Double> GP4DicimalTo2(Double gp1, Double gp2, Double gp3, Double gp4, Double gp5);

	Double getUnitCost(Integer productId, String startingDate, String endDate) throws ParseException;

	Double invTurnover(String startingDate, String endDate) throws ParseException;
}
