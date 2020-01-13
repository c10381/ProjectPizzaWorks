package memberSystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import _model.MembersBean;
import memberSystem.dao.CustomerDao;

public interface CustomerService {
	
	void setDao(CustomerDao dao);
	
	// 經由Session介面的load()查詢資料庫內的紀錄
	MembersBean loadCustomer(String email);

	// 經由Session介面的get()查詢資料庫內的紀錄
	MembersBean getCustomer(String email);
	
	// 新增一筆Customer物件到資料庫
	public boolean addCustomer(HttpServletRequest request, MembersBean mem);
	
	// 更新紀錄(給使用者註冊資料用)
	public boolean updateCustomer(MembersBean mem);
	
	// 查詢所有紀錄
	List<MembersBean> getAllCustomers();
	//Customer點擊信件確認驗證信、忘記密碼連結
	//要撈出MemberBean
	MembersBean confirmvalidationCode(String VCode);
	
	//user要求忘記密碼(更改密碼、寄出驗證信)
	boolean userRequestChangePW(HttpServletRequest request, String email);
	//Customer點擊信件忘記密碼連結
	//要撈出MemberBean
	//導向修改密碼介面
	
}
