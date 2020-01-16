package memberSystem.service;

import _model.MembersBean;
import memberSystem.dao.MemberDao;

public interface MemberService {

	void setDao(MemberDao dao);

	boolean idExists(String email);

	int saveMember(MembersBean mem);

//	boolean memberLogin(String Email, String Password);
//
//	boolean memFirstLoginChangePW(MembersBean mem, String Password);

}
