package purchaseSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.MaterialsBean;
import _model.PurchaseOrderBean;
import _model.PurchaseOrderDetailBean;
import _model.MaterialsUnitBean;
import _model.PurchaseOrderBean;
import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SupplierBean;
import _model.SuppliersProvisionBean;
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
	// 1-1.查詢所有請購單
	public List<PurchaseRequestBean> getAllPurchaseRequest() {
		String hql = "FROM PurchaseRequestBean";
		Session session = null;
		List<PurchaseRequestBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	// 1-2.查詢單一請購單(依請購單ID)
	public PurchaseRequestBean getOnePurchaseRequestById(Integer pRequestId) {
		Session session = factory.getCurrentSession();
		PurchaseRequestBean prb = session.get(PurchaseRequestBean.class, pRequestId);
		return prb;
	}

	// 2-1.新增請購單
	@Override
	public Integer insertOnePurchaseRequest(PurchaseRequestBean prb) {
		Session session = factory.getCurrentSession();
		Integer pRequestId = (Integer) session.save(prb);
		// 把新的請購單Id再set進Bean中？因為剛剛前端傳來的Bean中還沒有Id，現在set給它
		prb.setpRequestId(pRequestId);
		return pRequestId;
	}

	// 2-2.新增請購單明細
	@Override
	public void insertOnePurchaseRequestDetail(PurchaseRequestDetailBean purchaseRequestDetail) {
		Session session = factory.getCurrentSession();
		session.save(purchaseRequestDetail);
	}

	// 3-1.修改請購單
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
		if (prb.getRequestStatus() != null) {
			oldPrb.setRequestStatus(prb.getRequestStatus());
		}
		if(prb.getApproverId() != null) {
			oldPrb.setApproverId(prb.getApproverId());
		}
		if(prb.getResponseComment() != null) {
			if(prb.getResponseComment() != "") {
				oldPrb.setResponseComment(prb.getResponseComment());
			}
		}
		if(prb.getResponseTime() != null) {
			if(prb.getResponseTime() != "") {
				oldPrb.setResponseTime(prb.getResponseTime());
			}
		}
		if(prb.getTotalPrice() != null) {
			oldPrb.setTotalPrice(prb.getTotalPrice());
		}
		if(prb.getReadTime() != null) {
			if(prb.getReadTime() != "") {
				oldPrb.setReadTime(prb.getReadTime());
			}
		}
	}

	// 3-2.修改請購單明細
	@Override
	public void updatePurchaseRequestDetail(PurchaseRequestDetailBean prdb) {
		// 請購單明細僅須被改兩處：UnitPrice、Quantity
		Session session = factory.getCurrentSession();
		PurchaseRequestDetailBean oldBean = session.get(PurchaseRequestDetailBean.class, prdb.getpRequestDetailId());
		if (prdb.getUnitPrice() != null) {
			oldBean.setUnitPrice(prdb.getUnitPrice());
		}
		if (prdb.getQuantity() != null) {
			oldBean.setQuantity(prdb.getQuantity());
		}
		if (prdb.getActualQuantity() != null) {
			oldBean.setActualQuantity(prdb.getActualQuantity());
		} 
	}

	// 4.刪除單一請購單明細
	@Override
	public void deleteOnePurchaseDetail(PurchaseRequestDetailBean oprdb) {
		Session session = factory.getCurrentSession();
		session.delete(oprdb);
		System.out.println("已刪除欲刪之請購單品項");
	}

	// 1.查詢所有採購單
	@Override
	public List<PurchaseOrderBean> getAllPurchaseOrder() {
		String hql = "FROM PurchaseOrderBean";
		Session session = null;
		List<PurchaseOrderBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	// 2-1.新增採購單
	@Override
	public Integer insertOnePurchaseOrder(PurchaseOrderBean pob) {
		Session session = factory.getCurrentSession();
		Integer pOrderId = (Integer) session.save(pob);
		//// 把新的請購單Id再set進Bean中？因為剛剛前端傳來的Bean中還沒有Id，現在set給它
		//pob.setpOrderId(pOrderId);
		return pOrderId;
	}

	// 2-2.新增採購單明細
	@Override
	public void insertOnePurchaseOrderDetail(PurchaseOrderDetailBean purchaseOrderDetail) {
		Session session = factory.getCurrentSession();
		session.save(purchaseOrderDetail);
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

	@Override
	public List<MaterialsBean> getMaterialList() {
		String hql = "FROM MaterialsBean";
		Session session = factory.getCurrentSession();
		List<MaterialsBean> materials = session.createQuery(hql).getResultList();
		return materials;
	}
	
	@Override
	public void updateReadTime(PurchaseRequestBean purchaseRq) {
		Session session = factory.getCurrentSession();
		PurchaseRequestBean PRB = session.get(PurchaseRequestBean.class, purchaseRq.getpRequestId());
		PRB.setReadTime(purchaseRq.getReadTime());
	}

	@Override
	public void updateResponse(PurchaseRequestBean purchaseRq) {
		Session session = factory.getCurrentSession();
		PurchaseRequestBean PRB = session.get(PurchaseRequestBean.class, purchaseRq.getpRequestId());
		PRB.setResponseTime(purchaseRq.getResponseTime());
		PRB.setResponseComment(purchaseRq.getResponseComment());
		if(purchaseRq.getRequestStatus()!=2) {
			PRB.setRequestStatus(purchaseRq.getRequestStatus());
		}
	}

	@Override
	public List<MaterialsUnitBean> getAllMaterialsUnits() {
		String hql = "FROM MaterialsUnitBean";
		Session session = factory.getCurrentSession();
		List<MaterialsUnitBean> materialsUnits = session.createQuery(hql).getResultList();
		return materialsUnits;
	}

	@Override
	public List<SuppliersProvisionBean> getAllSuppliersProvisions() {
		String hql = "FROM SuppliersProvisionBean";
		Session session = factory.getCurrentSession();
		List<SuppliersProvisionBean> suppliersProvisions = session.createQuery(hql).getResultList();
		return suppliersProvisions;
	}

	@Override
	public void updatePurchaseRequestStatus(Integer pRequestId, Integer requestStatus) {
		String hql = "UPDATE PurchaseRequestBean SET requestStatus = :requestStatus WHERE pRequestId = :pRequestId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("requestStatus", requestStatus).setParameter("pRequestId", pRequestId).executeUpdate();
	}

	@Override
	public Integer insertOneStockRequest(StockRequestBean stockRequest) {
		Session session = factory.getCurrentSession();
		Integer sRequestId = (Integer)session.save(stockRequest);
		return sRequestId;
	}

	@Override
	public void insertOneStockRequestDetail(StockRequestDetailBean stockRequestDetail) {
		Session session = factory.getCurrentSession();
		session.save(stockRequestDetail);
	}

	@Override
	public void updatePurchaseRequestDetailByMaterial(PurchaseRequestDetailBean prdb) {
		// 請購單明細僅須被改兩處：UnitPrice、Quantity
		String hql = "FROM PurchaseRequestDetailBean WHERE pRequestId = :pRequestId AND materialsId = :materialsId";
		Session session = factory.getCurrentSession();
		List<PurchaseRequestDetailBean> purchaseRequestDetail = session.createQuery(hql).setParameter("pRequestId", prdb.getpRequestId()).setParameter("materialsId", prdb.getMaterialsId()).getResultList();
//		PurchaseRequestDetailBean oldBean = session.get(PurchaseRequestDetailBean.class, prdb.getpRequestDetailId());
		PurchaseRequestDetailBean oldBean = purchaseRequestDetail.get(0);
		if (prdb.getUnitPrice() != null) {
			oldBean.setUnitPrice(prdb.getUnitPrice());
		}
		if (prdb.getQuantity() != null) {
			oldBean.setQuantity(prdb.getQuantity());
		}
		if (prdb.getActualQuantity() != null) {
			oldBean.setActualQuantity(prdb.getActualQuantity());
		} 
	}

	@Override
	public PurchaseOrderBean getOnePurchaseOrderById(Integer pOrderId) {
		Session session = factory.getCurrentSession();
		PurchaseOrderBean purchaseOrder = session.get(PurchaseOrderBean.class, pOrderId);
		return purchaseOrder;
	}
}
