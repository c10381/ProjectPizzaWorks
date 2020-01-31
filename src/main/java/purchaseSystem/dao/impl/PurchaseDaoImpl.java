package purchaseSystem.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MaterialsBean;
import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import _model.SupplierBean;
import purchaseSystem.dao.PurchaseDao;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	
	SessionFactory factory;
	
	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	//查詢所有請購單
	public List<PurchaseRequestBean> getAllPurchaseRequest() {
		String hql = "FROM PurchaseRequestBean";
		Session session = null;
		List<PurchaseRequestBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	//查詢單一請購單(依請購單ID)
	public PurchaseRequestBean getOnePurchaseRequestById(Integer pRequestId) {
		Session session = factory.getCurrentSession();
		PurchaseRequestBean prb = session.get(PurchaseRequestBean.class, pRequestId);
		return prb;
	}
	
	@Override
	public MaterialsBean getOneMaterialsById(Integer MaterialId) {
		Session session = factory.getCurrentSession();
		MaterialsBean mb = session.get(MaterialsBean.class, MaterialId);
		return mb;
	}
	
	@Override
	//查詢單一供應商資料(依廠商ID)
	public SupplierBean getOneSupplierById(Integer supplierId) {
		Session session = factory.getCurrentSession();
		SupplierBean sb = session.get(SupplierBean.class, supplierId);
		return sb;
	}
	

	//從請購單中取出廠商ID，再關聯至廠商名稱


	//修改請購單(依請購單號)
	@Override
	public void updateOnePurchaseRequest(Integer pRequestId, String purchaseReason, Integer requestStatus, Integer quantity, Double unitPrice) {
		Session session = null;
		session = factory.getCurrentSession();
		
		PurchaseRequestBean oldPurchaseRequest = session.get(PurchaseRequestBean.class, pRequestId);
		if(purchaseReason!=null){
			oldPurchaseRequest.setPurchaseReason(purchaseReason);
		}
		
		String hql = "from PurchaseRequestDetailBean where pRequestId = :pRequestId";
		//取得一列值(PurchaseRequest v.s. PurchaseRequestDetail : 一對多)
		List<PurchaseRequestDetailBean> list = session.createQuery(hql).setParameter("pRequestId", pRequestId).getResultList();
		for(PurchaseRequestDetailBean oldprdb : list) {
			session.save(oldprdb);
			if(unitPrice!=null) {
				oldprdb.setUnitPrice(unitPrice);
			}
			if(quantity!=null) {
				oldprdb.setQuantity(quantity);
			}
		}
	}
	
	//新增請購單
	@Override
	public void insertOnePurchaseRequest(PurchaseRequestBean prb) {
		Session session = factory.getCurrentSession();
		session.save(prb);
	}

}
