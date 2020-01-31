package backendSystem.notificationService;

import java.util.List;

import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import backendSystem.notificationDao.msgDao;

public interface msgService {
	
	public void setDao(msgDao dao);

	public List<SalesOrderBean> getOrders();

//	public List<SalesOrderDetailBean> getOrder();
}
