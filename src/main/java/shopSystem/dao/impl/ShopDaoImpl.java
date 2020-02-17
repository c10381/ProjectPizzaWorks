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
import _model.SalesOrderDetailBean;
import _model.WebInfo;
import shopSystem.dao.ShopDao;

@Repository
public class ShopDaoImpl implements ShopDao {
	SessionFactory factory;

	@Autowired
	public void setDao(SessionFactory factory) {
		this.factory = factory;
	}

	// 使用產品名稱來獲得同名產品
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByName(String productName) {
		String hql = "FROM ProductBean as PB WHERE PB.productName LIKE :param";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("param", "%" + productName + "%").getResultList();
		return list;
	}

	// 儲存訂單
	@Override
	public Integer saveOrder(SalesOrderBean SOB) {
		Session session = factory.getCurrentSession();
		Integer salesOrderId = (Integer) session.save(SOB);
		return salesOrderId;
	}

	// 取得餅皮資訊
	// 撈取特定欄位方法一，手動轉
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> getCrust() {
		String hql = "select distinct crustTypeName , crustTypeId , unitPrice from CrustBean as CB ORDER BY crustTypeId ASC";
		List<Object[]> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 撈取特定欄位方法二，使用Hibernate方法- setResultTransformer(但即將廢棄
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<CrustBean> getCrustTest() {
		String hql = "SELECT DISTINCT CB.crustTypeId AS crustTypeId, CB.crustTypeName AS crustTypeName, CB.unitPrice AS unitPrice FROM CrustBean as CB";
		Session session = factory.getCurrentSession();
		List<CrustBean> crusts = new ArrayList<>();
		crusts = session.createQuery(hql).setResultTransformer(Transformers.aliasToBean(CrustBean.class)).list();
		return crusts;
	}

	// 此方法無法使用
	@SuppressWarnings("unchecked")
	@Override
	public List<CrustBean> getCrustError() {
		String hql = "select distinct crustTypeName , crustTypeId , unitPrice from CrustBean as CB";
		Session session = factory.getCurrentSession();
		List<CrustBean> crusts = new ArrayList<>();
		crusts = session.createQuery(hql).getResultList();
		return crusts;
	}

	// 儲存訂單下的商品明細
	@Override
	public void insertOneSalesOrderDetail(SalesOrderDetailBean salesOrderDetail) {
		Session session = factory.getCurrentSession();
		session.save(salesOrderDetail);
	}

	// 更新網站資訊
	@Override
	public void insertInfo(WebInfo webinfo) {
		Session session = factory.getCurrentSession();
		session.save(webinfo);
	}

	// 取得網站資訊
	@Override
	public List<WebInfo> getInfo() {
		Session session = factory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<WebInfo> list = session.createQuery("from WebInfo").list();
		return list;
	}
	
	// 取得顧客所有訂單
	@Override
	@SuppressWarnings("unchecked")
	public List<SalesOrderBean> getMemberAllOrders(Integer memberId){
		String hql = "FROM SalesOrderBean WHERE memberId = :memberId";
		Session session = factory.getCurrentSession();
		List<SalesOrderBean> orders = session.createQuery(hql).setParameter("memberId", memberId).getResultList();	
		return orders;
	}
	
	@Override
	public ProductBean getProductById (Integer productId) {
		Session session = factory.getCurrentSession();
		ProductBean prodcut = session.get(ProductBean.class, productId);
		return prodcut;
	}
	
	
	// 取得銷量最高的五樣產品
	@Override
	@SuppressWarnings("unchecked")
	public List<Integer> getTopSixSales () {
		String hql =  "SELECT productId FROM  SalesOrderDetailBean GROUP BY productId ORDER BY SUM(quantity) DESC" ; 
		Session session = factory.getCurrentSession();
		List<Integer> productIds = session.createQuery(hql).setMaxResults(6).getResultList();
		return productIds;
	}

}
