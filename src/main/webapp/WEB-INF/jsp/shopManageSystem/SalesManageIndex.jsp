<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Backend Index</title> 
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopManageSystem/all.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/shopManageSystem/adminlte.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-success">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#"><i class="fas fa-bars"></i></a></li>
				<!-- <li class="nav-item d-none d-sm-inline-block"><a
					href="../../index3.html" class="nav-link">Home</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Contact</a></li> -->
			</ul>

			<!-- SEARCH FORM -->
			<!-- <form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form> -->

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user1-128x128.jpg" alt="User Avatar"
									class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user8-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="../../dist/img/user3-128x128.jpg" alt="User Avatar"
									class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">15
							Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 new messages <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 friend requests <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 new reports <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="control-sidebar" data-slide="true" href="#"> <i
						class="fas fa-th-large"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a
				href="${pageContext.request.contextPath}/shopManageSystem/SalesManageIndex"
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
						<li class="nav-header">EXAMPLES</li>
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

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<h5 class="mb-2">功能一覽</h5>
					<div class="row">
						<div class="col-md-3 col-sm-6 col-12">
							<a href='products'>
								<div class="info-box">
									<span class="info-box-icon bg-success"><i
										class="far fa-list-alt"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">產品一覽</span>
									</div>
									<!-- /.info-box-content -->
								</div> <!-- /a -->
							</a>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<a href='salesOrders'>
								<div class="info-box">
									<span class="info-box-icon bg-success"><i
										class="fas fa-check-square"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">查看訂單</span>
										<!-- <span class="info-box-number">1,410</span> -->
									</div>
									<!-- /.info-box-content -->
								</div>
							</a>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<a href=''>
								<div class="info-box">
									<span class="info-box-icon bg-success"><i
										class="fas fa-cubes"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">存貨一覽</span>
										<!-- <span class="info-box-number">410</span> -->
									</div>
									<!-- /.info-box-content -->
								</div>
							</a>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
						<div class="col-md-3 col-sm-6 col-12">
							<a href=''>
								<div class="info-box">
									<span class="info-box-icon bg-success"><i
										class="fas fa-user-plus"></i></span>
									<div class="info-box-content">
										<span class="info-box-text">後臺會員註冊</span>
										<!-- <span class="info-box-number">93,139</span> -->
									</div>
									<!-- /.info-box-content -->
								</div>
							</a>
							<!-- /.info-box -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
			</section>
		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.0.1
			</div>
			<strong>Copyright &copy; 2014-2019 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/demo.js"></script>
</body>
</html>