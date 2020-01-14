package shopSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.ProductBean;
import _model.SalesOrderBean;
import shopSystem.dao.ShopDao;

@Repository
public class ShopDaoImpl implements ShopDao {
	SessionFactory factory;
	
	
	@Autowired
	public void setDao(SessionFactory factory) {
		this.factory = factory;
	}

	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByName(String productName){
		String hql = "FROM ProductBean as PB WHERE PB.productName LIKE :param";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("param", "%"+productName+"%").getResultList();
		return list;
	}



	@Override
	public void saveOrder(SalesOrderBean SOB) {
		Session session = factory.getCurrentSession();
		session.save(SOB);
		
	}
}
