package backendSystem.msgDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MembersBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import backendSystem.msgDao.msgDao;

@Repository
public class msgDaoImpl implements msgDao {
	
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
		uncheckedOrders = session.createQuery("FROM SalesOrderBean where orderStatus =: orderStatus")
								 .setParameter("orderStatus", 0)
								 .getResultList();
		System.out.println(uncheckedOrders.isEmpty());
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
