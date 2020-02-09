package stockSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.StorageHistoryBean;
import _model.SupplierBean;
import _model.SuppliersProvisionBean;

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

	List<MaterialsUnitBean> getAllMaterialsUnits();

	List<SuppliersProvisionBean> getAllSuppliersProvisions();

	void updateResponse(StockRequestBean stockRequest);

	List<MaterialsBean> getMaterials();

	void updateReadTime(StockRequestBean stockRequest);

	void updateStockRequestStatus(Integer sRequestId, Integer requestStatus);

	void updateStockRequestDetailByMaterial(StockRequestDetailBean stockRequestDetail);

	void updateMaterialsByHistory(StorageHistoryBean storageHistory);

	void InsertOneStorageHistory(StorageHistoryBean storageHistory);

}