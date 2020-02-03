<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
				<!-- privilegeId=3 -->
	
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
							<ul class="nav nav-treeview" style="display: block;">
								 <li class="nav-item" onclick="loadingPage('/purchase/GetAllMaterials')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>庫存查詢</p>
									</div></li> 
								<li class="nav-item" onclick="loadingPage('/purchase/FormPurchaseRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>請購單</p>
									</div></li>
								<li class="nav-item" onclick="loadingPage('/purchase/GetAllPRequest')"><div class="nav-link">
										<i class="far fa-dot-circle nav-icon"></i>
										<p>查詢請購單</p>
									</div></li>
	
							</ul>
						</li>

						<!-- <li class="nav-item has-treeview menu-open">
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
						</li> -->
						
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
				
				<!-- customerService -->
				<li class="nav-item has-treeview" onclick="loadingPage('/customerService')"><div class="nav-link">
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
				<li class="nav-header" style="margin:0;padding: 0px; text-align: center; font-size: 25px;line-height: 1.5">salesManger</li>
				