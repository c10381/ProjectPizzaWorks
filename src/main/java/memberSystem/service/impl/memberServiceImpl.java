package memberSystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import memberSystem.dao.MemberLoginDao;

@Service
public class memberServiceImpl {
	MemberLoginDao dao;
	
	@Autowired
	public void setDao(MemberLoginDao dao) {
		this.dao = dao;
	}
	
	
	public boolean idExists(String email) {
		return dao.idExists(email);
	}
	
	
	
}
