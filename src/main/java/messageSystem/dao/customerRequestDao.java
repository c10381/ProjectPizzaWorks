package messageSystem.dao;

import java.util.List;

import _model.MembersBean;
import _model.customerRequestBean;

public interface customerRequestDao {
	
	//新增
	//for testing purposes
	public Boolean insertcustomerRequest(customerRequestBean crb);

	
	//查詢多筆by status
	public List<customerRequestBean> getAllcustomerRequestByReplyStatus(Integer ReplyStatus);
	
	//查詢所有QueryBean
	public List<customerRequestBean> getAllQuery();
	
	//查詢單筆
	public customerRequestBean getcustomerRequestByQueryId(Integer QueryId);
	
	//修改
	//need to add employee replycontent and update reply status
	public Boolean replycustomerRequest(customerRequestBean crb);


	List<MembersBean> getMemberNameAndEmailByNameAndPrivileId(String name, Integer[] privilegeId);

	
}
