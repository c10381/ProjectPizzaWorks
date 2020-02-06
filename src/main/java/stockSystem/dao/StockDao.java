package stockSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MaterialsBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SupplierBean;

public interface StockDao {

	//	@Override
	void setFactory(SessionFactory factory);

	List<StockRequestBean> getAllStockRequest();

	StockRequestBean getOneStockRequestById(Integer sRequestId);

	MaterialsBean getOneMaterialsById(Integer MaterialId);

	SupplierBean getOneSupplierById(Integer supplierId);

	Integer insertOneStockRequest(StockRequestBean srb);

	void insertOneStockRequestDetail(StockRequestDetailBean stockRequestDetail);

	void updateStockRequestDetail(StockRequestDetailBean stockRequestDetail);

	void updateStockRequest(StockRequestBean stockRequest);

}