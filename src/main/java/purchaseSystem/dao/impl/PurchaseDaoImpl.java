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
	// 查詢所有請購單
	public List<PurchaseRequestBean> getAllPurchaseRequest() {
		String hql = "FROM PurchaseRequestBean";
		Session session = null;
		List<PurchaseRequestBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	// 查詢單一請購單(依請購單ID)
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
	// 查詢單一供應商資料(依廠商ID)
	public SupplierBean getOneSupplierById(Integer supplierId) {
		Session session = factory.getCurrentSession();
		SupplierBean sb = session.get(SupplierBean.class, supplierId);
		return sb;
	}

	// 新增請購單
	@Override
	public Integer insertOnePurchaseRequest(PurchaseRequestBean prb) {
		Session session = factory.getCurrentSession();
		Integer pRequestId = (Integer) session.save(prb);
		// 把新的請購單Id再set進Bean中？因為剛剛前端傳來的Bean中還沒有Id，現在set給它
		prb.setpRequestId(pRequestId);
		return pRequestId;
	}

	// 新增請購單明細
	@Override
	public void insertOnePurchaseRequestDetail(PurchaseRequestDetailBean purchaseRequestDetail) {
		Session session = factory.getCurrentSession();
		session.save(purchaseRequestDetail);
	}

	// 修改請購單明細
	@Override
	public void updatePurchaseRequestDetail(PurchaseRequestDetailBean prdb) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PurchaseRequestDetailBean WHERE pRequestId=:pRequestId AND materialsId=:materialsId";
		List<PurchaseRequestDetailBean> list = session.createQuery(hql).setParameter("pRequestId", prdb.getpRequestId())
				.setParameter("materialsId", prdb.getMaterialsId()).getResultList();
		for (PurchaseRequestDetailBean oldBean : list) {
			session.save(oldBean);

			if (prdb.getUnitPrice() != null) {
				oldBean.setUnitPrice(prdb.getUnitPrice());
			}
			if (prdb.getQuantity() != null) {
				oldBean.setQuantity(prdb.getQuantity());
			}
		}
	}

	// 修改請購單
	@Override
	public void updatePurchaseRequest(PurchaseRequestBean prb) {
		Session session = factory.getCurrentSession();
		PurchaseRequestBean oldPrb = session.get(PurchaseRequestBean.class, prb.getpRequestId());
		if (prb.getPurchaseReason() != null) {
			if (!prb.getPurchaseReason().equals("")) {
				oldPrb.setPurchaseReason(prb.getPurchaseReason());
			}
		}
		if (prb.getTotalPrice() != null) {
			oldPrb.setTotalPrice(prb.getTotalPrice());
		}
	}

}
