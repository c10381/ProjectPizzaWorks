package statisticalAnalysisSystem.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MaterialsUnitBean;
import _model.RecipeBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import _model.StorageHistoryBean;
import _model.SuppliersProvisionBean;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;

@Repository
public class StatisticalAnalysisDaoImpl implements StatisticalAnalysisDao {

	SessionFactory factory;

	@Override
	@Autowired
	public void setDao(SessionFactory factory) {
		this.factory = factory;
	}

	// 取得單一食譜(依據產品ID)
	@Override
	public List<RecipeBean> getOneRecipeById(Integer productId) {
		String hql = "from RecipeBean where productId=:productId";
		Session session = factory.getCurrentSession();
		List<RecipeBean> list = session.createQuery(hql).setParameter("productId", productId).getResultList();
		return list;
	}

	// 取得一箱有多少量(依據食材ID)
	@Override
	public Double getQuantityPerUnit(Integer materialsId) {
		Session session = factory.getCurrentSession();
		MaterialsUnitBean mub = session.get(MaterialsUnitBean.class, materialsId);
		System.out.println(mub);
		Double transFactor = mub.getQuantityPerUnit();
		return transFactor;
	}

	// 取得單一食材進貨價格(依據食材ID)from SuppliersProvision
	@Override
	public Double getOneMaterialUnitPrice(Integer materialsId) {
		String hql = "from SuppliersProvisionBean where materialId=:materialId";
		Session session = factory.getCurrentSession();
		SuppliersProvisionBean spb = (SuppliersProvisionBean) session.createQuery(hql)
				.setParameter("materialId", materialsId).getSingleResult();
		Double oneBoxCost = spb.getUnitPrice();
		Double transFactor = getQuantityPerUnit(materialsId);
		Double materialUnitCost = oneBoxCost / transFactor;
		return materialUnitCost;
	}

	// 取得單一食材storageHistoryBeanList(依據食材ID)
	@Override
	public List<StorageHistoryBean> getMaterialUnitCost_SHB(Integer materialsId) {
		String hql = "from StorageHistoryBean where materialsId=:materialsId";
		Session session = factory.getCurrentSession();
		List<StorageHistoryBean> list = session.createQuery(hql).setParameter("materialsId", materialsId)
				.getResultList();
		// 此List包含不同時間點之進貨價格，屆時在service可以限制期間，假如食材有多筆進貨紀錄的話
		return list;
	}

	@Override
	public Integer insertSalesOrder(SalesOrderBean salesOrder) {
		Session session = factory.getCurrentSession();
		Integer saleOrderId = (Integer) session.save(salesOrder);
		return saleOrderId;
	}

	@Override
	public void insertSalesOrderDetail(SalesOrderDetailBean salesOrderDetail) {
		Session session = factory.getCurrentSession();
		Integer saleOrderDetailId = (Integer) session.save(salesOrderDetail);
	}

	// 從Storage裡取得所有的Lsit
	@Override
	public List<StorageHistoryBean> getStorageHistoryBeanList() {
		String hql = "from StorageHistoryBean";
		Session session = factory.getCurrentSession();
		List<StorageHistoryBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	// 從SalesOrder裡取得所有的List
	@Override
	public List<SalesOrderBean> getSalesOrderBeanList() {
		String hql = "from SalesOrderBean";
		Session session = factory.getCurrentSession();
		List<SalesOrderBean> list = session.createQuery(hql).getResultList();
		return list;
	}
}
