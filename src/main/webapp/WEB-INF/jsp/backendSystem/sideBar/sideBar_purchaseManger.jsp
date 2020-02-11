<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- privilegeId=4 -->


<!-- PurchaseSystem -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
		<i class="nav-icon fas fa-shopping-basket"></i>
		<p>
			採購管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview" style="display: block;">
		<li class="nav-item"
			onclick="loadingPage('/purchase/GetAllPurchaseRequest')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢請購單</p>
			</div></li>
		<li class="nav-item"
			onclick="loadingPage('/purchase/GetAllPurchaseOrder')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢採購單</p>
			</div></li>
	</ul></li>
<!-- /PurchaseSystem -->

<!-- StockSystem -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
		<i class="nav-icon fas fa-cubes"></i>
		<p>
			庫存管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview" style="display: block;">
		
		<li class="nav-item has-treeview"
			onclick="loadingPage('${request.contextPath}/purchase/GetAllMaterials')">
			<div class="nav-link">
				<i class="far fa-circle nav-icon "></i>
				<p>檢視存貨</p>
			</div>
		</li>
		<li class="nav-item  has-treeview"
			onclick="loadingPage('/stock/GetAllStockRequest')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢進貨單</p>
			</div></li>
		
	</ul></li>
<!-- /StockSystem -->

<!-- Analysis -->
<li class="nav-item has-treeview menu-open" onclick="loadingPage('/PieChartTest')"><div
		class="nav-link">
		<i class="nav-icon far fa-chart-bar"></i>
		<p>數據分析</p>
	</div></li>
<!-- /Analysis -->
<li class="nav-header"
	style="margin: 0; padding: 0px; text-align: center; font-size: 25px; line-height: 1.5">PurchaseManager</li>
