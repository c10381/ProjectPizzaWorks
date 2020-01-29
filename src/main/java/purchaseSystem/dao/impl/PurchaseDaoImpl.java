package purchaseSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.PurchaseRequestBean;
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
		session.createQuery(hql).getResultList();
		return list;
	}

	//修改請購單(依請購單號)
	@Override
	public void updateOnePurchaseRequest(PurchaseRequestBean prb) {
		Session session = null;
		session = factory.getCurrentSession();
		PurchaseRequestBean oldPurchaseRequest = session.get(PurchaseRequestBean.class, prb.getpRequestId());
		
		if(prb.getPurchaseRequestDetails()!=null){
			oldPurchaseRequest.setPurchaseRequestDetails(prb.getPurchaseRequestDetails());
		}
		if(prb.getPurchaseReason()!=null){
			oldPurchaseRequest.setPurchaseReason(prb.getPurchaseReason());
		}
		if(prb.getTotalPrice()!=null){
			oldPurchaseRequest.setTotalPrice(prb.getTotalPrice());
		}
	}
	
	//判斷請購單狀態
	@Override
	public Integer checkPurchaseReuestStatus(PurchaseRequestBean prb) {
		Session session = null;
		session = factory.getCurrentSession();
		Integer PurchaseReuestStatus = session.get(PurchaseRequestBean.class, prb.getpRequestId()).getRequestStatus();
		return PurchaseReuestStatus;
	}
	
	//新增請購單
	@Override
	public void insertOnePurchaseRequest(PurchaseRequestBean prb) {
		Session session = factory.getCurrentSession();
		session.save(prb);
	}

}
