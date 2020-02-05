package notificationSystem.service;

import java.util.List;

import _model.PurchaseRequestBean;
import _model.SalesOrderBean;
import _model.StockRequestBean;
import _model.ValidationRequestBean;
import notificationSystem.dao.NotificationDao;

public interface NotificationService {
	
	public void setDao(NotificationDao dao);

	public List<SalesOrderBean> getUncheckedOrders();
	
	public List<PurchaseRequestBean> getPurchaseRequests();
	
	public List<StockRequestBean> getStockRequests();
	
	public List<ValidationRequestBean> getPwdChangeRequests();

//	public List<SalesOrderDetailBean> getOrder();
}
