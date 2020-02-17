package paymentSystem.dao;

import org.hibernate.SessionFactory;

import _model.SalesOrderBean;

public interface PaymentDao {
	
	void setFactory(SessionFactory factory);
	
	SalesOrderBean getLatestOrderByCustomerId(Integer customerId);
	
	void updateOrderStatus(Integer orderId);
}
