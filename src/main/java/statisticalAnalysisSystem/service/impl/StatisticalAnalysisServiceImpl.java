package statisticalAnalysisSystem.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.PurchaseRequestBean;
import _model.PurchaseRequestDetailBean;
import _model.RecipeBean;
import _model.SalesOrderBean;
import _model.SalesOrderDetailBean;
import _model.StorageHistoryBean;
import purchaseSystem.dao.PurchaseDao;
import shopManageSystem.dao.ProductDao;
import statisticalAnalysisSystem.dao.StatisticalAnalysisDao;
import statisticalAnalysisSystem.service.StatisticalAnalysisService;

@Service
@Transactional
public class StatisticalAnalysisServiceImpl implements StatisticalAnalysisService {

	ProductDao pdao;

	@Override
	@Autowired
	public void setpDao(ProductDao pdao) {
		this.pdao = pdao;
	}

	PurchaseDao prdao;

	@Override
	@Autowired
	public void setprdao(PurchaseDao prdao) {
		this.prdao = prdao;
	}

	StatisticalAnalysisDao dao;

	@Override
	@Autowired
	public void setDao(StatisticalAnalysisDao dao) {
		this.dao = dao;
	}

	// 取得[一定期間][單一產品]之[銷售額]
	@Override
	public Double getOneProductSales(Integer productId, String startingDate, String endDate) throws ParseException {
		List<SalesOrderBean> list = pdao.getAllSalesOrders();
		Double oneProductSales = 0.0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for (SalesOrderBean sob : list) {
			if (sdf.parse(sob.getOrderTime()).after(sdf.parse(startingDate))
					&& sdf.parse(sob.getOrderTime()).before(sdf.parse(endDate))) {
				List<SalesOrderDetailBean> list2 = sob.getSalesOrderDetails();
				for (SalesOrderDetailBean sodb : list2) {
					if (sodb.getProductId() == productId) {
						oneProductSales = oneProductSales + sodb.getUnitPrice() * sodb.getQuantity();
					}
				}
			}
		}
		return oneProductSales;
	}

	// 取得[一定期間][所有產品]之[銷售額]
	@Override
	public Double getAllProductSales(String startingDate, String endDate) throws ParseException {
		List<SalesOrderBean> list = pdao.getAllSalesOrders();
		Double allProductSales = 0.0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		for (SalesOrderBean sob : list) {
			if (sdf.parse(sob.getOrderTime()).after(sdf.parse(startingDate))
					&& sdf.parse(sob.getOrderTime()).before(sdf.parse(endDate))) {
				Integer oneProductSales = sob.getTotalSales();
				allProductSales = allProductSales + oneProductSales;
			}
		}
		return allProductSales;
	}

	// 取得[一定期間][單一產品]對[所有產品]之[銷售額比例]
	@Override
	public Double getOneProductSalesShare(Integer productId, String startingDate, String endDate)
			throws ParseException {
		Double OneProductSalesShare = getOneProductSales(productId, startingDate, endDate)
				/ getAllProductSales(startingDate, endDate);
		return OneProductSalesShare;
	}

	// 取得[一定期間][單一原料]之[進貨成本](form purchaseRequest)(已棄用)
	@Override
	public Double getOneMaterialCost(Integer materialsId) throws ParseException {
		List<PurchaseRequestBean> list = prdao.getAllPurchaseRequest();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Double oneMaterialCost = null;
		for (PurchaseRequestBean prb : list) {
			if (sdf.parse(prb.getRequestTime()).after(sdf.parse("2020-02-01 00:00:00"))
					&& sdf.parse(prb.getRequestTime()).before(sdf.parse("2020-02-05 00:00:00"))
					&& prb.getRequestStatus() == 3) {
				List<PurchaseRequestDetailBean> list2 = prb.getPurchaseRequestDetails();
				for (PurchaseRequestDetailBean prdb : list2) {
					if (prdb.getMaterialsId() == materialsId) {
						oneMaterialCost = oneMaterialCost + prdb.getUnitPrice() * prdb.getQuantity();
					}
				}
			}
		}
		return oneMaterialCost;
	}

	// 取得[一定期間][單一原料][平均進貨成本](依據食材ID)(from storageHistory)
	private Double getOneMaterialCost_SHB(Integer materialsId, String startingDate, String endDate)
			throws ParseException {
		// 從StorageHistory裡取出二維資料
		List<StorageHistoryBean> list = dao.getMaterialUnitCost_SHB(materialsId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Double oneMaterialCost_box = 0.0;
		Double oneMaterialCost = 0.0;
		int count = 0;
		boolean flag = false;
		// 把二維資料裡的每一列取出，每一列代表一次進貨紀錄
		for (StorageHistoryBean shb : list) {
			// 如果這次進貨紀錄的時間在給定的時間範圍內，進入下一個判斷式
			if (sdf.parse(shb.getStockTime()).after(sdf.parse(startingDate))
					&& sdf.parse(shb.getStockTime()).before(sdf.parse(endDate))) {
				// 如果這個進貨紀錄所進的食材是指定編號的食材，執行以下程式
				//if (shb.getMaterialsId() == materialsId) {
					// 將該列中的食材進貨價格(unitCost)取出，加入其他時間，所進的一樣的貨的進貨價格
					oneMaterialCost_box = oneMaterialCost_box + shb.getUnitPrice();
					// 剛剛算的每箱進貨價格，轉換成每克、或每顆的進貨價格
					Double factor = dao.getQuantityPerUnit(materialsId);
					oneMaterialCost = oneMaterialCost_box / factor;
				//} else {
					System.out.println("out of if");
				//}
				// 加總了幾次
				count++;
				System.out.println("同一期間第" + count + "筆食材編號=" + shb.getMaterialsId());
				System.out.println("同一期間第" + count + "筆每箱食材進貨價格(成本)=" + shb.getUnitPrice());
				System.out.println("同一期間第" + count + "筆每箱累計食材進貨價格(成本) = " + oneMaterialCost_box);
				System.out.println("同一期間第" + count + "筆每原始單位進貨價格 = " + oneMaterialCost);
			} else {
				Double firstUnitPrice = 0.0;
				for (StorageHistoryBean shbElse : list) {
					firstUnitPrice = shbElse.getUnitPrice();
					if (firstUnitPrice != null) {
						flag = true;
						break;
					}
				}
				
				oneMaterialCost_box = oneMaterialCost_box + firstUnitPrice;
				Double factor = dao.getQuantityPerUnit(materialsId);
				oneMaterialCost = oneMaterialCost_box / factor;
				System.out.println("");
				System.out.println("該時段內編號" + shb.getMaterialsId() + "食材未進貨");
				System.out.println("取代價格：" + firstUnitPrice);
				System.out.println("同一期間第" + count + "筆每箱累計食材進貨價格(成本) = " + oneMaterialCost_box);
				System.out.println("同一期間第" + count + "筆每原始單位進貨價格 = " + oneMaterialCost);
				if(flag) {
					count = 1;
					break;
				}
			}
		}
		// 把一定期間單一食材的加總的進貨價格，除上加總次數，算出平均食材成本
		Double avgOneMaterailCost = oneMaterialCost / count;
		System.out.println("平均成本 = " + avgOneMaterailCost);
		return avgOneMaterailCost;
	}

	// 取得[一定期間][單一產品]之[產品成本]
	private Double getUnitCost(Integer productId, String startingDate, String endDate) throws ParseException {
		List<RecipeBean> list = dao.getOneRecipeById(productId);
		Double unitCost = 0.0;
		int count = 0;
		for (RecipeBean rb : list) {
			Double q = rb.getQuantity();
			Double p = getOneMaterialCost_SHB(rb.getMaterial().getMaterialsId(), startingDate, endDate);
//			System.out.println("matrial_Id = " + rb.getMaterial().getMaterialsId());
//			System.out.println("matrial_q = " + q);
//			System.out.println("matrial_p = " + p);
			unitCost = unitCost + p * q;
			count++;
//			System.out.println("第" + count + "次UnitCost" + unitCost);
		}
		return unitCost;
	}

	// 取得[一定期間][單一產品]之[售價]
	// 取得[一定期間][單一產品]之[毛利率]
	@Override
	public Double getOneProductGp(Integer productId, String startingDate, String endDate) throws ParseException {
		Integer unitPrice = pdao.getProductById(productId).getUnitPrice();
		System.out.println("產品銷貨價格unitPrice = " + unitPrice);
		Double unitCost = getUnitCost(productId, startingDate, endDate);
		System.out.println("產品成本unitCost = " + unitCost);
		Double GP = (unitPrice - unitCost) / unitPrice;
		System.out.println("GP = " + GP);
		return GP;
	}

	@Override
	public void addFakeSalesOrder(SalesOrderBean salesOrder) {
		List<SalesOrderDetailBean> salesOrderDetails = salesOrder.getSalesOrderDetails();
		Integer salesOrderId = dao.insertSalesOrder(salesOrder);
		for (SalesOrderDetailBean salesOrderDetail : salesOrderDetails) {
			salesOrderDetail.setSalesOrderId(salesOrderId);
			dao.insertSalesOrderDetail(salesOrderDetail);
		}
	}
}
