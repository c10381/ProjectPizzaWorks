package notificationSystem.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.PurchaseRequestBean;
import _model.SalesOrderBean;
import _model.StockRequestBean;
import _model.ValidationRequestBean;
import _model.customerRequestBean;
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
	public List<SalesOrderBean> getUncheckedOrders() {
		return dao.getUncheckedOrders();
	}
	
	@Transactional
	@Override
	public List<PurchaseRequestBean> getPurchaseRequests() {	
		return dao.getPurchaseRequests();
	}
	
	@Transactional
	@Override
	public List<StockRequestBean> getStockRequests() {
		return dao.getStockRequests();
	}
	
	@Transactional
	@Override
	public List<ValidationRequestBean> getPwdChangeRequests() {
		return dao.getPwdChangeRequests();
	}
	
	@Transactional
	@Override
	public List<customerRequestBean> getUnreadRequests() {		
		return dao.getUnreadRequests();
	}

//	@Override
//	public List<SalesOrderDetailBean> getOrder() {
//		
//		return null;
//	}

}
