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
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fas fa-book"></i>
								<p>
									Pages <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview" style="display: none;">
								<li class="nav-item"><a href="examples/invoice.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Invoice</p>
								</a></li>
								<li class="nav-item"><a href="examples/profile.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Profile</p>
								</a></li>
								<li class="nav-item"><a href="examples/e_commerce.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>E-commerce</p>
								</a></li>
								<li class="nav-item"><a href="examples/projects.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Projects</p>
								</a></li>
								<li class="nav-item"><a href="examples/project_add.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Project Add</p>
								</a></li>
								<li class="nav-item"><a href="examples/project_edit.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Project Edit</p>
								</a></li>
								<li class="nav-item"><a href="examples/project_detail.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Project Detail</p>
								</a></li>
								<li class="nav-item"><a href="examples/contacts.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Contacts</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-plus-square"></i>
								<p>
									Extras <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="examples/login.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Login</p>
								</a></li>
								<li class="nav-item"><a href="examples/register.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Register</p>
								</a></li>
								<li class="nav-item"><a
									href="examples/forgot-password.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Forgot Password</p>
								</a></li>
								<li class="nav-item"><a
									href="examples/recover-password.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Recover Password</p>
								</a></li>
								<li class="nav-item"><a href="examples/lockscreen.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Lockscreen</p>
								</a></li>
								<li class="nav-item"><a
									href="examples/legacy-user-menu.html" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Legacy User Menu</p>
								</a></li>
								<li class="nav-item"><a href="examples/language-menu.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Language Menu</p>
								</a></li>
								<li class="nav-item"><a href="examples/404.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Error 404</p>
								</a></li>
								<li class="nav-item"><a href="examples/500.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Error 500</p>
								</a></li>
								<li class="nav-item"><a href="examples/pace.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Pace</p>
								</a></li>
								<li class="nav-item"><a href="examples/blank.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Blank Page</p>
								</a></li>
								<li class="nav-item"><a href="../starter.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Starter Page</p>
								</a></li>
							</ul></li>
						<li class="nav-header">MULTI LEVEL EXAMPLE</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fas fa-circle nav-icon"></i>
								<p>Level 1</p>
						</a></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fas fa-circle"></i>
								<p>
									Level 1 <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Level 2</p>
								</a></li>
								<li class="nav-item has-treeview"><a href="#"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>
											Level 2 <i class="right fas fa-angle-left"></i>
										</p>
								</a>
									<ul class="nav nav-treeview">
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
										<li class="nav-item"><a href="#" class="nav-link"> <i
												class="far fa-dot-circle nav-icon"></i>
												<p>Level 3</p>
										</a></li>
									</ul></li>
								<li class="nav-item"><a href="#" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Level 2</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="fas fa-circle nav-icon"></i>
								<p>Level 1</p>
						</a></li>
						<li class="nav-header">LABELS</li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-danger"></i>
								<p class="text">Important</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-warning"></i>
								<p>Warning</p>
						</a></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon far fa-circle text-info"></i>
								<p>Informational</p>
						</a></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>