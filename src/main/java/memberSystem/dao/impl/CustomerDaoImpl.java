package memberSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MembersBean;
import _model.ValidationRequestBean;
import memberSystem.dao.CustomerDao;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	private SessionFactory factory;

	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public boolean emailExists(String email) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		String queryString = "from MembersBean where email = :email";
		List<?> list = session.createQuery(queryString).setParameter("email", email).list();
		if (!list.isEmpty()) {
			exist = true;
		}
		return exist;
	}

	@Override
	public MembersBean loadCustomer(String email) {
		MembersBean member = null;
		Session session = factory.getCurrentSession();
//		Integer ipk = Integer.valueOf(pk);
		member = (MembersBean) session.load(MembersBean.class, email);
		return member;
	}

	@Override
	public MembersBean getCustomer(String email) {
		String hql = "from MembersBean where email = :email";
		MembersBean member = null;
		Session session = factory.getCurrentSession();
//		Integer ipk = Integer.valueOf(pk);
		member = (MembersBean) session.createQuery(hql).setParameter("email", email).getSingleResult();
		return member;
	}

	// 新增會員
	@Override
	public boolean addCustomer(MembersBean mem) {
		Session session = factory.getCurrentSession();
		session.save(mem);
		return true;
	}
	//更新會員
	@Override
	public boolean updateCustomer(MembersBean mem) {
		Session session = factory.getCurrentSession();
		session.update(mem);
		return true;
	}
	
	
	
	
	@Override
	public boolean updateInfo(MembersBean mem) {
		String hql = "from MembersBean where email = :email";
		Session session = factory.getCurrentSession();
		MembersBean member = (MembersBean) session.createQuery(hql).setParameter("email", mem.getEmail())
				.getSingleResult();
		//
		if (mem.getAddress() != null) {
			member.setAddress(mem.getAddress());
		}

		if (mem.getCellphone() != null) {
			member.setCellphone(mem.getCellphone());
		}

		session.update(member);
		return true;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<MembersBean> getAllCustomers() {
		List<MembersBean> allMembers = new ArrayList<MembersBean>();
		Session session = factory.getCurrentSession();
		allMembers = session.createQuery("FROM MembersBean where privilegeId =: privilegeId")
							.setParameter("privilegeId", 1)
							.list();
		return allMembers;
	}
	

//	@Override
//	public MembersBean login(String acct, String pwd) {
//		String hql = "from members where email = : email and password = : password";
//		Session session = factory.getCurrentSession();
//		MembersBean member = (MembersBean) session.createQuery(hql)
//				.setParameter("email", acct).setParameter("password", pwd)
//				.getSingleResult();	
//		return member;
//	}

	// ===========以下為驗證信部分============
	// 寫入ValidationRequestBean
	@Override
	public boolean addCustomerValidationRequest(ValidationRequestBean validationRequestBean) {
		Session session = factory.getCurrentSession();
		
		session.save(validationRequestBean);
		return true;
	}

	// 修改ValidationRequestBean
	@Override
	public boolean updateCustomerValidationRequest(ValidationRequestBean validationRequestBean) {
		Session session = factory.getCurrentSession();
		session.update(validationRequestBean);
		return true;
	}

	// 利用validationCode取得List<ValidationRequestBean>(可用來判斷有沒有資料)
	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> useValidationCodeGetBean(String validationCode) {
		String hql = "from ValidationRequestBean where validationCode = :validationCode";
		Session session = factory.getCurrentSession();
		List<ValidationRequestBean> lvrb = session.createQuery(hql).setParameter("validationCode", validationCode)
				.getResultList();
		return lvrb;
	}

	// 更新MemberBean的activeStatus欄位
	@Override
	public boolean updateCustomerStatus(MembersBean mem) {
		Session session = factory.getCurrentSession();
		session.update(mem);
		return true;
	}

	// 使用Email拿ValidationRequestBean
	@Override
	@SuppressWarnings("unchecked")
	public List<ValidationRequestBean> getValidationRequestBean(String email) {
		String hql = "from ValidationRequestBean where email = :email";
		Session session = factory.getCurrentSession();
		List<ValidationRequestBean> lvrb = session.createQuery(hql).setParameter("email", email)
				.getResultList();
		return lvrb;
	}

	// =============以上為驗證信部分================

	@Override
	public MembersBean login(String email, String pwd) {
		String hql = "from MembersBean where email = :email and password = :password";
		MembersBean member = null;
		Session session = factory.getCurrentSession();
		try {
			member = (MembersBean) session.createQuery(hql)
					.setParameter("email", email).setParameter("password", pwd)
					.getSingleResult();
		} catch (NoResultException nre) {
			member = null;
		}
		return member;
	}

	@Override
	public boolean updPwd(String email, String oldPwd, String newPwd) {
		boolean status = false;
		String hql = "from MembersBean where email = :email and password = :password";
		MembersBean member = null;
		Session session = factory.getCurrentSession();
		try {
			member = (MembersBean) session.createQuery(hql).setParameter("email", email).setParameter("password", oldPwd)
					.getSingleResult();
		} catch (NoResultException nre) {
			member = null;
		}
		
		if(member!=null) {
			member.setPassword(newPwd);
			session.update(member);
			status = true;
			return status;
		}else {
			return status;
		}		
	}

	@Override
	public boolean resetPwd(String email, String newPwd) {
		boolean status = false;
		String hql = "from MembersBean where email = :email ";
		MembersBean member = null;
		Session session = factory.getCurrentSession();
		try {
			member = (MembersBean) session.createQuery(hql).setParameter("email", email).getSingleResult();
		} catch (NoResultException nre) {
			member = null;
		}
		
		if(member!=null) {
			member.setPassword(newPwd);
			session.update(member);
			status = true;
			return status;
		}else {
			return status;
		}		
	}
}
