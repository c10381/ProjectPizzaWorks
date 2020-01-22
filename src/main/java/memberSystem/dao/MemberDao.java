package memberSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MembersBean;
import _model.ValidationRequestBean;

public interface MemberDao {

	void setFactory(SessionFactory factory);

//	boolean idExists(String email);

	// 新增一筆Member物件到資料庫
	int addMember(MembersBean mem);

	// 經由Session介面的load()查詢資料庫內的紀錄
	MembersBean loadMember(String email);

	// 經由Session介面的get()查詢資料庫內的紀錄
	MembersBean getMember(String email);

	// 更新紀錄(給使用者註冊資料用)
	boolean updateMember(MembersBean mem);	
	
	// 查詢所有紀錄
	public List<MembersBean> getAllMembers();

	List<ValidationRequestBean> getValidationRequestByrequestStatus(Integer[] requestStatus);
}