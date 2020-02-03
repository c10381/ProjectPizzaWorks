package notificationSystem.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.SalesOrderBean;
import notificationSystem.dao.MsgDao;
import notificationSystem.service.MsgService;

@Service
public class MsgServiceImpl implements MsgService {
	
	MsgDao dao;
	
	@Autowired
	public void setDao(MsgDao dao) {
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
