package memberSystem.service;

import java.util.List;
import java.util.Map;

import _model.MembersBean;
import memberSystem.dao.CustomerDao;

public interface MemberService {

	void setDao(CustomerDao dao);


	int addMember(MembersBean mem);


	Map<String, String> addMutipleMember(List<MembersBean> MemberList);

//
//	boolean memFirstLoginChangePW(MembersBean mem, String Password);

}
