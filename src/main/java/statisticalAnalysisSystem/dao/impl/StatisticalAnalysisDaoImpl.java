package statisticalAnalysisSystem.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;

@Repository
public class StatisticalAnalysisDaoImpl implements StatisticalAnalysisDao {
	
	SessionFactory factory;

	@Override
	@Autowired
	public void setDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	@Override
	public Integer insertSalesOrder(SalesOrderBean salesOrder) {
		Session session = factory.getCurrentSession();
		Integer saleOrderId = (Integer) session.save(salesOrder);
		return saleOrderId;
	}
	
	@Override
	public void insertSalesOrderDetail(SalesOrderDetailBean salesOrderDetail) {
		Session session = factory.getCurrentSession();
		Integer saleOrderDetailId = (Integer) session.save(salesOrderDetail);
	}
}
