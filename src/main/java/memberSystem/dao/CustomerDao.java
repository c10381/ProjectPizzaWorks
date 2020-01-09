package memberSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MembersBean;

public interface CustomerDao {
	
	void setFactory(SessionFactory factory);
	
	boolean idExists(String email);
	
	// 經由Session介面的load()查詢資料庫內的紀錄
	MembersBean loadCustomer(String email);

	// 經由Session介面的get()查詢資料庫內的紀錄
	MembersBean getCustomer(String email);
	
	// 新增一筆Customer物件到資料庫
	public boolean addCustomer(MembersBean mem);
	
	// 更新紀錄(給使用者註冊資料用)
	public boolean updateCustomer(MembersBean mem);
	
	// 查詢所有紀錄
	List<MembersBean> getAllCustomers();
}
