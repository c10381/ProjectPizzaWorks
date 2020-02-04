package notificationSystem.service;

import java.util.List;

import _model.SalesOrderBean;
import notificationSystem.dao.NotificationDao;

public interface NotificationService {
	
	public void setDao(NotificationDao dao);

	public List<SalesOrderBean> getOrders();

//	public List<SalesOrderDetailBean> getOrder();
}
