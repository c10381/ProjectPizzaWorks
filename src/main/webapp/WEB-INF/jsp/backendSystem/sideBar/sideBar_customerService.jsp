<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- privilegeId=6 -->

<!-- customerService -->
<li class="nav-item has-treeview menu-open"><div class="nav-link">
		<i class="nav-icon fas fa-microphone"></i>
		<p>客服系統</p>
	</div>
	<ul class="nav nav-treeview">
		<li class="nav-item"
			onclick="floatPage('/messageSystem/MailSystem','50%','auto')"><div
				class="nav-link">
				<i class="nav-icon far fa-envelope"></i>
				<p>信件系統</p>
			</div></li>
		<li class="nav-item" onclick="floatPage('/messageSystem/CustomerRespondSystem','70%','90vh')"><div
				class="nav-link">
				<i class="nav-icon fas fa-tablet"></i>
				<p>客戶回饋表</p>
			</div></li>
		<li class="nav-item" onclick="floatPage('/messageSystem/GetAllSalesOrder','70%','90vh')"><div
				class="nav-link">
				<i class="nav-icon fas fa-receipt"></i>
				<p>查詢訂貨單</p>
			</div></li>
	</ul>

</li>



<!-- Analysis -->
<!-- <li class="nav-item has-treeview" onclick="loadingPage('')"><div
		class="nav-link">
		<i class="nav-icon far fa-chart-bar"></i>
		<p>數據分析</p>
	</div></li> -->
<!-- /Analysis -->
<li class="nav-header"
	style="margin: 0; padding: 0px; text-align: center; font-size: 25px; line-height: 1.5">CustomerService</li>

