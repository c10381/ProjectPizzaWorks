<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

				<!-- privilegeId=6 -->
		
				<!-- customerService -->
				<li class="nav-item has-treeview menu-open" onclick="loadingPage('/customerService')"><div class="nav-link">
						<i class="nav-icon fas fa-microphone"></i>
						<p>
							客服系統
						</p>
					</div>
					<ul class="nav nav-treeview">
						<li class="nav-item"
							onclick="floatPage('/messageSystem/CustomerReport')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>客服報告書</p>
							</div>
						</li>
						<li class="nav-item"
							onclick="floatPage('/messageSystem/CustomerRespondSystem')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>客戶回饋表</p>
							</div>
						</li>
						
					</ul>
				</li>
				<!-- /customerService -->
				
				<!-- MailService -->
				<li class="nav-item has-treeview menu-open" onclick="floatPage('/messageSystem/MailSystem')"><div class="nav-link">
						<i class="nav-icon far fa-envelope"></i>
						<p>
							信件系統
						</p>
					</div>
				</li>
				<!-- /MailService -->

				<!-- ProductSystem -->
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
								<p>檢視產品</p>
							</div>
						</li>

					</ul></li>
				<!-- /ProductSystem -->

				
				<!-- SalesSystem (三層結構)-->
				<li class="nav-item has-treeview menu-open"><div class="nav-link">
						<i class="nav-icon fas fa-user-tie"></i>
						<p>
							銷售管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>

					<ul class="nav nav-treeview" style="display: block;">



						<li class="nav-item has-treeview menu-open">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									訂貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: block;">
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>訂貨單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢訂貨單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>訂貨單狀況修改</p>
									</div></li>
							</ul>
						</li>
						
						<li class="nav-item has-treeview menu-open">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									銷貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: block;">
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>銷貨單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢銷貨單</p>
									</div></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- /SalesSystem -->

				
				<!-- Analysis -->
				<li class="nav-item has-treeview" onclick="loadingPage('')"><div class="nav-link">
						<i class="nav-icon far fa-chart-bar"></i>
						<p>
							數據分析
						</p>
					</div>
				</li>
				<!-- /Analysis -->
				<li class="nav-header" style="margin:0;padding: 0px; text-align: center; font-size: 25px;line-height: 1.5">customerService</li>
				