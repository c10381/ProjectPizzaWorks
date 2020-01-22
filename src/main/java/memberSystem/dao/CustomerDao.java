package memberSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MembersBean;
import _model.ValidationRequestBean;

public interface CustomerDao {
	
	void setFactory(SessionFactory factory);
	
	boolean emailExists(String email);
	
	// 經由Session介面的load()查詢資料庫內的紀錄
	MembersBean loadCustomer(String email);

	// 經由Session介面的get()查詢資料庫內的紀錄
	MembersBean getCustomer(String email);
	
	// 新增一筆Customer物件到資料庫
	public boolean addCustomer(MembersBean mem);
	
	//	直接更新這個使用者的Bean
	boolean updateCustomer(MembersBean mem);
	
	// 更新紀錄(給使用者註冊資料用)
	public boolean updateInfo(MembersBean mem);
	
	// 查詢所有紀錄
	List<MembersBean> getAllCustomers();
	
	//登入
	public MembersBean login(String acct, String pwd);
	
	public boolean updPwd(String email, String oldPwd, String newPwd);	
	
	public boolean resetPwd(String email, String newPwd);
	
	//=====以下為驗證信部分======
	//寫入ValidationRequestBean
	boolean addCustomerValidationRequest(ValidationRequestBean validationRequestBean);
	// 修改ValidationRequestBean
	boolean updateCustomerValidationRequest(ValidationRequestBean validationRequestBean);
	//利用validationCode取得List<ValidationRequestBean>(可用來判斷有沒有資料)
	List<ValidationRequestBean> useValidationCodeGetBean(String validationCode);
	//使用Email拿單獨的的ValidationRequestBean(目前未用)
	public List<ValidationRequestBean> getValidationRequestBean(String email);
	// 更新MemberBean的activeStatus欄位
	boolean updateCustomerStatus(MembersBean mem);
	//=====以上為驗證信部分======
		
}
