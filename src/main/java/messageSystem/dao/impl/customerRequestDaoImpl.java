package messageSystem.dao.impl;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.customerRequestBean;
import messageSystem.dao.customerRequestDao;

@Repository
public class customerRequestDaoImpl implements customerRequestDao {

	SessionFactory factory;

	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public Boolean insertcustomerRequest(customerRequestBean crb) {
		Session session = factory.getCurrentSession();
		try {
			crb.setQueryDate(String.valueOf(new Timestamp(new Date().getTime())));
			//0為還未回復
			crb.setReplyStatus(0);
			session.save(crb);
		} catch (Exception e) {
			return false;
		}
		return true;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<customerRequestBean> getAllcustomerRequestByReplyStatus(Integer ReplyStatus) {
		Session session = factory.getCurrentSession();
		List<customerRequestBean> list = new ArrayList<>();
		String hql = "FROM customerRequestBean WHERE ReplyStatus = :ReplyStatus";
		try {
			list = session.createQuery(hql).setParameter("ReplyStatus", ReplyStatus).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<customerRequestBean> getAllQuery() {
		Session session = factory.getCurrentSession();
		List<customerRequestBean> list = new ArrayList<>();
		String hql = "FROM customerRequestBean";
		try {
			list = session.createQuery(hql).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return list;
	}

	@Override
	public customerRequestBean getcustomerRequestByQueryId(Integer QueryId) {
		Session session = factory.getCurrentSession();
		String hql = "FROM customerRequestBean WHERE QueryId = :QueryId";
		customerRequestBean crb = new customerRequestBean();
		try {
		crb = (customerRequestBean) session.createQuery(hql)
				.setParameter("QueryId", QueryId)
				.getSingleResult();
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return crb;
	}

	@Override
	public Boolean replycustomerRequest(customerRequestBean crb) {
		LocalDateTime ldt = LocalDateTime.now();
		Session session = factory.getCurrentSession();
		String hql = "UPDATE customerRequestBean SET ReplyStatus=2, coworkerID= :coworkerID, ReplyContent = :ReplyContent, ReplyDate = :ReplyDate WHERE QueryId = :QueryId";
		try {
		session.createQuery(hql).setParameter("coworkerID", crb.coworkerID)
				.setParameter("ReplyContent", crb.getReplyContent())
				.setParameter("ReplyDate", String.valueOf(new Timestamp(new Date().getTime())))
				.setParameter("QueryId", crb.getQueryId()).executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
