package notificationSystem.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.SalesOrderBean;
import notificationSystem.dao.NotificationDao;
import notificationSystem.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {
	
	NotificationDao dao;
	
	@Autowired
	public void setDao(NotificationDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public List<SalesOrderBean> getOrders() {
		return dao.get_unchecked_Orders();
	}

//	@Override
//	public List<SalesOrderDetailBean> getOrder() {
//		
//		return null;
//	}

}
