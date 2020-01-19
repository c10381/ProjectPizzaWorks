package memberSystem.service;

import _model.MembersBean;
import memberSystem.dao.CustomerDao;

public interface MemberService {

	void setDao(CustomerDao dao);


	int addMember(MembersBean mem);

//
//	boolean memFirstLoginChangePW(MembersBean mem, String Password);

}
