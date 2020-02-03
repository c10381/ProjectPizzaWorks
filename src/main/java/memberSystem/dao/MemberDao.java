package memberSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MembersBean;
import _model.ValidationRequestBean;

public interface MemberDao {

	void setFactory(SessionFactory factory);


	// 新增一筆Member物件到資料庫
//	int addMember(MembersBean mem);

	// 經由Session介面的load()查詢資料庫內的紀錄
//	MembersBean loadMember(String email);


	MembersBean getMember(Integer id);

	// 更新紀錄(給使用者註冊資料用)
//	boolean updateMember(MembersBean mem);	
	
	// 查詢所有紀錄
	public List<MembersBean> getAllMembers();

	//拿ValidationRequestBean的三種方式
	List<ValidationRequestBean> getValidationRequestByrequestStatus(Integer[] requestStatus);
	List<ValidationRequestBean> getValidationRequestByemail(String email);
	List<ValidationRequestBean> getValidationRequestById(Integer vRequestId);
	
	Boolean updateValidationRequest(ValidationRequestBean vrb);



}