package stockSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SuppliersProvisionBean;
import memberSystem.dao.MemberDao;
import stockSystem.dao.StockDao;

public interface StockService {

	void setDao(StockDao dao);

	void setMemberDao(MemberDao memberDao);

	String getAllStockRequest();

	String getOneStockRequestJson(Integer sRequestId, boolean read);

	void saveOneStockRequest2(StockRequestBean StockRequest);

	Integer updateOneStockRequest(StockRequestBean StockRequest);

	void updateStockRequest(StockRequestBean prb, List<StockRequestDetailBean> prdbList);

	void saveOneStockRequest(StockRequestBean prb, List<StockRequestDetailBean> list);

	StockRequestBean getOneStockRequest(Integer sRequestId);

	List<MaterialsBean> getAllMaterials();

	String getAllMaterialsJson();

	// 插入讀取時間
	String updateReadTime(StockRequestBean StockRequest);

	String updateResponse(StockRequestBean StockRequest);

	List<MaterialsUnitBean> getAllMaterialsUnits();

	List<SuppliersProvisionBean> getAllSuppliersProvisions();

	void insertStockRequest(StockRequestBean stockRequest);

	Integer updateApprovedStockRequest(StockRequestBean StockRequest);

	void updateStockRequestStatus(Integer sRequestId, Integer requestStatus);

}