package memberSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

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
		System.out.println(session.getClass().getName());
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

	@Override
	public boolean updateCustomer(MembersBean mem) {
		String hql = "from MembersBean where email = :email";
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

	@Override
	@SuppressWarnings("unchecked")
	public List<MembersBean> getAllCustomers() {
		List<MembersBean> allMembers = new ArrayList<MembersBean>();
		Session session = factory.getCurrentSession();
		allMembers = session.createQuery("FROM members").list();
		return allMembers;
	}
	
	//===========以下為驗證信部分============
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
	
	// 使用Email拿單獨的的ValidationRequestBean(目前未用)
	@Override
	public ValidationRequestBean getCustomerValidationRequest(String email) {
		ValidationRequestBean vrb = null;
		Session session = factory.getCurrentSession();
		vrb = session.get(ValidationRequestBean.class, email);
		return vrb;
	}
	
	//=============以上為驗證信部分================
}
