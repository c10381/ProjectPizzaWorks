package statisticalAnalysisSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import _model.RecipeBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import _model.StorageHistoryBean;

public interface StatisticalAnalysisDao {

	void setDao(SessionFactory factory);
	
	List<RecipeBean> getOneRecipeById(Integer productId);
	//取得單一食材進貨價格(依據食材ID)from SuppliersProvision
	Double getOneMaterialUnitPrice(Integer materialsId);
	//取得一箱有多少量(依據食材ID)
	Double getQuantityPerUnit(Integer materialsId);
	
	Integer insertSalesOrder(SalesOrderBean salesOrder);

	void insertSalesOrderDetail(SalesOrderDetailBean salesOrderDetail);
	// 取得單一食材storageHistoryBeanList(依據食材ID)
	List<StorageHistoryBean> getMaterialUnitCost_SHB(Integer materialsId);

}