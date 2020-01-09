package memberSystem.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _model.MembersBean;
import memberSystem.dao.MemberLoginDao;

@Service
public class memberServiceImpl {
	MemberLoginDao dao;
	
	@Autowired
	public void setDao(MemberLoginDao dao) {
		this.dao = dao;
	}
	@Transactional
	//帳號是否存在
	public boolean idExists(String email) {
		return dao.idExists(email);
	}
	@Transactional
	//註冊帳號
	public int saveMember(MembersBean mem) {
		
		return 0;
	}
	
	
	@Transactional
	//帳號登入
	public boolean memberLogin(String Email,String Password) {
		boolean LoginState=false;
		
		return LoginState;
	}
	
	@Transactional
	//更改密碼(首次登入)
	public boolean memFirstLoginChangePW(MembersBean mem,String Password) {
		boolean ChangePW=false;
		
		
		return ChangePW;
	}
}
