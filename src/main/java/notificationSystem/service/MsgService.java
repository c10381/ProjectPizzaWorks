package notificationSystem.service;

import java.util.List;

import _model.SalesOrderBean;
import notificationSystem.dao.MsgDao;

public interface MsgService {
	
	public void setDao(MsgDao dao);

	public List<SalesOrderBean> getOrders();

//	public List<SalesOrderDetailBean> getOrder();
}
