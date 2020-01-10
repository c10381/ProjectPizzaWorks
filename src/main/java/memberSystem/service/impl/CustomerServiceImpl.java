package memberSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MembersBean;
import memberSystem.Mailutil.MailContext;
import memberSystem.Mailutil.SpringMailConfig;
import memberSystem.Mailutil.SpringMailUtil;
import memberSystem.dao.CustomerDao;
import memberSystem.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDao dao;
	public MailContext mailContext;
	
	@Autowired
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}
	
	
	@Autowired
	public void setMailContext(MailContext mailContext) {
		this.mailContext = mailContext;
	}

	//新增會員，新增成功會傳送註冊信
	@Transactional
	@Override
	public boolean addCustomer(MembersBean mem) {
		boolean addStatus=dao.addCustomer(mem);
		if(addStatus==true) {
			ApplicationContext context= new AnnotationConfigApplicationContext(SpringMailConfig.class);
			SpringMailUtil ms = (SpringMailUtil)context.getBean("mailSend",SpringMailUtil.class);
			ms.sendMail("eeit11017@outlook.com",mem.getEmail() , "會員註冊信",
					"<html><head><meta charset='utf-8'></head><body><h1>Hello! Spring!</h1></body></html>");
		}
		return false;
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
