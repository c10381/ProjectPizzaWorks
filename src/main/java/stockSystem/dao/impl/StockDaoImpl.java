package stockSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MaterialsBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SupplierBean;
import stockSystem.dao.StockDao;

@Repository
public class StockDaoImpl implements StockDao {

	SessionFactory factory;

//	@Override
	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public List<StockRequestBean> getAllStockRequest() {
		String hql = "FROM StockRequestBean";
		Session session = null;
		List<StockRequestBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public StockRequestBean getOneStockRequestById(Integer sRequestId) {
		Session session = factory.getCurrentSession();
		StockRequestBean srb = session.get(StockRequestBean.class, sRequestId);
		return srb;
	}

	@Override
	public MaterialsBean getOneMaterialsById(Integer MaterialId) {
		Session session = factory.getCurrentSession();
		MaterialsBean mb = session.get(MaterialsBean.class, MaterialId);
		return mb;
	}

	@Override
	public SupplierBean getOneSupplierById(Integer supplierId) {
		Session session = factory.getCurrentSession();
		SupplierBean sb = session.get(SupplierBean.class, supplierId);
		return sb;
	}
	
	@Override
	public Integer insertOneStockRequest(StockRequestBean srb) {
		Session session = factory.getCurrentSession();
		Integer sRequestId = (Integer) session.save(srb);
		srb.setsRequestId(sRequestId);
		return sRequestId;
	}
	
	@Override
	public void insertOneStockRequestDetail(StockRequestDetailBean stockRequestDetail) {
		Session session = factory.getCurrentSession();
		session.save(stockRequestDetail);
	}
	
	@Override
	public void updateStockRequestDetail(StockRequestDetailBean stockRequestDetail) {
		Session session = factory.getCurrentSession();
		String hql = "FROM PurchaseRequestDetailBean WHERE sRequestId=:sRequestId AND materialsId=:materialsId";
		List<StockRequestDetailBean> list = session.createQuery(hql).setParameter("sRequestId", stockRequestDetail.getsRequestId())
				.setParameter("materialsId", stockRequestDetail.getMaterialsId()).getResultList();
		for (StockRequestDetailBean oldBean : list) {
			session.save(oldBean);

			if (stockRequestDetail.getUnitPrice() != null) {
				oldBean.setUnitPrice(stockRequestDetail.getUnitPrice());
			}
			if (stockRequestDetail.getQuantity() != null) {
				oldBean.setQuantity(stockRequestDetail.getQuantity());
			}
		}
	}

	@Override
	public void updateStockRequest(StockRequestBean stockRequest) {
		Session session = factory.getCurrentSession();
		StockRequestBean original_sRequest = session.get(StockRequestBean.class, stockRequest.getsRequestId());
		if (stockRequest.getBriefInfo() != null) {
			if (!stockRequest.getBriefInfo().equals("")) {
				original_sRequest.setBriefInfo(stockRequest.getBriefInfo());
			}
		}
	}
}
