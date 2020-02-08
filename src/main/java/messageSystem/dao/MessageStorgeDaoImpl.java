package messageSystem.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MessageBean;

@Repository
public class MessageStorgeDaoImpl implements MessageStorgeDao {
	
	@Autowired
	private SessionFactory factory;
	

	public MessageStorgeDaoImpl() {
	}
	
	@Override
	public boolean insertMessage(MessageBean messageBean) {
		Session session=factory.getCurrentSession();
		session.save(messageBean);
		return true;
	}
	
	@Override
	public List<?> getMessage(String fromEmail,String toEmail) {
		Session session=factory.getCurrentSession();
		String queryString = "FROM MessageBean WHERE fromEmail IN (:fromEmail,:toEmail) AND toEmail IN (:fromEmail,:toEmail)";
		List<?> list = session.createQuery(queryString).setParameter("fromEmail", fromEmail).setParameter("toEmail", toEmail).list();
		return list;
	}
}
