package purchaseSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import _model.PurchaseRequestBean;
import purchaseSystem.dao.PurchaseDao;
import purchaseSystem.service.PurchaseService;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	
	PurchaseDao dao;
	
	@Override
	@Autowired
	public void setDao(PurchaseDao dao) {
		this.dao = dao;
	}

	@Override
	public List<PurchaseRequestBean> getAllPurchaseRequest() {
		return dao.getAllPurchaseRequest();
	}

	@Override
	public void updateOnePurchaseRequest(PurchaseRequestBean prb) {
		if(dao.checkPurchaseReuestStatus(prb)==0) {
			dao.updateOnePurchaseRequest(prb);
		}else {
			System.out.println("請購已被核准，無法修改");
		}
	}

	@Override
	public Integer checkPurchaseReuestStatus(PurchaseRequestBean prb) {
		return dao.checkPurchaseReuestStatus(prb);
	}

	@Override
	public void insertOnePurchaseRequest(PurchaseRequestBean prb) {
		dao.insertOnePurchaseRequest(prb);
	}

}
