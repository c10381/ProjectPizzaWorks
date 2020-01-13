package memberSystem.service.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MembersBean;
import _model.ValidationRequestBean;
import memberSystem.Mailutil.MailCtxAndUtil;
import memberSystem.Mailutil.SpringMailConfig;
import memberSystem.Mailutil.SpringMailUtil;
import memberSystem.dao.CustomerDao;
import memberSystem.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDao dao;
	public MailCtxAndUtil mailContext;
	
	@Autowired
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}

	//新增會員，新增成功會傳送註冊信
	@Transactional
	@Override
	public boolean addCustomer(HttpServletRequest request,MembersBean mem) {
		boolean addStatus=dao.addCustomer(mem);
		if(addStatus==true) {
			MailCtxAndUtil mailCtxAndUtil=new MailCtxAndUtil();
			//寫入ValidationRequestBean
			ValidationRequestBean requestBean = new ValidationRequestBean();
			requestBean.setEmail(mem.getEmail());
			requestBean.setRequestTime(new Timestamp(System.currentTimeMillis()));
			//RequestStatus:1-未驗證,2-已驗證,3-申請修改密碼,4-已修改密碼
			requestBean.setRequestStatus(1);
			
			//確認validationCode是否獨一無二
			String validationCode = "";
			List<?> checkVC=null;
			do {
				validationCode = mailCtxAndUtil.RandomvalidationCode();
				checkVC=dao.useValidationCodeGetBean(validationCode);
			} while (checkVC.isEmpty());
			
			requestBean.setValidationCode(validationCode);
			dao.addCustomerValidationRequest(requestBean);
			
			//操作Spring Mail區
			ApplicationContext context= new AnnotationConfigApplicationContext(SpringMailConfig.class);
			SpringMailUtil ms = (SpringMailUtil)context.getBean("mailSend",SpringMailUtil.class);
			ms.sendMail(mailCtxAndUtil.UserName,mem.getEmail() , "會員註冊信",
					mailCtxAndUtil.ConfirmationMailContext(request,mem,validationCode));
			return true;
		}
		return false;
	}
	//確認驗證信
	@Transactional
	@Override
	public boolean confirmvalidationCode(String VCode) {
		List<ValidationRequestBean> Lveb=dao.useValidationCodeGetBean(VCode);
		if(Lveb.size()==1) {
			ValidationRequestBean veb = Lveb.get(0);
			//RequestStatus:1-未驗證,2-已驗證,3-申請修改密碼,4-已修改密碼
			veb.setRequestStatus(2);
			dao.updateCustomerValidationRequest(veb);
			
			//更改會員狀態為已啟用(activeStatus：1-未啟用,2-改密碼,3-已啟用)
			MembersBean mem=dao.getCustomer(veb.getEmail());
			mem.setActiveStatus(2);
			//只有單純update(可以這樣用吧？)
			dao.updateCustomerStatus(mem);
			return true;
		};
		return false;
	}
	//User要求申請忘記密碼(拿的到email)
	//1. 更改MembersBean activeStatus:2
	//2. 新增ValidationRequestBean,RequestStatus：3,確認validationCode是否獨一無二
	//3. 寄送信件 mailCtxAndUtil.CustomerForgetPW()
	//4. return true:成功寄出信件,false:無此帳號
	//和新增會員很像，可以考慮重構
	@Transactional
	@Override
	public boolean userRequestChangePW(HttpServletRequest request,String email) {
		MailCtxAndUtil mailCtxAndUtil=new MailCtxAndUtil();
		MembersBean mem=dao.getCustomer(email);
		mem.setActiveStatus(2);
		//更改ActiveStatus有成功的話，才創建ValidationRequestBean
		if(dao.updateCustomerStatus(mem)) {
			ValidationRequestBean requestBean = new ValidationRequestBean();
			requestBean.setEmail(mem.getEmail());
			requestBean.setRequestTime(new Timestamp(System.currentTimeMillis()));
			//RequestStatus:1-未驗證,2-已驗證,3-申請修改密碼,4-已修改密碼
			requestBean.setRequestStatus(3);
			
			//確認validationCode是否獨一無二
			String validationCode = "";
			List<?> checkVC=null;
			do {
				validationCode = mailCtxAndUtil.RandomvalidationCode();
				checkVC=dao.useValidationCodeGetBean(validationCode);
			} while (!checkVC.isEmpty());
			requestBean.setValidationCode(validationCode);
			dao.addCustomerValidationRequest(requestBean);
			
			//操作Spring Mail區
			ApplicationContext context= new AnnotationConfigApplicationContext(SpringMailConfig.class);
			SpringMailUtil ms = (SpringMailUtil)context.getBean("mailSend",SpringMailUtil.class);
			//寄出信件
			ms.sendMail(mailCtxAndUtil.UserName,mem.getEmail() , "會員密碼確認信",
					mailCtxAndUtil.CustomerForgetPW(request,mem,validationCode));
			return true;
		};
		
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
	
	@Transactional
	@Override
	public boolean emailExists(String email) {
		return dao.emailExists(email);
	}

}
