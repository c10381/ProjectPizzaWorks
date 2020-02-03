package notificationSystem.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.SalesOrderBean;
import notificationSystem.dao.MsgDao;

@Repository
public class MsgDaoImpl implements MsgDao {
	
	private SessionFactory factory;
	
	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SalesOrderBean> get_unchecked_Orders() {
		List<SalesOrderBean> uncheckedOrders = new ArrayList<SalesOrderBean>();
		Session session = factory.getCurrentSession();
		uncheckedOrders = session.createQuery("FROM SalesOrderBean where orderStatus =: orderStatus ORDER BY orderTime DESC")
								 .setParameter("orderStatus", 0)
								 .getResultList();
		return uncheckedOrders;
	}

//	@Override
//	@SuppressWarnings("unchecked")
//	public List<SalesOrderDetailBean> getOrder() {
//		List<SalesOrderDetailBean> orderDetail = new ArrayList<SalesOrderDetailBean>();
//		Session session = factory.getCurrentSession();
//		orderDetail = session.createQuery("FROM SalesOrderDetailBean where privilegeId =: privilegeId")
//							 .setParameter("privilegeId", 1)
//							 .list();		
//		return orderDetail;
//	}
}
