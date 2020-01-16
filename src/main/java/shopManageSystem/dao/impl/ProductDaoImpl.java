package shopManageSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesOrderBean;
import shopManageSystem.dao.ProductDao;

@Repository
public class ProductDaoImpl implements ProductDao {
	SessionFactory factory;

	@Override
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public void updateOneProduct(ProductBean pb) {
		Session session = null;
		session = factory.getCurrentSession();
		ProductBean originalProduct = session.get(ProductBean.class, pb.getProductId());
		if (pb.getProductName() != null) {
			originalProduct.setProductName(pb.getProductName());
		}
		if (pb.getBriefInfo() != null) {
			originalProduct.setBriefInfo(pb.getBriefInfo());
		}
		if (pb.getUnitPrice() != null) {
			originalProduct.setUnitPrice(pb.getUnitPrice());
		}
		if (pb.getActiveStatus() != null) {
			originalProduct.setActiveStatus(pb.getActiveStatus());
		}
		if (pb.getSpicyLevel() != null) {
			originalProduct.setSpicyLevel(pb.getSpicyLevel());
		}
		if (pb.getVegetableOnly() != null) {
			originalProduct.setVegetableOnly(pb.getVegetableOnly());
		}
		if (pb.getSeafood() != null) {
			originalProduct.setSeafood(pb.getSeafood());
		}
		if (pb.getPork() != null) {
			originalProduct.setPork(pb.getPork());
		}
		if (pb.getBeef() != null) {
			originalProduct.setBeef(pb.getBeef());
		}
		if (pb.getChicken() != null) {
			originalProduct.setChicken(pb.getChicken());
		}
		if (pb.getImagePath() != null) {
			originalProduct.setImagePath(pb.getImagePath());
		}
	}

	@Override
	public ProductBean getProductById(Integer productId) {
		Session session = factory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		return pb;
	}

	@Override
	public void updateOneRecipe(RecipeBean recipe) {
		String hql = "UPDATE RecipeBean SET quantity = :quantity WHERE productId = :productId AND materialsId = :materialsId";
		Session session = factory.getCurrentSession();
		
		session.createQuery(hql).setParameter("quantity", recipe.getQuantity())
				.setParameter("productId", recipe.getProduct().getProductId())
				.setParameter("materialsId", recipe.getMaterial().getMaterialsId()).executeUpdate();
	}
	
	@Override
	public void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId) {
		String hql = "UPDATE RecipeBean SET quantity = :quantity WHERE productId = :productId AND materialsId = :materialsId";
		Session session = factory.getCurrentSession();
		
		session.createQuery(hql).setParameter("quantity", quantity)
				.setParameter("productId", productId)
				.setParameter("materialsId", materialsId).executeUpdate();
	}
	@Override
	public List<SalesOrderBean> getAllSalesOrders(){
		String hql = "FROM SalesOrderBean";
		Session session = null;
		List<SalesOrderBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	@Override
	public SalesOrderBean getSalesOrderById(Integer salesOrderId) {
		Session session = factory.getCurrentSession();
		SalesOrderBean salesOrder = session.get(SalesOrderBean.class, salesOrderId);
		return salesOrder;
	}
}
