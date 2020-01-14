package shopSystem.service.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import _model.ProductBean;
import _model.SalesOrderBean;
import shopSystem.dao.ShopDao;
import shopSystem.service.ShopService;

@Service
public class ShopServiceImpl implements ShopService {

	ShopDao dao ;
	
	@Autowired
	public void setDao(ShopDao dao) {
		this.dao = dao;
	}
	
	@Override
	@Transactional
	public List<ProductBean> getProductByName(String productName){
		return dao.getProductByName(productName);
	}
	
	
	@Override
	@Transactional
	public String getProductByNameJson(String productName){
		List<ProductBean> list = dao.getProductByName(productName);
		Gson gson = new Gson();
		
		return gson.toJson(list);
	}
	
	@Override
	@Transactional
	public void saveOrder(SalesOrderBean SOB) {
		Timestamp time = new java.sql.Timestamp(System.currentTimeMillis());
		SOB.setMemberId(6);
		SOB.setOrderTime(time);
		SOB.setRequireTime(time);
		
		dao.saveOrder(SOB);
		
	}
}
