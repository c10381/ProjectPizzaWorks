package shopSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.CrustBean;
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



	// 撈取特定欄位方法一，手動轉
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getCrust() {
		String hql = "select distinct crustTypeName , crustTypeId , unitPrice from CrustBean as CB";
		List<Object[]> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	// 撈取特定欄位方法二，使用Hibernate方法- setResultTransformer(但即將廢棄
		@SuppressWarnings({ "unchecked", "deprecation" })
		@Override
		public List<CrustBean> getCrustTest(){
			String hql = "SELECT DISTINCT CB.crustTypeId AS crustTypeId, CB.crustTypeName AS crustTypeName, CB.unitPrice AS unitPrice FROM CrustBean as CB";
			Session session = factory.getCurrentSession();
			List<CrustBean> crusts = new ArrayList<>();
			crusts = session.createQuery(hql).setResultTransformer(Transformers.aliasToBean(CrustBean.class)).list();
			return crusts;
		} 
		
		@SuppressWarnings("unchecked")
		@Override
		public List<CrustBean> getCrustError(){
			String hql = "select distinct crustTypeName , crustTypeId , unitPrice from CrustBean as CB";
			Session session = factory.getCurrentSession();
			List<CrustBean> crusts = new ArrayList<>();
			crusts = session.createQuery(hql).getResultList();
			return crusts;
		} 
		
}
