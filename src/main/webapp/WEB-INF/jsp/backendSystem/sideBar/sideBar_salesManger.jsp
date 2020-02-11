<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- privilegeId=3 -->

<!-- SalesSystem -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
		<i class="nav-icon fas fa-user-tie"></i>
		<p>
			銷售管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>

	<ul class="nav nav-treeview" style="display: block;">
		<li class="nav-item has-treeview "
			onclick="loadingPage('${request.contextPath}/purchase/AddPurchaseRequest')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>新增請購單</p>
			</div></li>
		<li class="nav-item has-treeview"
			onclick="loadingPage('/purchase/GetAllPurchaseRequest')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢請購單</p>
			</div></li>

		<li class="nav-item has-treeview"
			onclick="loadingPage('/shopManageSystem/GetAllSalesOrder')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢訂貨單</p>
			</div></li>


	</ul></li>
<!-- /SalesSystem -->

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
		<li class="nav-item has-treeview"
			onclick="loadingPage('/shopManageSystem/GetAllSalesList')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢銷貨單</p>
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
	style="margin: 0; padding: 0px; text-align: center; font-size: 25px; line-height: 1.5">salesManager</li>
