package paymentSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.SalesOrderBean;
import paymentSystem.dao.PaymentDao;

@Repository
public class PaymentDaoImpl implements PaymentDao {

private SessionFactory factory;
	
	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public SalesOrderBean getLatestOrderByCustomerId(Integer customerId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM SalesOrderBean where memberId =: memberId ORDER BY salesOrderId DESC";
		List<SalesOrderBean> orders = new ArrayList<SalesOrderBean>();
		orders = session.createQuery(hql).setParameter("memberId", customerId).getResultList();
		SalesOrderBean order = orders.get(0); 
		System.out.println("oooooooooooooooorder num = "+ order.getSalesOrderId());
		return order;
	}

	@Override
	public void updateOrderStatus(Integer orderId) {
		Session session = factory.getCurrentSession();
		SalesOrderBean sob = session.get(SalesOrderBean.class, orderId);
		sob.setOrderStatus(2);		
	}

}
