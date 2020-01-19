package memberSystem.service.impl;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _global.config.util.Encrypted;
import _model.MembersBean;
import memberSystem.dao.CustomerDao;
import memberSystem.service.MemberService;

//這裡是後台的會員系統
//主要職掌：由Admin註冊帳號
@Service
public class MemberServiceImpl implements MemberService {
	
	private CustomerDao dao;
	private Encrypted encrypter;
	@Override
	@Autowired
	public void setDao(CustomerDao dao) {
		this.dao = dao;
	}

	//單筆會員註冊
	//return 0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功
	@Transactional
	@Override
	public int addMember(MembersBean mem) {
		
		boolean Exists=dao.emailExists(mem.getEmail());
		if(Exists==true) {
			return 1;
		}
		mem.setPassword(encrypter.getMD5Endocing(mem.getPassword()));		
		mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
		mem.setRegisteredTime(String.valueOf(new Timestamp(new Date().getTime())));		
		try {
			boolean addStatus=dao.addCustomer(mem);
		}
		catch(Exception e){
			return 0;
		}		
		return 2;
	}

}
