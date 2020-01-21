package memberSystem.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _global.config.util.Encrypted;
import _model.MembersBean;
import _model.ValidationRequestBean;
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

	// 單筆會員註冊
	// return 0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功
	@Transactional
	@Override
	public int addMember(MembersBean mem) {

		boolean Exists = dao.emailExists(mem.getEmail());
		if (Exists == true) {
			return 1;
		}
		mem.setPassword(encrypter.getMD5Endocing(mem.getPassword()));
		mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
		mem.setRegisteredTime(String.valueOf(new Timestamp(new Date().getTime())));
		try {
			boolean addStatus = dao.addCustomer(mem);
		} catch (Exception e) {
			return 0;
		}
		return 2;
	}

	// 多筆會員註冊
	@Transactional
	@Override
	public Map<String, String> addMutipleMember(List<MembersBean> MemberList) {
		int success = 0;
		int failure = 0;
		String failureEmail = "";

		for (MembersBean mem : MemberList) {
			boolean Exists = dao.emailExists(mem.getEmail());
			if (Exists == true) {
				failure++;
				failureEmail += mem.getEmail() + " ";
				continue;
			}
			mem.setPassword(encrypter.getMD5Endocing("P@ssw0rd"));
			mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
			mem.setRegisteredTime(String.valueOf(new Timestamp(new Date().getTime())));
			mem.setActiveStatus(1);
			if (dao.addCustomer(mem)) {
				success++;
			}
			;
		}
		Map<String, String> map = new HashMap<>();
		map.put("success", String.valueOf(success));
		map.put("failure", String.valueOf(failure));
		map.put("failureEmail", failureEmail);
		return map;
	}
	
	//使用者忘記密碼要求
	@Transactional
	@Override
	public boolean memberFPWrequest(String email) {
		if(dao.emailExists(email)) {
			MembersBean mem=dao.getCustomer(email);
			ValidationRequestBean vrm=new ValidationRequestBean();
			//把ActiveStatus 3->2(已啟用改成變更密碼狀態)
			mem.setActiveStatus(2);
			//變更使用者變更欄位時間
			mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
			dao.updateCustomerStatus(mem);
			
			//紀錄ValidationRequest表單
			vrm.setEmail(mem.getEmail());
			vrm.setRequestTime(String.valueOf(new Timestamp(new Date().getTime())));
			vrm.setRequestStatus(3);//1-未驗證,2-已驗證,3-申請修改密碼,4-已修改密碼
			dao.addCustomerValidationRequest(vrm);
			return true;
		}else {
			return false;
		}
	}
	//這個是要給更新密碼用的
	@Transactional
	@Override
	public MembersBean coworkerUpdPwd(String email,String newPW) {
		MembersBean mem=dao.getCustomer(email);
		if(encrypter.getMD5Endocing(newPW).equals(mem.getPassword())) {
			return null;
		}
		mem.setPassword(encrypter.getMD5Endocing(newPW));
		mem.setActiveStatus(3);
		dao.updateCustomer(mem);
		return mem;
	}
}
