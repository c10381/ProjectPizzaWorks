package statisticalAnalysisSystem.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;

public interface StatisticalAnalysisDao {

	void setDao(SessionFactory factory);

	Integer insertSalesOrder(SalesOrderBean salesOrder);

	void insertSalesOrderDetail(SalesOrderDetailBean salesOrderDetail);

}