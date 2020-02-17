package shopSystem.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import _model.CrustBean;
import _model.ProductBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import _model.WebInfo;
import shopManageSystem.dao.ProductDao;
import shopSystem.dao.ShopDao;
import shopSystem.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {

	ShopDao dao;
	ProductDao pdDao;

	@Autowired
	public void setDao(ShopDao dao) {
		this.dao = dao;
	}

	@Autowired
	public void setPdDao(ProductDao pdDao) {
		this.pdDao = pdDao;
	}

	@Override
	public List<ProductBean> getProductByName(String productName) {
		return dao.getProductByName(productName);
	}

	// 取得相同產品名稱的產品
	@Override
	public String getProductByNameJson(String productName) {
		List<ProductBean> list = dao.getProductByName(productName);
		Gson gson = new Gson();
		return gson.toJson(list);
	}

	// 儲存會員送出訂單
	@Override
	public void saveOrder(SalesOrderBean SOB) {
		List<SalesOrderDetailBean> list = SOB.getSalesOrderDetails();
		SOB.setSalesOrderDetails(null);

		// 設定訂單時間
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formatDateTime = now.format(formatter);
		SOB.setOrderTime(formatDateTime);
		SOB.setOrderStatus(0);

		Integer salesOrderId = dao.saveOrder(SOB);

		for (SalesOrderDetailBean sd : list) {
//			sd.setSalesOrder(SOB);
			System.out.println(salesOrderId);
			sd.setSalesOrderId(salesOrderId);
			// 進銷存用 ，先預設塞值為0
			sd.setSalesListId(0);
			dao.insertOneSalesOrderDetail(sd);
		}
//		SOB.setSalesOrderDetails(list);
	}

	// 取得餅皮的資訊方法1
	// 撈取特定欄位方法一，手動轉
	@Override
	public List<CrustBean> getCrust() {
		List<Object[]> lists = dao.getCrust();
		List<CrustBean> cblist = new ArrayList<CrustBean>();
		for (Object[] ob : lists) {
			CrustBean newCb = new CrustBean();
			newCb.setCrustTypeName((String) ob[0]);
			newCb.setCrustTypeId((Integer) ob[1]);
			newCb.setUnitPrice((Integer) ob[2]);
			cblist.add(newCb);
		}
		return cblist;
	}

	// 取得餅皮的資訊方法2
	// 撈取特定欄位方法二，使用Hibernate方法 - setResultTransformer(但即將廢棄
	@Override
	public List<CrustBean> getCrustTest() {
		return dao.getCrustError();
	}

	// 更新網站資訊
	@Override
	public void insertWebInfo(WebInfo webinfo) {
		dao.insertInfo(webinfo);
	}

	// 取得網站可變動資訊
	@Override
	public WebInfo getWebInfo() {
		List<WebInfo> list = dao.getInfo();
		return list.get(list.size() - 1);
	}

	// 查詢會員的所有訂單
	@Override 
	public String getMemberAllOrders(Integer memberId){
		JSONArray output_jsa = new JSONArray();
		JSONObject order_jso = null;
		List<SalesOrderBean> orders =  dao.getMemberAllOrders(memberId);
		for(SalesOrderBean SOB : orders) {
			// 將訂單Bean轉換為JSON物件
			order_jso = new JSONObject(SOB);
			
			// 訂單狀態轉換
			 String orderStatus= formatStatus(order_jso.getInt("orderStatus"));
			 order_jso.put("orderStatus", orderStatus);
			 
			 // 取餐方式轉換
			 String needDelivery = formatDelivery(order_jso.getInt("needDelivery"));
			 order_jso.put("needDelivery", needDelivery);
			 
			// 取得訂單下的明細陣列
			JSONArray detail_jsa = order_jso.getJSONArray("salesOrderDetails");
			for(int i=0; i<detail_jsa.length();i++) {
				// 明細陣列取得每個物件的產品ID / 並塞產品名稱
				JSONObject detail_obj = detail_jsa.getJSONObject(i);
				ProductBean product = dao.getProductById(detail_obj.getInt("productId"));
				detail_obj.put("productName", product.getProductName());
				
				// 處理每一筆明細的價格(目前寫死)
				Integer unitPrice = detail_obj.getInt("unitPrice");
				unitPrice = (detail_obj.getInt("crustTypeId")==2)? unitPrice+60 :unitPrice;
				unitPrice = (detail_obj.getInt("doubleCheese")==1)? unitPrice+25 :unitPrice;
				detail_obj.put("unitPrice", unitPrice);
				
				
				// 增加餅皮名稱(目前寫死)
				String crustTypeName = formatCrust(detail_obj.getInt("crustTypeId"));
				detail_obj.put("crustTypeName", crustTypeName);
				
				// 確認是否有加起司(目前寫死)
				String doubleCheese = formatCheese(detail_obj.getInt("doubleCheese"));
				detail_obj.put("Cheese", doubleCheese);
				
				// 將更新後的物件再塞回原本位置
				detail_jsa.put(i, detail_obj);
			}
			// 將處理完的單筆訂單明細，放回訂單物件中後，放到輸出陣列
			order_jso.put("salesOrderDetails", detail_jsa);
			output_jsa.put(order_jso);
		};
		return output_jsa.toString(); 
	}

	
	public String formatCheese(Integer status) {
		switch (status) {
		case 0:
			return "正常起司";
		case 1:
			return "雙倍起司+25";
		default:
			return "";
		}
		
	}
	
	public String formatCrust(Integer status) {
		switch (status) {
		case 0:
			return "薄脆餅皮";
		case 1:
			return "鬆厚餅皮";
		case 2:
			return "芝心餅皮 +60";
		default:
			return "";
		}
	}

	public String formatDelivery(Integer status) {
		if (status == 0) {
			return "來店取餐";
		} else {
			return "外送到府";
		}
	}

	public String formatStatus(Integer status) {
		switch (status) {
		case 0:
			return "訂單送出";
		case 1:
			return "訂單取消";
		case 2:
			return "處理中";
		case 3:
			return "可取餐";
		case 4:
			return "運送中";
		case 5:
			return "已完成";
		default:
			return "";
		}
	}
	
	
	// 取得需要的productId後(銷量排名)，再將productBean分別加入輸出List中
	@Override
	public String getTopSixSales(){
		List<ProductBean> productList = new ArrayList<ProductBean>();
		List<Integer> productIds = dao.getTopSixSales();
		for(Integer pid: productIds) {
			ProductBean pb = pdDao.getProductById(pid);
			productList.add(pb); 
		}
		Gson gson = new Gson(); 
		return gson.toJson(productList);
	}
}
