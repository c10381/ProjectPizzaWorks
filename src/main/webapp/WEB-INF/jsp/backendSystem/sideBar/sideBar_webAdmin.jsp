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
					<ul class="nav nav-treeview" style="display: block;">
						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>查詢會員資料</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>前台資訊修改</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p></p>
							</div></li>
					</ul></li>
				<!-- /frontEnd System -->

				<!-- ProductSystem -->
				<li class="nav-item has-treeview menu-open"><div class="nav-link">
						<i class="nav-icon fas fa-pizza-slice"></i>
						<p>
							商品管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>
					<ul class="nav nav-treeview" style="display: block;">
						<li class="nav-item"
							onclick="loadingPage('/shopManageSystem/products')">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>檢視產品</p>
							</div>
						</li>

						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>新增產品</p>
							</div></li>
						<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>修改產品</p>
							</div></li>
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
									請購單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>
							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>請購單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢請購單</p>
									</div></li>
	
							</ul>
						</li>


						<li class="nav-item has-treeview menu-open">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									訂貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: none;">
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
				

				<!-- customerService -->
				<li class="nav-item has-treeview" onclick="loadingPage('')"><div class="nav-link">
						<i class="nav-icon fas fa-microphone"></i>
						<p>
							客服系統
						</p>
					</div>
				</li>
				<!-- /customerService -->
				
				<!-- Analysis -->
				<li class="nav-item has-treeview" onclick="loadingPage('')"><div class="nav-link">
						<i class="nav-icon far fa-chart-bar"></i>
						<p>
							數據分析
						</p>
					</div>
				</li>
				<!-- /Analysis -->
				<li class="nav-header" style="margin:0;padding: 0px; text-align: center; font-size: 25px;line-height: 1.5">webAdmin</li>
				