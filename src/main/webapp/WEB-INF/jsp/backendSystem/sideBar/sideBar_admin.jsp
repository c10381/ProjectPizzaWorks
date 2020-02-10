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
						<li class="nav-item" onclick="loadingPage('/memberSystem/allCustomer')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>查詢會員資料</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>前台資訊修改</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('/PieChartTest')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>測試統計圖表顯示</p>
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
						<li class="nav-item" onclick="loadingPage('/memberSystem/memberRegister')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>新進員工註冊</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('/memberSystem/allMember')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>員工管理</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('/memberSystem/searchCoworkerPWRequest')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>忘記密碼確認</p>
							</div></li>
					</ul></li>
				<!-- /MemberSystem -->

				<!-- ProductSystem -->
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

						<li class="nav-item" onclick="loadingPage('/shopManageSystem/AddNewProduct')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>新增產品</p>
							</div></li>
					</ul></li>
				<!-- /ProductSystem -->

				<!-- PurchaseSystem (三層結構)-->
				<li class="nav-item has-treeview"><div class="nav-link">
						<i class="nav-icon fas fa-shopping-basket"></i>
						<p>
							採購管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>

					<ul class="nav nav-treeview" style="display: none;">
						
						<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									採購單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>
							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="test()"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>採購單(測試)</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('/purchase/GetAllPurchaseOrder')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢採購單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('/purchase/GetAllPurchaseRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢請購單</p>
									</div></li>
							</ul>
						</li>


						<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									進貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="loadingPage('/purchase/GetAllPurchaseOrder')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢採購單</p>
									</div></li>
							</ul>
						</li>
						
					</ul>
				</li>
				<!-- /PurchaseSystem -->
				
				<!-- SalesSystem (三層結構)-->
				<li class="nav-item has-treeview"><div class="nav-link">
						<i class="nav-icon fas fa-user-tie"></i>
						<p>
							銷售管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>

					<ul class="nav nav-treeview" style="display: none;">
						
						<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									請購單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>
							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="loadingPage('${request.contextPath}/purchase/AddPurchaseRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>請購單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('/purchase/GetAllPurchaseRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢請購單</p>
									</div></li>
							</ul>
						</li>


						<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									訂貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>
							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="loadingPage('/shopManageSystem/GetAllSalesOrder')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢訂貨單</p>
									</div></li>
							</ul>
						</li>
						
						<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									銷貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: none;">
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
				
				<!-- StockSystem -->
				<li class="nav-item has-treeview"><div class="nav-link">
						<i class="nav-icon fas fa-cubes"></i>
						<p>
							庫存管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>

					<ul class="nav nav-treeview" style="display: none;">
						
						<li class="nav-item has-treeview" onclick="loadingPage('${request.contextPath}/purchase/GetAllMaterials')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									檢視存貨
								</p>
							</div>
						</li>
						<li class="nav-item has-treeview" onclick="loadingPage('')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									庫存盤點
								</p>
							</div>
						</li>
						<li class="nav-item has-treeview" onclick="loadingPage('')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									報廢紀錄
								</p>
							</div>
						</li>
					</ul>
				</li>
				<li class="nav-item has-treeview">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									進貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="loadingPage('/stock/GetAllStockRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢進貨單</p>
									</div></li>
							</ul>
						</li>
				<!-- /StockSystem -->
				
				<!-- customerService -->
				<li class="nav-item has-treeview" onclick="loadingPage('/customerService')"><div class="nav-link">
						<i class="nav-icon fas fa-microphone"></i>
						<p>
							客服系統
						</p>
					</div>
				</li>
				<!-- /customerService -->
				<!-- MailService -->
				<li class="nav-item has-treeview" onclick="floatPage('/messageSystem/MailSystem')"><div class="nav-link">
						<i class="nav-icon far fa-envelope"></i>
						<p>
							信件系統
						</p>
					</div>
				</li>
				<!-- /MailService -->
				<!-- Analysis -->
				<li class="nav-item has-treeview" onclick="loadingPage('/PieChartTest')"><div class="nav-link">
						<i class="nav-icon far fa-chart-bar"></i>
						<p>
							數據分析
						</p>
					</div>
				</li>
				<!-- /Analysis -->
				<li class="nav-header" style="margin:0;padding: 0px; text-align: center; font-size: 25px;line-height: 1.5">Admin</li>
				