package memberSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MembersBean;
import memberSystem.dao.CustomerDao;
import memberSystem.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDao dao;
		
	@Autowired
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}
	
	@Transactional
	@Override
	public boolean addCustomer(MembersBean mem) {		
		return dao.addCustomer(mem);
	}
	
	@Transactional
	@Override
	public MembersBean loadCustomer(String email) {
		return dao.loadCustomer(email);
	}
	
	@Transactional
	@Override
	public MembersBean getCustomer(String email) {
		return dao.getCustomer(email);
	}
	
	@Transactional
	@Override
	public boolean updateCustomer(MembersBean mem) {
		return dao.updateCustomer(mem);
	}
	
	@Transactional
	@Override
	public List<MembersBean> getAllCustomers() {
		return dao.getAllCustomers();
	}
	
}
