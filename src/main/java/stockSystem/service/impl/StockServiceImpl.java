package stockSystem.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.MembersBean;
import _model.PurchaseOrderBean;
import _model.PurchaseOrderDetailBean;
import _model.PurchaseRequestBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.StorageHistoryBean;
import _model.StockRequestBean;
import _model.StockRequestDetailBean;
import _model.SuppliersProvisionBean;
import memberSystem.dao.MemberDao;
import purchaseSystem.dao.PurchaseDao;
import stockSystem.dao.StockDao;
import stockSystem.service.StockService;

@Service
@Transactional
public class StockServiceImpl implements StockService{

	StockDao dao;
	PurchaseDao pDao;
	MemberDao memberDao;

	
	@Override
	@Autowired
	public void setDao(StockDao dao) {
		this.dao = dao;
	}

	@Override
	@Autowired
	public void setpDao(PurchaseDao pDao) {
		this.pDao = pDao;
	}

	@Override
	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	// 1-1.查詢所有進貨單(前端顯示食材名稱、員工姓名)
	
	@Override
	public String getAllStockRequest() {
		List<StockRequestBean> StockRequests = dao.getAllStockRequest();
		JSONObject sRequest_jso = null;
		JSONArray output_jsa = new JSONArray();
		for (StockRequestBean prb : StockRequests) {
			// 將Bean轉為JSON
			sRequest_jso = new JSONObject(prb);
			sRequest_jso.put("sRequestId", prb.getsRequestId());
			MembersBean member = memberDao.getMember(prb.getProposalerId());
			String lastName = member.getLastName();
			String firstName = member.getFirstName();
			String fullName = lastName + firstName;

			JSONArray sRequestDetail_jsa = new JSONArray();
			List<StockRequestDetailBean> list2 = prb.getStockRequestDetails();
			for (StockRequestDetailBean srdb : list2) {
				String materialsName = dao.getOneMaterialsById(srdb.getMaterialsId()).getMaterialsName();
//				System.out.println(srdb.getMaterialsId());
//				System.out.println(materialsName);
				JSONObject sRequestDetail_jso = new JSONObject(srdb);
				sRequestDetail_jso.put("sRequestDetailId", srdb.getsRequestDetailId());
				sRequestDetail_jso.put("materialsName", materialsName);
				sRequestDetail_jsa.put(sRequestDetail_jso);
			}
			sRequest_jso.put("fullName", fullName);
			sRequest_jso.put("stockRequestDetails", sRequestDetail_jsa);
			// 重複將JSON Obj放入JSON Array中
			output_jsa.put(sRequest_jso);
		}
		String jsonString = output_jsa.toString();
		return jsonString;
	}

	// 1-2.查詢單張進貨單
	@Override
	public String getOneStockRequestJson(Integer sRequestId, boolean read) {
		// +sRequestId、proposalerName、approvalerName
		StockRequestBean stockRequest = dao.getOneStockRequestById(sRequestId);
		if(read && stockRequest.getReadTime() == null) {
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			LocalDateTime time = LocalDateTime.now();
			String localTime = df.format(time);
			stockRequest.setReadTime(localTime);
		}
		JSONObject sRequest_jso = new JSONObject(stockRequest);
		sRequest_jso.put("sRequestId", sRequestId);
		MembersBean proposaler = memberDao.getMember(stockRequest.getProposalerId());
		MembersBean approver = memberDao.getMember(stockRequest.getApproverId());
		sRequest_jso.put("proposalerName", proposaler.getLastName() + proposaler.getFirstName());
		if (approver != null) {
			sRequest_jso.put("approverName", approver.getLastName() + approver.getFirstName());
		}
		JSONArray sRequestDetail_jsa = new JSONArray();
		for (StockRequestDetailBean stockRequestDetail : stockRequest.getStockRequestDetails()) {
			String materialsName = dao.getOneMaterialsById(stockRequestDetail.getMaterialsId()).getMaterialsName();
			JSONObject sRequestDetail_jso = new JSONObject(stockRequestDetail);
			sRequestDetail_jso.put("sRequestDetailId", stockRequestDetail.getsRequestDetailId());
			sRequestDetail_jso.put("materialsName", materialsName);
			sRequestDetail_jsa.put(sRequestDetail_jso);
		}
//		pRequest_jso.put("sRequestId", StockRequest.getsRequestId());
		sRequest_jso.put("stockRequestDetails", sRequestDetail_jsa);
		String jsonString = sRequest_jso.toString();
		return jsonString;
	}

	// 2.新增單張進貨單
	
	@Override
	public void saveOneStockRequest2(StockRequestBean StockRequest) {
		// 新增進貨單資料表，並回傳新產生之PK
		List<StockRequestDetailBean> StockRequestDetails = StockRequest.getStockRequestDetails();
		StockRequest.setStockRequestDetails(null);
		Integer sRequestId = dao.insertOneStockRequest(StockRequest);
		for (StockRequestDetailBean StockRequestDetail : StockRequestDetails) {
			// 加入FK至進貨單明細中
			StockRequestDetail.setsRequestId(sRequestId);
			dao.insertOneStockRequestDetail(StockRequestDetail);
		}
	}

	// 3.修改進貨單2
	
	@Override
	public Integer updateOneStockRequest(StockRequestBean StockRequest) {
//		if (StockRequest.getRequestStatus() == 0) {
//			dao.updateStockRequest(StockRequest);
//			StockRequestBean original_pRequest = dao.getOneStockRequestById(StockRequest.getsRequestId());
//			List<StockRequestDetailBean> original_pRequestDetails = original_pRequest.getStockRequestDetails();
//			List<Integer> used_index = new ArrayList<>();
//			for (StockRequestDetailBean prdb : StockRequest.getStockRequestDetails()) {
//				boolean flag = false;
//				for (int i = 0; i < original_pRequestDetails.size() && !flag; i++) {
//					if (original_pRequestDetails.get(i).getsRequestDetailId() == prdb.getsRequestDetailId()) {
//						flag = true;
//						dao.updateStockRequestDetail(prdb);
//						used_index.add(i);
//					}
//				}
//				if (!flag) {
//					dao.insertOneStockRequestDetail(prdb);
//				}
//			}
//			if (original_pRequestDetails.size() != used_index.size() && used_index.size() > 0) {
//				for (StockRequestDetailBean oprdb : original_pRequestDetails) {
//					if (used_index.indexOf(oprdb.getsRequestDetailId()) == -1) {
//						dao.deleteOnePurchaseDetail(oprdb);
//					}
//				}
//			}
//		} else {
//			System.out.println("進貨已被核准，無法修改");
//			return 0;
//		}
		return 1;
	}
	
	@Override
	public void updateStockRequest(StockRequestBean prb, List<StockRequestDetailBean> prdbList) {
		// 若單子狀態為未核准，才可修改
		if (prb.getRequestStatus() == 0) {
			dao.updateStockRequest(prb);
			for (StockRequestDetailBean prdb : prdbList) {
				dao.updateStockRequestDetail(prdb);
			}
		} else {
			System.out.println("進貨已被核准，無法修改");
		}
	}

	
	@Override
	public void saveOneStockRequest(StockRequestBean prb, List<StockRequestDetailBean> list) {
		// 將在controller處理過後的prb新增至資料庫，至此進貨單Bean被更新，此處之載有資訊之進貨單Bean(prb)，其中被更新的東西不包含Detail這個list
		// 因為本例為雙向一對多，FK在明細(多)方，資料表中進貨單表中未有FK及參照。
		Integer sRequestId = dao.insertOneStockRequest(prb);
		// 將在Controller處理過後的list新增置資料庫，該list包含新的諸Detail Bean
		for (StockRequestDetailBean StockRequestDetail : list) {
			// 因第一行所述，進貨單Bean中之明細List尚未被更新，此處反先對進貨明細Bean更新，將帶有新的Id的前端傳來的進貨單Bean，放進Detail
			// Bean中
			// StockRequestDetail中有Controller中處理過的detail資訊，尚差還有Id之新進貨單Bean，現在補足
			StockRequestDetail.setsRequestId(sRequestId);
			// 把完整的StockRequestDetail放進資料庫中。
			dao.insertOneStockRequestDetail(StockRequestDetail);
		}
	}

	
	@Override
	public StockRequestBean getOneStockRequest(Integer sRequestId) {
		StockRequestBean StockRequest = dao.getOneStockRequestById(sRequestId);
		return StockRequest;
	}

	
	@Override
	public List<MaterialsBean> getAllMaterials() {
		List<MaterialsBean> materials = dao.getMaterials();
		return materials;
	}

	
	@Override
	public String getAllMaterialsJson() {
		List<MaterialsBean> materials = dao.getMaterials();
		JSONArray materials_jsa = new JSONArray(materials);
		String jsonString = materials_jsa.toString();
		return jsonString;
	}

	
	// 插入讀取時間
	@Override
	public String updateReadTime(StockRequestBean StockRequest) {
		// 取得現在時間
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime time = LocalDateTime.now();
		String localTime = df.format(time);
		// 傳遞要更新的bean
		StockRequest.setReadTime(localTime);
		dao.updateReadTime(StockRequest);

		return localTime;
	}

	
	@Override
	public String updateResponse(StockRequestBean StockRequest) {
		// 取得現在時間
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime time = LocalDateTime.now();
		String localTime = df.format(time);
		StockRequest.setResponseTime(localTime);
		dao.updateResponse(StockRequest);
		return null;
	}

	
	@Override
	public List<MaterialsUnitBean> getAllMaterialsUnits() {
		return dao.getAllMaterialsUnits();
	}

	@Override
	public List<SuppliersProvisionBean> getAllSuppliersProvisions() {
		return dao.getAllSuppliersProvisions();
	}

	@Override
	public void insertStockRequest(StockRequestBean stockRequest) {
		List<StockRequestDetailBean> stockRequestDetails = stockRequest.getStockRequestDetails();
		stockRequest.setStockRequestDetails(null);
		Integer sRequestId = dao.insertOneStockRequest(stockRequest);
		for (StockRequestDetailBean stockRequestDetail : stockRequestDetails) {
			// 加入FK至進貨單明細中
			stockRequestDetail.setsRequestId(sRequestId);
			dao.insertOneStockRequestDetail(stockRequestDetail);
		}
	}
	
	@Override
	public Integer updateApprovedStockRequest(StockRequestBean stockRequest) {

		dao.updateStockRequest(stockRequest);
		PurchaseRequestBean purchaseRequest = pDao.getOnePurchaseRequestById(pDao.getOnePurchaseOrderById(stockRequest.getpOrderId()).getpRequestId());
		purchaseRequest.setRequestStatus(3);
		return 1;
	}

	@Override
	public void updateStockRequestStatus(Integer sRequestId, Integer requestStatus) {
		dao.updateStockRequestStatus(sRequestId, requestStatus);
	}

	@Override
	public void updateMaterialsByHistory(List<StorageHistoryBean> storageHistorys) {
		for(StorageHistoryBean storageHistory:storageHistorys) {
			dao.updateMaterialsByHistory(storageHistory);
		}
	}

	@Override
	public void insertStockHistory(List<StorageHistoryBean> storageHistorys) {
		for(StorageHistoryBean storageHistory:storageHistorys) {
			dao.InsertOneStorageHistory(storageHistory);
		}
	}

	
}
