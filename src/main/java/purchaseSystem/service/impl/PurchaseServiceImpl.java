package purchaseSystem.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MaterialsBean;
import _model.MembersBean;
import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import memberSystem.dao.MemberDao;
import purchaseSystem.dao.PurchaseDao;
import purchaseSystem.service.PurchaseService;

@Service
@Transactional
public class PurchaseServiceImpl implements PurchaseService {

	PurchaseDao dao;
	MemberDao memberDao;

	@Override
	@Autowired
	public void setDao(PurchaseDao dao) {
		this.dao = dao;
	}

	@Override
	@Autowired
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	// 1.查詢請購單(前端顯示食材名稱、員工姓名)
	@Override
	public String getAllPurchaseRequest() {
		List<PurchaseRequestBean> purchaseRequests = dao.getAllPurchaseRequest();
		JSONObject pRequest_jso = null;
		JSONArray output_jsa = new JSONArray();
		for (PurchaseRequestBean prb : purchaseRequests) {
			// 將Bean轉為JSON
			pRequest_jso = new JSONObject(prb);
			// 不知何原因，JSON中不會有PK，必須重新加入
			pRequest_jso.put("pRequestId", prb.getpRequestId());
			MembersBean member = memberDao.getMember(prb.getProposalerId());
			String lastName = member.getLastName();
			String firstName = member.getFirstName();
			String fullName = lastName + firstName;

			JSONArray pRequestDetail_jsa = new JSONArray();
			List<PurchaseRequestDetailBean> list2 = prb.getPurchaseRequestDetails();
			for (PurchaseRequestDetailBean prdb : list2) {
				String materialsName = dao.getOneMaterialsById(prdb.getMaterialsId()).getMaterialsName();
				JSONObject pRequestDetail_jso = new JSONObject(prdb);
				pRequestDetail_jso.put("pRequestDetailId", prdb.getpRequestDetailId());
				pRequestDetail_jso.put("materialsName", materialsName);
				pRequestDetail_jsa.put(pRequestDetail_jso);
			}
			pRequest_jso.put("fullName", fullName);
			pRequest_jso.put("purchaseRequestDetails", pRequestDetail_jsa);
			// 重複將JSON Obj放入JSON Array中
			output_jsa.put(pRequest_jso);
		}
		String jsonString = output_jsa.toString();
		return jsonString;
	}

	// 2.新增單張請購單
	@Override
	public void saveOnePurchaseRequest2(PurchaseRequestBean purchaseRequest) {
		// 新增請購單資料表，並回傳新產生之PK
		Integer pRequestId = dao.insertOnePurchaseRequest(purchaseRequest);
		List<PurchaseRequestDetailBean> purchaseRequestDetails = purchaseRequest.getPurchaseRequestDetails();
		for (PurchaseRequestDetailBean purchaseRequestDetail : purchaseRequestDetails) {
			// 加入FK至請購單明細中
			purchaseRequestDetail.setpRequestId(pRequestId);
			dao.insertOnePurchaseRequestDetail(purchaseRequestDetail);
		}
	}

	// 3.修改請購單2
	@Override
	public Integer updateOnePurchaseRequest2(PurchaseRequestBean purchaseRequest) {
		if (purchaseRequest.getRequestStatus() == 0) {
			dao.updatePurchaseRequest(purchaseRequest);
			PurchaseRequestBean original_pRequest = dao.getOnePurchaseRequestById(purchaseRequest.getpRequestId());
			List<PurchaseRequestDetailBean> original_pRequestDetails = original_pRequest.getPurchaseRequestDetails();
			List<Integer> used_index = new ArrayList<>();
			for (PurchaseRequestDetailBean prdb : purchaseRequest.getPurchaseRequestDetails()) {
				boolean flag = false;
				for (int i = 0; i < original_pRequestDetails.size() && !flag; i++) {
					if (original_pRequestDetails.get(i).getpRequestDetailId() == prdb.getpRequestDetailId()) {
						flag = true;
						dao.updatePurchaseRequestDetail(prdb);
						used_index.add(i);
					}
				}
				if (!flag) {
					dao.insertOnePurchaseRequestDetail(prdb);
				}
			}
			if (original_pRequestDetails.size() != used_index.size() && used_index.size() > 0) {
				for (PurchaseRequestDetailBean oprdb : original_pRequestDetails) {
					if (used_index.indexOf(oprdb.getpRequestDetailId()) == -1) {
						dao.deleteOnePurchaseDetail(oprdb);
					}
				}
			}
		} else {
			System.out.println("請購已被核准，無法修改");
			return 0;
		}
		return 1;
	}

	@Override
	public void updatePurchaseRequest(PurchaseRequestBean prb, List<PurchaseRequestDetailBean> prdbList) {
		// 若單子狀態為未核准，才可修改
		if (prb.getRequestStatus() == 0) {
			dao.updatePurchaseRequest(prb);
			for (PurchaseRequestDetailBean prdb : prdbList) {
				dao.updatePurchaseRequestDetail(prdb);
			}
		} else {
			System.out.println("請購已被核准，無法修改");
		}
	}

	@Override
	public void saveOnePurchaseRequest(PurchaseRequestBean prb, List<PurchaseRequestDetailBean> list) {
		// 將在controller處理過後的prb新增至資料庫，至此請購單Bean被更新，此處之載有資訊之請購單Bean(prb)，其中被更新的東西不包含Detail這個list
		// 因為本例為雙向一對多，FK在明細(多)方，資料表中請購單表中未有FK及參照。
		Integer pRequestId = dao.insertOnePurchaseRequest(prb);
		// 將在Controller處理過後的list新增置資料庫，該list包含新的諸Detail Bean
		for (PurchaseRequestDetailBean purchaseRequestDetail : list) {
			// 因第一行所述，請購單Bean中之明細List尚未被更新，此處反先對請購明細Bean更新，將帶有新的Id的前端傳來的請購單Bean，放進Detail
			// Bean中
			// purchaseRequestDetail中有Controller中處理過的detail資訊，尚差還有Id之新請購單Bean，現在補足
			purchaseRequestDetail.setpRequestId(pRequestId);
			// 把完整的purchaseRequestDetail放進資料庫中。
			dao.insertOnePurchaseRequestDetail(purchaseRequestDetail);
		}
	}

	@Override
	public PurchaseRequestBean getOnePurchaseRequest(Integer pRequestId) {
		PurchaseRequestBean purchaseRequest = dao.getOnePurchaseRequestById(pRequestId);
		return purchaseRequest;
	}

	@Override
	public String getOnePurchaseRequestJson(Integer pRequestId) {
		PurchaseRequestBean purchaseRequest = dao.getOnePurchaseRequestById(pRequestId);
		JSONObject pRequest_jso = new JSONObject(purchaseRequest);
		JSONArray pRequestDetail_jsa = new JSONArray();
		for (PurchaseRequestDetailBean purchaseRequestDetail : purchaseRequest.getPurchaseRequestDetails()) {
			String materialsName = dao.getOneMaterialsById(purchaseRequestDetail.getMaterialsId()).getMaterialsName();
			JSONObject pRequestDetail_jso = new JSONObject(purchaseRequestDetail);
			pRequestDetail_jso.put("pRequestDetailId", purchaseRequestDetail.getpRequestDetailId());
			pRequestDetail_jso.put("materialsName", materialsName);
			pRequestDetail_jsa.put(pRequestDetail_jso);
		}
		pRequest_jso.put("purchaseRequestDetails", pRequestDetail_jsa);

		String jsonString = pRequest_jso.toString();
		return jsonString;
	}

	@Override
	public List<MaterialsBean> getAllMaterials() {
		List<MaterialsBean> materials = dao.getMaterialList();
		return materials;
	}

	@Override
	public String getAllMaterialsJson() {
		List<MaterialsBean> materials = dao.getMaterialList();
		JSONArray materials_jsa = new JSONArray(materials);
		String jsonString = materials_jsa.toString();
		return jsonString;
	}
}
