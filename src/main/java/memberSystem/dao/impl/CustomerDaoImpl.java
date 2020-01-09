package memberSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MembersBean;
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
	public boolean idExists(String email) {
		boolean exist = false;
		Session session = factory.getCurrentSession();
		System.out.println(session.getClass().getName());
		String queryString = "from members where email = :email";
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
		MembersBean member = null;
		Session session = factory.getCurrentSession();
//		Integer ipk = Integer.valueOf(pk);
		member = (MembersBean) session.get(MembersBean.class, email);
		return member;
	}

	@Override
	public boolean addCustomer(MembersBean mem) {
		Session session = factory.getCurrentSession();
		session.save(mem);		
		return true;
	}

	@Override
	public boolean updateCustomer(MembersBean mem) {
		String hql= "from members where email = :email";
		Session session = factory.getCurrentSession();
		MembersBean member = (MembersBean)session.createQuery(hql).setParameter("email", mem.getEmail()).getSingleResult();
		//
		if(!mem.getAddress().equals(null)) {
			member.setAddress(mem.getAddress());
		}
		
		if(!mem.getCellphone().equals(null)) {
			member.setCellphone(mem.getCellphone());
		}
		
		if(!mem.getFirstName().equals(null)) {
			member.setFirstName(mem.getFirstName());
		}
		
		if(!mem.getLastName().equals(null)) {
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

}
