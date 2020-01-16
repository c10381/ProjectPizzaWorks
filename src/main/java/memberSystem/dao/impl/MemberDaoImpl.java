package memberSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MembersBean;
import memberSystem.dao.MemberDao;

@Repository
public class MemberDaoImpl implements MemberDao {

	SessionFactory factory;

	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public boolean idExists(String email) {
		boolean exist = false;
		Session session = factory.getCurrentSession();		
//		System.out.println(session.getClass().getName());
		String queryString = "from members where email = :email";
		List<?> list = session.createQuery(queryString).setParameter("email", email).list();
		if (!list.isEmpty()) {
			exist = true;
		}
		return exist;
	}

	// =====後台註冊=====
	// 新增一筆Member物件到資料庫
	@Override
	public int addMember(MembersBean mem) {
		Session session = factory.getCurrentSession();
		int updateCount = 0;
		session.save(mem);
		updateCount = 1;
		return updateCount;
	}

	// 更新紀錄(給使用者註冊資料用)
	@Override
	public boolean updateMember(MembersBean mem) {
		String hql = "from members where email = :email";
		Session session = factory.getCurrentSession();
		MembersBean member = (MembersBean) session.createQuery(hql).setParameter("email", mem.getEmail())
				.getSingleResult();
		//
		if (!mem.getAddress().equals(null)) {
			member.setAddress(mem.getAddress());
		}

		if (!mem.getCellphone().equals(null)) {
			member.setCellphone(mem.getCellphone());
		}

		if (!mem.getFirstName().equals(null)) {
			member.setFirstName(mem.getFirstName());
		}

		if (!mem.getLastName().equals(null)) {
			member.setLastName(mem.getLastName());
		}

		session.update(member);
		return true;
	}

	// ====================
	// 經由Session介面的load()查詢資料庫內的紀錄
	@Override
	public MembersBean loadMember(String email) {
		MembersBean member = null;
		Session session = factory.getCurrentSession();
//		String ipk = Integer.valueOf(pk);
		member = (MembersBean) session.load(MembersBean.class, email);
		return member;
	}

	// 經由Session介面的get()查詢資料庫內的紀錄
	@Override
	public MembersBean getMember(String email) {
		MembersBean member = null;
		Session session = factory.getCurrentSession();
//		Integer ipk = Integer.valueOf(pk);
		member = (MembersBean) session.get(MembersBean.class, email);
		return member;
	}

	// 查詢所有紀錄
	@Override
	@SuppressWarnings("unchecked")
	public List<MembersBean> getAllMembers() {
		List<MembersBean> allMembers = new ArrayList<MembersBean>();
		Session session = factory.getCurrentSession();
		allMembers = session.createQuery("FROM members").list();
		return allMembers;
	}

}
