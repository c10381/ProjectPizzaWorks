<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- privilegeId=2 -->

<!-- frontEnd System -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
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

<!-- ShopManageSystem -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
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
				<p>檢視並修改產品</p>
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

<!-- MailService -->
<li class="nav-item has-treeview menu-open"
	onclick="floatPage('/messageSystem/MailSystem')"><div
		class="nav-link">
		<i class="nav-icon far fa-envelope"></i>
		<p>信件系統</p>
	</div></li>
<!-- /MailService -->

<li class="nav-header"
	style="margin: 0; padding: 0px; text-align: center; font-size: 25px; line-height: 1.5">WebAdmin</li>
