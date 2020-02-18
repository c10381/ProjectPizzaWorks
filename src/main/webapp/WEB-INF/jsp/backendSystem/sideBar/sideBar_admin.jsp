<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- frontEnd System -->
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon far fas fa-store"></i>
		<p>
			前台系統管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview">
		<li class="nav-item"
			onclick="loadingPage('/memberSystem/allCustomer')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢會員資料</p>
			</div></li>
		<li class="nav-item" onclick="loadingPage('/shop/redirectWebInfo')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>前台資訊修改</p>
			</div></li>
	</ul></li>
<!-- /frontEnd System -->

<!-- MemberSystem -->
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon far fa-id-badge"></i>
		<p>
			員工系統 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview">
		<li class="nav-item"
			onclick="loadingPage('/memberSystem/memberRegister')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>新進員工註冊</p>
			</div></li>
		<li class="nav-item" onclick="loadingPage('/memberSystem/allMember')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>員工資料</p>
			</div></li>
		<li class="nav-item"
			onclick="loadingPage('/memberSystem/searchCoworkerPWRequest')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>忘記密碼確認</p>
			</div></li>
	</ul></li>
<!-- /MemberSystem -->

<!-- ShopManageSystem -->
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-pizza-slice"></i>
		<p>
			商品管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview">
		<li class="nav-item"
			onclick="loadingPage('/shopManageSystem/products')">
			<div class="nav-link">
				<i class="far fa-circle nav-icon "></i>
				<p>檢視產品</p>
			</div>
		</li>

		<li class="nav-item"
			onclick="loadingPage('/shopManageSystem/AddNewProduct')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>新增產品</p>
			</div></li>
	</ul></li>
<!-- /ShopManageSystem -->

<!-- PurchaseSystem -->
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-shopping-basket"></i>
		<p>
			採購管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>
	<ul class="nav nav-treeview" style="display: none;">
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

<!-- SalesSystem -->
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-user-tie"></i>
		<p>
			銷售管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>

	<ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item has-treeview"
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
<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-cubes"></i>
		<p>
			庫存管理 <i class="fas fa-angle-left right"></i>
		</p>
	</div>

	<ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item has-treeview"
			onclick="loadingPage('${request.contextPath}/stock/viewStorageHistory')">
			<div class="nav-link">
				<i class="far fa-circle nav-icon "></i>
				<p>檢視庫存歷史</p>
			</div>
		</li>
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
		<li class="nav-item has-treeview"
			onclick="loadingPage('/shopManageSystem/GetAllSalesList')"><div
				class="nav-link">
				<i class="far fa-circle nav-icon"></i>
				<p>查詢銷貨單</p>
			</div></li>
	</ul></li>
<!-- /StockSystem -->

<!-- customerService -->

<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-microphone"></i>
		<p>客服系統<i class="fas fa-angle-left right"></i></p>
	</div>
	<ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item" onclick="loadingPage('/messageSystem/CustomerRespondSystem')"><div
				class="nav-link">
				<i class="nav-icon fas fa-tablet"></i>
				<p>客戶回饋表</p>
			</div></li>
	</ul>
</li> 

<!-- /customerService -->
<!-- MailService -->
<li class="nav-item has-treeview"
	onclick="floatPage('/messageSystem/MailSystem','50%','auto')"><div
		class="nav-link">
		<i class="nav-icon far fa-envelope"></i>
		<p>信件系統</p>
	</div></li>
<!-- /MailService -->
<!-- Analysis -->

<li class="nav-item has-treeview"><div class="nav-link">
		<i class="nav-icon fas fa-diagnoses"></i>
		<p>數據分析<i class="fas fa-angle-left right"></i></p>
	</div>
	<ul class="nav nav-treeview" style="display: none;">
		<li class="nav-item" onclick="loadingPage('/PieChartTest')"><div
				class="nav-link">
				<i class="nav-icon fas fa-chart-line"></i>
				<p>產品毛利率趨勢</p>
			</div></li>
		<li class="nav-item" onclick="loadingPage('/toInvturnover')"><div
			class="nav-link">
			<i class="nav-icon fas fa-chart-line"></i>
			<p>存貨周轉率趨勢</p>
		</div></li>
		<li class="nav-item" onclick="loadingPage('/toPieChart')"><div
				class="nav-link">
				<i class="nav-icon fas fa-chart-pie"></i>
				<p>產品銷售額佔比</p>
			</div></li>
		<li class="nav-item" onclick="loadingPage('/toHistogram')"><div
				class="nav-link">
				<i class="nav-icon fas fa-chart-bar"></i>
				<p>產品銷售額比較</p>
			</div></li>
	</ul>
</li> 


<!-- /Analysis -->
<li class="nav-header"
	style="margin: 0; padding: 0px; text-align: center; font-size: 25px; line-height: 1.5">Admin</li>
