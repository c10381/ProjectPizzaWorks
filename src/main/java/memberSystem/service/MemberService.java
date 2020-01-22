package memberSystem.service;

import java.util.List;
import java.util.Map;

import _model.MembersBean;
import _model.ValidationRequestBean;
import memberSystem.dao.CustomerDao;
import memberSystem.dao.MemberDao;

public interface MemberService {

	void setCustomerDao(CustomerDao Custdao);

	void setMemberDao(MemberDao Memdao);

	int addMember(MembersBean mem);


	Map<String, String> addMutipleMember(List<MembersBean> MemberList);


	boolean memberFPWrequest(String email);


	MembersBean coworkerUpdPwd(String email, String newPW);


	List<ValidationRequestBean> SearchValidationRequestBeans(Integer... requestStatus);



//
//	boolean memFirstLoginChangePW(MembersBean mem, String Password);

}
