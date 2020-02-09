package messageSystem.service;

import java.util.List;

import _model.customerRequestBean;

public interface customerRequestService {

		//新增
		public Boolean insertcustomerRequest(customerRequestBean crb);
		
		//public void insertcustomerRequest(customerRequestBean crb);
		
		//public EmployeeBean getEmployeeBeanByID(Integer EmpID);
		
		//查詢多筆by status
		public List<customerRequestBean> getAllcustomerRequestByReplyStatus(Integer ReplyStatus);
		
		//查詢所有QueryBean
		public List<customerRequestBean> getAllQuery();
		
		//查詢單筆
		public customerRequestBean getcustomerRequestByQueryId(Integer QueryId);
		
		//修改
		//need to add employee replycontent and update reply status
		public Boolean replycustomerRequest(customerRequestBean crb);
}
