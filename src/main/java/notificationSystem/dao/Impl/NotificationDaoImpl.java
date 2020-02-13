package notificationSystem.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.PurchaseOrderBean;
import _model.PurchaseRequestBean;
import _model.SalesOrderBean;
import _model.StockRequestBean;
import _model.ValidationRequestBean;
import _model.customerRequestBean;
import notificationSystem.dao.NotificationDao;

@Repository
public class NotificationDaoImpl implements NotificationDao {
	
	private SessionFactory factory;
	
	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SalesOrderBean> getUncheckedOrders() {
		List<SalesOrderBean> uncheckedOrders = new ArrayList<SalesOrderBean>();
		Session session = factory.getCurrentSession();
		uncheckedOrders = session.createQuery("FROM SalesOrderBean where orderStatus =: orderStatus ORDER BY orderTime DESC")
								 .setParameter("orderStatus", 0)
								 .getResultList();
		return uncheckedOrders;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<PurchaseRequestBean> getPurchaseRequests() {
		List<PurchaseRequestBean> requests = new ArrayList<PurchaseRequestBean>();
		Session session = factory.getCurrentSession();
		requests = session.createQuery("FROM PurchaseRequestBean where requestStatus =: requestStatus ORDER BY requestTime DESC")
				   		  .setParameter("requestStatus", 0)
				   		  .getResultList();		
		return requests;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<StockRequestBean> getStockRequests() {
		List<StockRequestBean> requests = new ArrayList<StockRequestBean>();
		Session session = factory.getCurrentSession();
		requests = session.createQuery("FROM StockRequestBean where requestStatus =: requestStatus ORDER BY requestTime DESC")
				   		  .setParameter("requestStatus", 0)
				   		  .getResultList();		
		return requests;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> getPwdChangeRequests() {
		List<ValidationRequestBean> requests = new ArrayList<ValidationRequestBean>();
		Session session = factory.getCurrentSession();
		requests = session.createQuery("FROM ValidationRequestBean where requestStatus =: requestStatus ORDER BY requestTime DESC")
				   		  .setParameter("requestStatus", 3)
				   		  .getResultList();		
		return requests;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<customerRequestBean> getUnreadRequests() {
		List<customerRequestBean> requests = new ArrayList<customerRequestBean>();
		Session session = factory.getCurrentSession();
		requests = session.createQuery("FROM customerRequestBean where replyStatus =: replyStatus ORDER BY queryDate DESC")
		   		  .setParameter("replyStatus", 0)
		   		  .getResultList();	
		
		return requests;
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
