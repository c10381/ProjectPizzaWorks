package memberSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MembersBean;

public interface MemberLoginDao {

	void setFactory(SessionFactory factory);

	boolean idExists(String email);

	// 新增一筆Member物件到資料庫
	int saveMember(MembersBean mem);

	// 經由Session介面的load()查詢資料庫內的紀錄
	MembersBean loadMember(int pk);

	// 經由Session介面的get()查詢資料庫內的紀錄
	MembersBean getMember(int pk);

	// 更新紀錄(給使用者註冊資料用)
	boolean updateMember(MembersBean mem);
	
	public boolean saveCustomer (MembersBean mem);
	
	public boolean updateCustomer(MembersBean mem);
	
	// 查詢所有紀錄
	List<MembersBean> getAllMembers();

}