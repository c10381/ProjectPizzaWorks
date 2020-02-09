<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
				<!-- privilegeId=5 -->

		
				<!-- StockSystem -->
				<li class="nav-item has-treeview menu-open"><div class="nav-link">
						<i class="nav-icon fas fa-cubes"></i>
						<p>
							庫存管理 <i class="fas fa-angle-left right"></i>
						</p>
					</div>

					<ul class="nav nav-treeview" style="display: block;">
						
						<li class="nav-item has-treeview" onclick="loadingPage('')">
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
				<li class="nav-item has-treeview menu-open">
							<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
								<p>
									進貨單系統<i class="fas fa-angle-left right"></i>
								</p>
							</div>

							<ul class="nav nav-treeview" style="display: block;">
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
				
				<!-- Analysis -->
				<li class="nav-item has-treeview" onclick="loadingPage('')"><div class="nav-link">
						<i class="nav-icon far fa-chart-bar"></i>
						<p>
							數據分析
						</p>
					</div>
				</li>
				<!-- /Analysis -->
				<li class="nav-header" style="margin:0;padding: 0px; text-align: center; font-size: 25px;line-height: 1.5">stockManager</li>
				