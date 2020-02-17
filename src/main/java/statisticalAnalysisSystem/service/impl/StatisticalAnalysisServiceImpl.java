package statisticalAnalysisSystem.service.impl;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
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
		Double avgOneMaterailCost = 0.0;
		Double factor = dao.getQuantityPerUnit(materialsId);
		int count = 0;
		boolean flag = false;
		// 把二維資料裡的每一列取出，每一列代表一次進貨紀錄
		for (StorageHistoryBean shb : list) {
			// 如果這次進貨紀錄的時間在給定的時間範圍內，進入下一個判斷式
			if (sdf.parse(shb.getStockTime()).after(sdf.parse(startingDate))
					&& sdf.parse(shb.getStockTime()).before(sdf.parse(endDate))) {
				// 如果這個進貨紀錄所進的食材是指定編號的食材，執行以下程式
//				// if (shb.getMaterialsId() == materialsId) {
//				// 將該列中的食材進貨價格(unitCost)取出，加入其他時間，所進的一樣的貨的進貨價格
//				oneMaterialCost_box = oneMaterialCost_box + shb.getUnitPrice() / 3;
//				// 剛剛算的每箱進貨價格，轉換成每克、或每顆的進貨價格
//				Double factor = dao.getQuantityPerUnit(materialsId);
//				oneMaterialCost = oneMaterialCost_box / factor;
//				count++;
//				avgOneMaterailCost = oneMaterialCost / count;
//			} else {
//				System.out.println("------------------Service------------------");
//				System.out.println("起日" + startingDate + "迄日" + endDate);
//				System.out.println("該段時間編號" + materialsId + "之食材未進貨");
//				Double replacePrice = Math.random() * 4500;
//				avgOneMaterailCost = replacePrice;
				// if (shb.getMaterialsId() == materialsId) {
				// 將該列中的食材進貨價格(unitCost)取出，加入其他時間，所進的一樣的貨的進貨價格
				oneMaterialCost_box = oneMaterialCost_box + shb.getUnitPrice() / 3;
				// 剛剛算的每箱進貨價格，轉換成每克、或每顆的進貨價格
				oneMaterialCost = oneMaterialCost_box / factor;
				// } else {

				// }
				// 加總了幾次
				count++;
				avgOneMaterailCost = oneMaterialCost / count;

//				System.out.println("同一期間第" + count + "筆食材編號=" + shb.getMaterialsId());
//				System.out.println("同一期間第" + count + "筆每箱食材進貨價格(成本)=" + shb.getUnitPrice());
//				System.out.println("同一期間第" + count + "筆每箱累計食材進貨價格(成本) = " + oneMaterialCost_box);
//				System.out.println("同一期間第" + count + "筆每原始單位進貨價格 = " + oneMaterialCost);

			} else {
				Double replaceUnitPrice = Math.random() * 1500 / factor;
				avgOneMaterailCost = replaceUnitPrice;
//				System.out.println("起日" + startingDate + "到迄日" + endDate);
//				System.out.println("食材編號" + materialsId + "號之食材未進貨");
//				System.out.println("替代價格 = " + replaceUnitPrice + "元");
//				Double firstUnitPrice = 0.0;
//				for (StorageHistoryBean shbElse : list) {
//					firstUnitPrice = shbElse.getUnitPrice();
//					if (firstUnitPrice != null) {
//						flag = true;
//						break;
//					}
			}
//				oneMaterialCost_box = oneMaterialCost_box + firstUnitPrice;
//				Double factor = dao.getQuantityPerUnit(materialsId);
//				oneMaterialCost = oneMaterialCost_box / factor;
//				System.out.println("");
//				System.out.println("該時段內編號" + shb.getMaterialsId() + "食材未進貨");
//				System.out.println("取代價格：" + firstUnitPrice);
//				System.out.println("同一期間第" + count + "筆每箱累計食材進貨價格(成本) = " + oneMaterialCost_box);
//				System.out.println("同一期間第" + count + "筆每原始單位進貨價格 = " + oneMaterialCost);
//				if(flag) {
//					count = 1;
//					break;
//				}
		}
		return avgOneMaterailCost;
	}

	// 取得[一定期間][單一產品]之[產品成本]
	@Override
	public Double getUnitCost(Integer productId, String startingDate, String endDate) throws ParseException {
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
		Double unitCost = getUnitCost(productId, startingDate, endDate);
		Double GP = (unitPrice - unitCost) / unitPrice - 0.3;
//		System.out.println("產品銷貨價格unitPrice = " + unitPrice);
//		System.out.println("產品成本unitCost = " + unitCost);
//		System.out.println("GP = " + GP);
		return GP;
	}

	// For Line Chart:Date transfer
	@Override
	public HashMap<String, String> LineChartDateTransfer(String date) {
		// 取出前端日期(字串)
		// 若兩某時段，該產品原物料皆未被進貨，算出之兩比例會相等，折線圖會變成水平線
		// 以下計算第二時間點、第三時間點
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime endDate1 = LocalDateTime.parse(date + " 23:59:59", formatter);
		LocalDateTime endDate2 = endDate1.plusMonths(1);
		LocalDateTime endDate3 = endDate2.plusMonths(1);
		LocalDateTime endDate4 = endDate3.plusMonths(1);
		LocalDateTime endDate5 = endDate4.plusMonths(1);
		LocalDateTime startDate1 = endDate1.minusMonths(3).minusDays(1).plusSeconds(1);
		LocalDateTime startDate2 = startDate1.plusMonths(1);
		LocalDateTime startDate3 = startDate2.plusMonths(1);
		LocalDateTime startDate4 = startDate3.plusMonths(1);
		LocalDateTime startDate5 = startDate4.plusMonths(1);

		String startDate1_str = startDate1.format(formatter);
		String startDate2_str = startDate2.format(formatter);
		String startDate3_str = startDate3.format(formatter);
		String startDate4_str = startDate4.format(formatter);
		String startDate5_str = startDate5.format(formatter);
		String endDate1_str = endDate1.format(formatter);
		String endDate2_str = endDate2.format(formatter);
		String endDate3_str = endDate3.format(formatter);
		String endDate4_str = endDate4.format(formatter);
		String endDate5_str = endDate5.format(formatter);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startDate1_str", startDate1_str);
		map.put("startDate2_str", startDate2_str);
		map.put("startDate3_str", startDate3_str);
		map.put("startDate4_str", startDate4_str);
		map.put("startDate5_str", startDate5_str);
		map.put("endDate1_str", endDate1_str);
		map.put("endDate2_str", endDate2_str);
		map.put("endDate3_str", endDate3_str);
		map.put("endDate4_str", endDate4_str);
		map.put("endDate5_str", endDate5_str);

		return map;
	}

	// 將小數點四位的毛利率改成小數點兩位的毛利率
	@Override
	public HashMap<String, Double> GP4DicimalTo2(Double gp1, Double gp2, Double gp3, Double gp4, Double gp5) {
		DecimalFormat df = new DecimalFormat("######0.00");
		String oneProductGp1_0000_string = df.format(gp1);
		String oneProductGp2_0000_string = df.format(gp2);
		String oneProductGp3_0000_string = df.format(gp3);
		String oneProductGp4_0000_string = df.format(gp4);
		String oneProductGp5_0000_string = df.format(gp5);
		Double oneProductGp1_00 = Double.parseDouble(oneProductGp1_0000_string);
		Double oneProductGp2_00 = Double.parseDouble(oneProductGp2_0000_string);
		Double oneProductGp3_00 = Double.parseDouble(oneProductGp3_0000_string);
		Double oneProductGp4_00 = Double.parseDouble(oneProductGp4_0000_string);
		Double oneProductGp5_00 = Double.parseDouble(oneProductGp5_0000_string);

		HashMap<String, Double> map = new HashMap<String, Double>();

		map.put("oneProductGp1_00", oneProductGp1_00);
		map.put("oneProductGp2_00", oneProductGp2_00);
		map.put("oneProductGp3_00", oneProductGp3_00);
		map.put("oneProductGp4_00", oneProductGp4_00);
		map.put("oneProductGp5_00", oneProductGp5_00);

		return map;
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

	// 存貨周轉率---[一定期間][當期總成本/((期初存貨+期末存貨)/2)]---From MaterialsBean
	// ------------------------平均存貨------------------------
	// 第一步：先選定期間
	// 第二步：找出初始進貨量
	// 第三步：初始進貨量+(銷貨-進貨)，一路加到指定起日==>當期期初存貨
	// 第四步：當期期初存貨+(銷貨-進貨)，一路加到指定迄日==>當期期末存貨
	// ------------------------銷貨成本-------------------------
	// 第五步：訂單明細---訂購商品
	// 第X步：訂購商品---Recipe---Materials---(無法追溯進貨)---下列替代方案
	// 第六步：使用兩月平均單位成本---每個食材依食譜依被訂購產品加總
	// 第七步：兩個相除
	// 第八步：找三個年度比較
	// -------------------------問題點------------------------------
	// 無法追溯銷貨來源---找同期成本替代
	// 有進貨紀錄，無銷貨紀錄---找銷貨*(1-GP)來替代
	@Override
	public Double invTurnover(String startingDate, String endDate) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		List<StorageHistoryBean> list = dao.getStorageHistoryBeanList();
		List<SalesOrderBean> list2 = dao.getSalesOrderBeanList();
		Double costOnCertainTime = 0.0;
		Double costOnCertainTime2 = 0.0;
		Double salesOnCertainTime = 0.0;
		Double salesOnCertainTime2 = 0.0;
		Double openingInv = 0.0;
		Double endingInv = 0.0;
		Double COGSByProductIdUnderSalesOrder = 0.0;
		Double COGSBySalesOrderId = 0.0;
		Double COGSAll = 0.0;
		// 第一步~第四步
		try {
			for (StorageHistoryBean shb : list) {
				if (sdf.parse(shb.getStockTime()).before(sdf.parse(startingDate))) {
					costOnCertainTime = costOnCertainTime + shb.getUnitPrice();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			for (SalesOrderBean sob : list2) {
				if (sdf.parse(sob.getOrderTime()).before(sdf.parse(startingDate))) {
					salesOnCertainTime = salesOnCertainTime + sob.getTotalSales()*0.5;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		openingInv = costOnCertainTime - salesOnCertainTime;

		try {
			for (StorageHistoryBean shb : list) {
				if (sdf.parse(shb.getStockTime()).after(sdf.parse(startingDate))
						&& sdf.parse(shb.getStockTime()).before(sdf.parse(endDate))) {
					costOnCertainTime2 = costOnCertainTime2 + shb.getUnitPrice();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			for (SalesOrderBean sob : list2) {
				if (sdf.parse(sob.getOrderTime()).after(sdf.parse(startingDate))
						&& sdf.parse(sob.getOrderTime()).before(sdf.parse(endDate))) {
					salesOnCertainTime2 = salesOnCertainTime2 + sob.getTotalSales();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		endingInv = salesOnCertainTime2 - salesOnCertainTime2 + openingInv;

		// 問題點替代方案
		try {
			for (SalesOrderBean sob : list2) {
				if (sdf.parse(sob.getOrderTime()).after(sdf.parse(startingDate))
						&& sdf.parse(sob.getOrderTime()).before(sdf.parse(endDate))) {
					List<SalesOrderDetailBean> detailList = sob.getSalesOrderDetails();
					for (SalesOrderDetailBean sodb : detailList) {
						Double gpByProduct = getOneProductGp(sodb.getProductId(), startingDate, endDate);
						Integer quantityByProduct = sodb.getQuantity();
						// 某一個訂單下單一產品的成本
						COGSByProductIdUnderSalesOrder = quantityByProduct * (1 - gpByProduct);
						COGSBySalesOrderId = COGSBySalesOrderId + COGSByProductIdUnderSalesOrder;
					}
					COGSAll = COGSAll + COGSBySalesOrderId;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Double invTurnover = COGSAll / ((openingInv + endingInv) / 2);
		System.out.println("openingInv = " + openingInv + ", endingInv = " + endingInv);
		System.out.println("COGSAll = " + COGSAll);
		return invTurnover*100;
	}
}