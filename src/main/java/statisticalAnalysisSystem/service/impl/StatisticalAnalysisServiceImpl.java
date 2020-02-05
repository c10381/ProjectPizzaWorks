package statisticalAnalysisSystem.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopManageSystem.dao.ProductDao;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;
import statisticalAnalysisSystem.service.StatisticalAnalysisService;

@Service
@Transactional
public class StatisticalAnalysisServiceImpl implements StatisticalAnalysisService{
	
	ProductDao pdao;
	@Override
	@Autowired
	public void setpDao(ProductDao pdao) {
		this.pdao = pdao;
	}
	
	StatisticalAnalysisDao dao;
	
	@Override
	@Autowired
	public void setDao(StatisticalAnalysisDao dao) {
		this.dao = dao;
	}
	
	//取得[一定期間][單一產品]之[銷售額]
	@Override
	public Double getOneProductSales(Integer productId) throws ParseException {
		List<SalesOrderBean> list = pdao.getAllSalesOrders();
		Double oneProductSales = 0.0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(SalesOrderBean sob : list) {
			System.out.println(sob.getOrderTime());
			if(sdf.parse(sob.getOrderTime()).after(sdf.parse("2020-02-01 00:00:00")) && 
					sdf.parse(sob.getOrderTime()).before(sdf.parse("2020-02-05 00:00:00"))) {
				
				List<SalesOrderDetailBean> list2 = sob.getSalesOrderDetails();
				for(SalesOrderDetailBean sodb : list2) {
					if(sodb.getProductId()==productId) {
						oneProductSales = oneProductSales + sodb.getUnitPrice()*sodb.getQuantity();
						System.out.println(sodb.getSalesOrderId());
						System.out.println(oneProductSales);
					}
				}
			}
		}
		return oneProductSales;
	}
	
	//取得[一定期間][所有產品]之[銷售額]
	@Override
	public Double getAllProductSales() throws ParseException {
		List<SalesOrderBean> list = pdao.getAllSalesOrders();
		Double allProductSales = 0.0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for(SalesOrderBean sob : list) {
			if(sdf.parse(sob.getOrderTime()).after(sdf.parse("2020-02-01 00:00:00")) &&
					sdf.parse(sob.getOrderTime()).before(sdf.parse("2020-02-05 00:00:00"))) {
				Integer oneProductSales = sob.getTotalSales();
				allProductSales = allProductSales + oneProductSales; 
			}
		}
		return allProductSales;
	}
	
	//取得[一定期間][單一產品]對[所有產品]之[銷售額比例]
	@Override
	public Double getOneProductSalesShare(Integer productId) throws ParseException {
		Double OneProductSalesShare = getOneProductSales(productId)/getAllProductSales();
		return OneProductSalesShare;
	}
	
	@Override
	public void addFakeSalesOrder(SalesOrderBean salesOrder) {
		List<SalesOrderDetailBean> salesOrderDetails = salesOrder.getSalesOrderDetails();
		Integer salesOrderId = dao.insertSalesOrder(salesOrder);
		for(SalesOrderDetailBean salesOrderDetail : salesOrderDetails) {
			salesOrderDetail.setSalesOrderId(salesOrderId);
			dao.insertSalesOrderDetail(salesOrderDetail);
		}
	}
}
