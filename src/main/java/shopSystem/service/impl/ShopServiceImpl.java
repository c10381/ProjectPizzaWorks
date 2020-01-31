package shopSystem.service.impl;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import _model.CrustBean;
import _model.ProductBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import shopSystem.dao.ShopDao;
import shopSystem.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {

	ShopDao dao;

	@Autowired
	public void setDao(ShopDao dao) {
		this.dao = dao;
	}

	@Override
	public List<ProductBean> getProductByName(String productName) {
		return dao.getProductByName(productName);
	}

	@Override
	public String getProductByNameJson(String productName) {
		List<ProductBean> list = dao.getProductByName(productName);
		Gson gson = new Gson();
		return gson.toJson(list);
	}

	@Override
	public void saveOrder(SalesOrderBean SOB) {
		List<SalesOrderDetailBean> list = SOB.getSalesOrderDetails();
		
		//設定訂單時間
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formatDateTime = now.format(formatter);
        SOB.setOrderTime(formatDateTime);
        System.out.println(SOB.getOrderTime());
        
		for (SalesOrderDetailBean sd : list) {
//			sd.setSalesOrder(SOB);
			sd.setSalesOrderId(SOB.getSalesOrderId());
			//進銷存用 ，先預設塞值為0
			sd.setSalesListId(0);
		}
		SOB.setMemberId(6);
		SOB.setOrderStatus(0);
		dao.saveOrder(SOB);

	}

	@Override
	// 撈取特定欄位方法一，手動轉
	public List<CrustBean> getCrust() {
		List<Object[]> lists = dao.getCrust();
		List<CrustBean> cblist = new ArrayList<CrustBean>();
		for (Object[] ob: lists) {
			CrustBean newCb = new CrustBean();
			newCb.setCrustTypeName((String) ob[0]);
			newCb.setCrustTypeId((Integer) ob[1]);
			newCb.setUnitPrice((Integer) ob[2]);
			cblist.add(newCb);
		}
		return cblist;
	}
	// 撈取特定欄位方法二，使用Hibernate方法 - setResultTransformer(但即將廢棄
	@Override
	public List<CrustBean> getCrustTest() {
		return dao.getCrustError();
	}
	
	
}
