package notificationSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.PurchaseRequestBean;
import _model.SalesOrderBean;
import _model.StockRequestBean;
import _model.ValidationRequestBean;
//import _model.SalesOrderDetailBean;

public interface NotificationDao {
	
	public void setFactory(SessionFactory factory);
	
	public List<SalesOrderBean> getUncheckedOrders();
	
	public List<PurchaseRequestBean> getPurchaseRequests();
	
	public List<StockRequestBean> getStockRequests();
	
	public List<ValidationRequestBean> getPwdChangeRequests();
	
//	public List<SalesOrderDetailBean> getOrder(); 
	
}
