package shopManageSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;

import _model.ProductBean;

public interface ProductDao {

	void setFactory(SessionFactory factory);

	List<ProductBean> getAllProducts();

	String getImagePathById(Integer productId);

}