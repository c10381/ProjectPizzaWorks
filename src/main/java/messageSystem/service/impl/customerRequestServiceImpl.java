package messageSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MembersBean;
import _model.customerRequestBean;
import messageSystem.dao.customerRequestDao;
import messageSystem.service.customerRequestService;

@Service
public class customerRequestServiceImpl implements customerRequestService {

	customerRequestDao dao;
	
	@Autowired
	public void setDao(customerRequestDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public Boolean insertcustomerRequest(customerRequestBean crb) {
		return dao.insertcustomerRequest(crb);

	}
	@Transactional
	@Override
	public List<customerRequestBean> getAllcustomerRequestByReplyStatus(Integer ReplyStatus) {
		
		return dao.getAllcustomerRequestByReplyStatus(ReplyStatus);
	}
	@Transactional
	@Override
	public List<customerRequestBean> getAllQuery() {
		
		return dao.getAllQuery();
	}
	@Transactional
	@Override
	public customerRequestBean getcustomerRequestByQueryId(Integer QueryId) {
		
		return dao.getcustomerRequestByQueryId(QueryId);
	}
	@Transactional
	@Override
	public Boolean replycustomerRequest(customerRequestBean crb) {
		return dao.replycustomerRequest(crb);

	}
	@Transactional
	@Override
	public List<MembersBean> getMemberNameAndEmailByNameAndPrivileId(String name, Integer[] privilegeId) {
		return dao.getMemberNameAndEmailByNameAndPrivileId(name, privilegeId);

	}

}
