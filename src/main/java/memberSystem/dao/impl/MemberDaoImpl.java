package memberSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MembersBean;
import _model.ValidationRequestBean;
import memberSystem.dao.MemberDao;

@Repository
public class MemberDaoImpl implements MemberDao {

	SessionFactory factory;

	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	// ===後台會員CRUD===
	// (Create)新增會員、(Read)拿會員資料、(Update)更新會員資料 與CustomerDao共用
	
//	@Override
//	public int addMember(MembersBean mem) {
//		Session session = factory.getCurrentSession();
//		int updateCount = 0;
//		session.save(mem);
//		updateCount = 1;
//		return updateCount;
//	}

	// 更新紀錄(給使用者註冊資料用)
//	@Override
//	public boolean updateMember(MembersBean mem) {
//		String hql = "from members where email = :email";
//		Session session = factory.getCurrentSession();
//		MembersBean member = (MembersBean) session.createQuery(hql).setParameter("email", mem.getEmail())
//				.getSingleResult();
//		//
//		if (!mem.getAddress().equals(null)) {
//			member.setAddress(mem.getAddress());
//		}
//
//		if (!mem.getCellphone().equals(null)) {
//			member.setCellphone(mem.getCellphone());
//		}
//
//		if (!mem.getFirstName().equals(null)) {
//			member.setFirstName(mem.getFirstName());
//		}
//
//		if (!mem.getLastName().equals(null)) {
//			member.setLastName(mem.getLastName());
//		}
//
//		session.update(member);
//		return true;
//	}

	// ====================
	// 經由Session介面的load()查詢資料庫內的紀錄
//	@Override
//	public MembersBean loadMember(String email) {
//		MembersBean member = null;
//		Session session = factory.getCurrentSession();
//		member = (MembersBean) session.load(MembersBean.class, email);
//		return member;
//	}

	// 經由ID的get()查詢資料庫內的紀錄
	@Override
	public MembersBean getMember(Integer id) {
		MembersBean member = null;
		Session session = factory.getCurrentSession();
		member = (MembersBean) session.get(MembersBean.class, id);
		return member;
	}

	// ==ValidationRequest(後台忘記密碼)部分==

	// (Read)使用requestStatus拿ValidationRequestBean
	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> getValidationRequestByrequestStatus(Integer[] requestStatus) {
		String hql = "from ValidationRequestBean where requestStatus in (:requestStatus)";
		Session session = factory.getCurrentSession();
		List<ValidationRequestBean> lvrb = session.createQuery(hql).setParameterList("requestStatus", requestStatus)
				.getResultList();
		return lvrb;
	}

	// (Read)使用email拿ValidationRequestBean
	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> getValidationRequestByemail(String email) {
		String hql = "from ValidationRequestBean where email = :email";
		Session session = factory.getCurrentSession();
		List<ValidationRequestBean> lvrb = session.createQuery(hql).setParameter("email", email).getResultList();
		return lvrb;
	}
	// (Read)使用if拿ValidationRequestBean
	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> getValidationRequestById(Integer vRequestId) {
		String hql = "from ValidationRequestBean where vRequestId = :vRequestId";
		Session session = factory.getCurrentSession();
		List<ValidationRequestBean> lvrb = session.createQuery(hql).setParameter("vRequestId", vRequestId).getResultList();
		return lvrb;
	}

	// (Update)更改ValidationRequestBean
	@Override
	public Boolean updateValidationRequest(ValidationRequestBean vrb) {
		Session session = factory.getCurrentSession();
		try {
			session.update(vrb);
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	// ==/ValidationRequest部分==

	// (Read)查詢後台所有員工
	@Override
	@SuppressWarnings("unchecked")
	public List<MembersBean> getAllMembers(Integer[] privilegeId) {
		List<MembersBean> allMembers = new ArrayList<MembersBean>();
		Session session = factory.getCurrentSession();
		allMembers = session.createQuery("FROM MembersBean where privilegeId  in (:privilegeId)").setParameterList("privilegeId", privilegeId).getResultList();
		return allMembers;
	}

}
