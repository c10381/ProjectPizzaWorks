<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a
				href="${pageContext.request.contextPath}/backendSystem/adminIndex"
				class="brand-link"> <img
				src="${pageContext.request.contextPath}/images/shopManageSystem/tempLogo.jpg"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">PizzaWorks</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header">您好，現在時間為： <span id="clock"></span></li>
						<!-- MemberSystem -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-envelope"></i>
								<p>
									員工系統 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="mailbox/mailbox.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>員工註冊</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/compose.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>員工管理</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/read-mail.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Read</p>
								</a></li>
							</ul></li>
						<!-- /MemberSystem -->
						<!-- MemberSystem -->
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-envelope"></i>
								<p>
									前台系統管理 <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item" onclick="loadingPage('/shopManageSystem/products')">
								<div class="nav-link">
								<i class="far fa-circle nav-icon "></i>
										<p>產品一覽</p>
								</div>
								</li>
								<li class="nav-item"><a href="mailbox/compose.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>新增產品</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/read-mail.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>修改產品</p>
								</a></li>
							</ul></li>
						<!-- /MemberSystem -->
						
						<li class="nav-item"><a href="calendar.html" class="nav-link">
								<i class="nav-icon far fa-calendar-alt"></i>
								<p>
									Calendar <span class="badge badge-info right">2</span>
								</p>
						</a></li>
						<li class="nav-item"><a href="gallery.html" class="nav-link">
								<i class="nav-icon far fa-image"></i>
								<p>Gallery</p>
						</a></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-envelope"></i>
								<p>
									Mailbox <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="mailbox/mailbox.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Inbox</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/compose.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Compose</p>
								</a></li>
								<li class="nav-item"><a href="mailbox/read-mail.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Read</p>
								</a></li>
							</ul></li>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>