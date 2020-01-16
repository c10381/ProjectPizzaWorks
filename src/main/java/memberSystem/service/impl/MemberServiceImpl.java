package memberSystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MembersBean;
import memberSystem.dao.MemberDao;
import memberSystem.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	MemberDao dao;
	
	@Override
	@Autowired
	public void setDao(MemberDao dao) {
		this.dao = dao;
	}

	@Override
	public boolean idExists(String email) {		
		return dao.idExists(email);
	}
	
	@Transactional
	@Override
	public int saveMember(MembersBean mem) {
		
		return 0;
	}

}
