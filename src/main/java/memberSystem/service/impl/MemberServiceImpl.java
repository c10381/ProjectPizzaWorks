package memberSystem.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import _global.config.util.Encrypted;
import _model.MembersBean;
import _model.ValidationRequestBean;
import memberSystem.dao.CustomerDao;
import memberSystem.dao.MemberDao;
import memberSystem.service.MemberService;

//這裡是後台的會員系統
//主要職掌：由Admin註冊帳號
@Service
public class MemberServiceImpl implements MemberService {

	private CustomerDao Custdao;
	private MemberDao Memdao;
	
	private Encrypted encrypter;

	@Override
	@Autowired
	public void setCustomerDao(CustomerDao Custdao) {
		this.Custdao = Custdao;
	}
	@Override
	@Autowired
	public void setMemberDao(MemberDao Memdao) {
		this.Memdao = Memdao;
	}

	// 單筆會員註冊
	// return 0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功
	@Transactional
	@Override
	public int addMember(MembersBean mem) {

		boolean Exists = Custdao.emailExists(mem.getEmail());
		if (Exists == true) {
			return 1;
		}
		mem.setPassword(encrypter.getMD5Endocing(mem.getPassword()));
		mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
		mem.setRegisteredTime(String.valueOf(new Timestamp(new Date().getTime())));
		try {
			boolean addStatus = Custdao.addCustomer(mem);
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
			boolean Exists = Custdao.emailExists(mem.getEmail());
			if (Exists == true) {
				failure++;
				failureEmail += mem.getEmail() + " ";
				continue;
			}
			mem.setPassword(encrypter.getMD5Endocing("P@ssw0rd"));
			mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
			mem.setRegisteredTime(String.valueOf(new Timestamp(new Date().getTime())));
			mem.setActiveStatus(1);
			if (Custdao.addCustomer(mem)) {
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
		if(Custdao.emailExists(email)) {
			MembersBean mem=Custdao.getCustomer(email);
			ValidationRequestBean vrm=new ValidationRequestBean();
			//把ActiveStatus 3->2(已啟用改成變更密碼狀態)
			mem.setActiveStatus(2);
			//變更使用者變更欄位時間
			mem.setModifiedTime(String.valueOf(new Timestamp(new Date().getTime())));
			Custdao.updateCustomerStatus(mem);
			
			//紀錄ValidationRequest表單
			vrm.setEmail(mem.getEmail());
			vrm.setRequestTime(String.valueOf(new Timestamp(new Date().getTime())));
			vrm.setRequestStatus(3);//1-未驗證,2-已驗證,3-申請修改密碼,4-核准修改密碼,5-拒絕修改密碼
			Custdao.addCustomerValidationRequest(vrm);
			return true;
		}else {
			return false;
		}
	}
	//這個是要給更新密碼用的
	@Transactional
	@Override
	public MembersBean coworkerUpdPwd(String email,String newPW) {
		MembersBean mem=Custdao.getCustomer(email);
		if(encrypter.getMD5Endocing(newPW).equals(mem.getPassword())) {
			return null;
		}
		mem.setPassword(encrypter.getMD5Endocing(newPW));
		mem.setActiveStatus(3);
		Custdao.updateCustomer(mem);
		
		List<ValidationRequestBean>  lvrm=Custdao.getValidationRequestBean(email);
		if(!lvrm.isEmpty()) {
			//拿最後一顆，未來可能要改寫
			ValidationRequestBean vrm=lvrm.get(lvrm.size()-1);
			vrm.setRequestStatus(4);
			Custdao.updateCustomerValidationRequest(vrm);
		}
		return mem;
	}
	
	//利用requestStatus拿到ValidationRequestBeans
	@Transactional
	@Override
	public List<ValidationRequestBean> SearchValidationRequestBeans(Integer... requestStatus) {
		List<ValidationRequestBean>  lvrm=Memdao.getValidationRequestByrequestStatus(requestStatus);
		
		return lvrm;
	}
	//允許會員變更密碼(更改ValidationRequestBeans與MembersBean)
	@Transactional
	@Override
	public Boolean changePWrequestCommit(Boolean Answer,Integer vRequestId,MembersBean admin,String responseComment) {
		List<ValidationRequestBean> lvrb=Memdao.getValidationRequestById(vRequestId);
		if(lvrb.isEmpty()) {
			return false;
		}else {
			//更改ValidationRequestBean狀態
			ValidationRequestBean vrb=lvrb.get(0);
			if(Answer) {
				vrb.setRequestStatus(4);
			}else {
				vrb.setRequestStatus(5);
			}
			vrb.setApprover(admin);
			vrb.setResponseComment(responseComment);
			vrb.setResponseTime(String.valueOf(new Timestamp(new Date().getTime())));
			Memdao.updateValidationRequest(vrb);
			
			//更改MembersBean狀態，並更改ActiveStatus為3
			MembersBean mem=Custdao.getCustomer(vrb.getEmail());
			if(mem.getActiveStatus()==1||mem.getActiveStatus()==3) {
				return false;
			}
			if(Answer) {
				mem.setActiveStatus(1);
			}else {
				mem.setActiveStatus(3);
			}
			Custdao.updateCustomerStatus(mem);
			
			return true;
		}
	}
	
	//拿到全部的後台會員資料
	@Transactional
	@Override
	public String getAllMembers() {
		Gson gson=new Gson();
		return gson.toJson(Memdao.getAllMembers());
	}
	
	
}
