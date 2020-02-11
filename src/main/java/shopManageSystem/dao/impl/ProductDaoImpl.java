package shopManageSystem.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import _model.CrustBean;
import _model.MaterialsBean;
import _model.MaterialsUnitBean;
import _model.MembersBean;
import _model.ProductBean;
import _model.RecipeBean;
import _model.SalesListBean;
import _model.SalesListDetailBean;
import _model.SalesOrderBean;
import _model.StorageHistoryBean;
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
	public List<ProductBean> getAllActiveProducts(){
		String hql = "FROM ProductBean WHERE activeStatus = 1";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public void updateOneProduct(ProductBean pb) {
		Session session = null;
		session = factory.getCurrentSession();
		ProductBean originalProduct = session.get(ProductBean.class, pb.getProductId());
		if (pb.getProductName() != null) {
			if (!pb.getProductName().equals("")) {
				originalProduct.setProductName(pb.getProductName());
			}
		}
		if (pb.getBriefInfo() != null) {
			if (!pb.getBriefInfo().equals("")) {
				originalProduct.setBriefInfo(pb.getBriefInfo());
			}
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
			if (!pb.getImagePath().equals("")) {
				originalProduct.setImagePath(pb.getImagePath());
			}
		}
		if (pb.getCoverImage() != null) {
			originalProduct.setCoverImage(pb.getCoverImage());
		}
	}

	@Override
	public void updateOneSalesOrder(SalesOrderBean salesOrder) {
		Session session = factory.getCurrentSession();
		SalesOrderBean original_salesOrder = session.get(SalesOrderBean.class, salesOrder.getSalesOrderId());
		if (salesOrder.getMemberId() != null) {
			original_salesOrder.setMemberId(salesOrder.getMemberId());
		}
		if (salesOrder.getOrderTime() != null) {
			if (!salesOrder.getOrderTime().equals("")) {
				original_salesOrder.setOrderTime(salesOrder.getOrderTime());
			}
		}
		if (salesOrder.getRequireTime() != null) {
			if (!salesOrder.getRequireTime().equals("")) {
				original_salesOrder.setRequireTime(salesOrder.getRequireTime());
			}
		}
		if (salesOrder.getNeedDelivery() != null) {
			original_salesOrder.setNeedDelivery(salesOrder.getNeedDelivery());
		}
		if (salesOrder.getDeliverAddress() != null) {
			if (!salesOrder.getDeliverAddress().equals("")) {
				original_salesOrder.setDeliverAddress(salesOrder.getDeliverAddress());
			}
		}
		if (salesOrder.getTotalSales() != null) {
			original_salesOrder.setTotalSales(salesOrder.getTotalSales());
		}
		if (salesOrder.getOrderStatus() != null) {
			original_salesOrder.setOrderStatus(salesOrder.getOrderStatus());
		}
		if (salesOrder.getNote() != null) {
			if (!salesOrder.getNote().equals("")) {
				original_salesOrder.setNote(salesOrder.getNote());
			}
		}
		if (salesOrder.getSalesOrderDetails() != null) {
			original_salesOrder.setSalesOrderDetails(salesOrder.getSalesOrderDetails());
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
				.setParameter("productId", recipe.getProductId())
				.setParameter("materialsId", recipe.getMaterialsId()).executeUpdate();
	}

	@Override
	public void updateOneRecipeJson(Double quantity, Integer productId, Integer materialsId) {
		String hql = "UPDATE RecipeBean SET quantity = :quantity WHERE productId = :productId AND materialsId = :materialsId";
		Session session = factory.getCurrentSession();

		session.createQuery(hql).setParameter("quantity", quantity).setParameter("productId", productId)
				.setParameter("materialsId", materialsId).executeUpdate();
	}

	@Override
	public List<SalesOrderBean> getAllSalesOrders() {
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

	@Override
	public List<MaterialsBean> getAllMaterials() {
		String hql = "FROM MaterialsBean";
		Session session = factory.getCurrentSession();
		List<MaterialsBean> materials = session.createQuery(hql).getResultList();
		return materials;
	}

	@Override
	public ProductBean InsertProduct(ProductBean product) {
		Session session = factory.getCurrentSession();
//		String hql = "FROM ProductBean WHERE productName = :productName";
		product.setProductId((int) session.save(product));
		return product;
	}

	@Override
	public void InsertRecipes(List<RecipeBean> recipes) {
		Session session = factory.getCurrentSession();
		String sql = "INSERT INTO Recipe (productId, materialsId, quantity, unit) VALUES (?, ? , ?, ?)";

		for (RecipeBean recipe : recipes) {
			session.createNativeQuery(sql).setParameter(1, recipe.getProductId())
					.setParameter(2, recipe.getMaterialsId()).setParameter(3, recipe.getQuantity())
					.setParameter(4, recipe.getUnit()).executeUpdate();
		}
	}

	@Override
	public void InsertRecipe(RecipeBean recipe) {
		Session session = factory.getCurrentSession();
		session.save(recipe);
	}

	@Override
	public List<CrustBean> getCrustByTypeId(Integer crustTypeId) {
		String hql = "FROM CrustBean WHERE crustTypeId = :crustTypeId";
		Session session = factory.getCurrentSession();
		List<CrustBean> crusts = session.createQuery(hql).setParameter("crustTypeId", crustTypeId).getResultList();
		return crusts;
	}
	
	@Override
	public void updateProductStatus(ProductBean product) {
		Session session = factory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, product.getProductId());
		pb.setActiveStatus(product.getActiveStatus());
	}
	
	@Override
	public void updateSalesOrderStatus(SalesOrderBean salesOrder) {
		Session session = factory.getCurrentSession();
		SalesOrderBean sob = session.get(SalesOrderBean.class, salesOrder.getSalesOrderId());
		sob.setOrderStatus(salesOrder.getOrderStatus());
	}

	@Override
	public MaterialsUnitBean getMaterialsUnitByMId(Integer materialsId) {
		String hql = "FROM MaterialsUnitBean WHERE materialsId = :materialsId";
		Session session = factory.getCurrentSession();
		MaterialsUnitBean materialsUnit = null;
		
		try{
			materialsUnit = (MaterialsUnitBean) session.createQuery(hql).setParameter("materialsId", materialsId).getSingleResult();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return materialsUnit;
	}

	@Override
	public Integer InsertSalesList(SalesListBean salesList) {
		Session session = factory.getCurrentSession();
		Integer salesListId = (Integer) session.save(salesList);
		return salesListId;
	}

	@Override
	public void InsertSalesListDetail(SalesListDetailBean salesListDetail) {
		Session session = factory.getCurrentSession();
		session.save(salesListDetail);
	}

	@Override
	public void updateMaterialBySalesList(SalesListDetailBean salesListDetail) {
		Session session = factory.getCurrentSession();
		MaterialsBean material = session.get(MaterialsBean.class, salesListDetail.getMaterialsId());
		Double original_quantity = material.getQuantity();
		material.setQuantity(original_quantity-salesListDetail.getQuantity());
	}

	@Override
	public MembersBean getMemberById(Integer membersId) {
		Session session = factory.getCurrentSession();
		MembersBean member = session.get(MembersBean.class, membersId);
		return member;
	}

	@Override
	public void updateStorageHistoryBySalesList(SalesListDetailBean salesListDetail) {
		String hql = "FROM StorageHistoryBean WHERE materialsId = :materialsId AND remainingQuantity != 0";
		Session session = factory.getCurrentSession();
		List<StorageHistoryBean> storageHistorys = session.createQuery(hql).setParameter("materialsId", salesListDetail.getMaterialsId()).getResultList();
		double quantity_cost = salesListDetail.getQuantity();
		for(StorageHistoryBean storageHistory:storageHistorys) {
			double quantity_remaining = storageHistory.getRemainingQuantity();
			if(storageHistory.getRemainingQuantity()>=quantity_cost) {
				storageHistory.setRemainingQuantity(quantity_remaining-quantity_cost);
				break;
			} else {
				quantity_cost -= quantity_remaining;
				storageHistory.setRemainingQuantity(0);
			}
		}
	}
	
	@Override
	public MaterialsBean getOneMaterialsById(Integer materialId) {
		Session session = factory.getCurrentSession();
		MaterialsBean mb = session.get(MaterialsBean.class, materialId);
		return mb;
	}

	@Override
	public List<SalesListBean> getAllSalesLists() {
		Session session = factory.getCurrentSession();
		String hql = "FROM SalesListBean";
		List<SalesListBean> salesLists = session.createQuery(hql).getResultList();
		return salesLists;
	}

	@Override
	public SalesListBean getSalesListById(Integer salesListId) {
		Session session = factory.getCurrentSession();
		SalesListBean salesList = session.get(SalesListBean.class, salesListId);
		return salesList;
	}
}
