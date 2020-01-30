package backendSystem.msgService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.SalesOrderBean;
import backendSystem.msgDao.msgDao;
import backendSystem.msgService.msgService;

@Service
public class msgServiceImpl implements msgService {
	
	msgDao dao;
	
	@Autowired
	public void setDao(msgDao dao) {
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
