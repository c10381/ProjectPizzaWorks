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
<!-- jquery-ui -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/jquery-ui.min.css">
<!-- DataTable -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.css" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/all.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/adminlte.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
</head>
<body class="sidebar-mini layout-fixed" onload="clock()">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- import navbar(use request),change the color in Jsp -->
		<!--  /backendSystem/navbar-->
		<jsp:include page="/backendSystem/navbar" />


		<!-- import sidebar(use request),select the jsp in controller(by Bean privilege) -->

		<aside class="main-sidebar elevation-4 sidebar-dark-primary">
			<!-- Brand Logo -->
			<a href="${pageContext.request.contextPath}/backendSystem/adminIndex"
				class="brand-link"> <img
				src="${pageContext.request.contextPath}/images/shopManageSystem/tempLogo.jpg"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">PizzaWorks</span>
			</a>

			<!-- Sidebar -->
			<div
				class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column nav-child-indent"
						data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-header" id="clock"
							style="margin: 0; padding: 0px; text-align: center; width: 100%; color: white; font-size: 40px; line-height: 1;"></li>

						<li class="nav-header"
							style="margin: 0; padding: 0px; text-align: center; font-size: 20px; line-height: 1.5">${Mem_LoginOK.lastName}${Mem_LoginOK.firstName}
							您好</li>
						<!-- 待辦事項 -->
						<li class="nav-item has-treeview" onclick="loadingPage('')"><div
								class="nav-link">
								<i class="nav-icon fas fa-chalkboard-teacher"></i>
								<p>待辦事項</p>
							</div></li>

						<!-- 依角色變換sidebar(透過controller) -->
						<jsp:include page="/backendSystem/sidebar" />

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>



		<!-- Main content ,use jQuery load() to load page-->
		<div class="content-wrapper"
			style="box-sizing: border-box; padding: 10px 15px"></div>
		<!-- Main content -->
	</div>
	<!-- ./wrapper -->


	<!-- footer -->
	<footer class="main-footer">
		<div class="float-right d-none d-sm-block">
			<b>Version</b> 5.2.1
		</div>
		<strong>Copyright &copy; 2020 <a href="http://adminlte.io">iiiEDU</a>.
		</strong> All rights reserved.
	</footer>
	<!-- /footer -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery/jquery.min.js"></script>
	<!-- jQuery-ui 1.12.1 -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery-ui.min.js"></script>
	<!-- jQuery.csv(Api)-->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery.csv.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- DataTable(Api) -->
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/dt/dt-1.10.20/datatables.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/adminlte.min.js"></script>
	<%-- <!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/demo.js"></script> --%>
	<script>
		//小時鐘功能
		function clock() {
			var today = new Date();
			var hh = today.getHours();
			var mm = today.getMinutes();
			var ss = today.getSeconds();
			mm = checkTime(mm);
			ss = checkTime(ss);
			document.getElementById('clock').innerHTML = hh + ":" + mm + ":"
					+ ss;
			var timeoutId = setTimeout(clock, 500);
		}
		function checkTime(i) {
			if (i < 10) {
				i = "0" + i;
			}
			return i;
		}
		//小時鐘功能

		//Loading 頁面功能
		function loadingPage(requestPage) {
			if (requestPage == '') {
				console.log("還沒做，加油R");
			} else {
				$('.content-wrapper').empty();
				$('.content-wrapper').load(
						"${pageContext.request.contextPath}" + requestPage);
			}

		}

	</script>
</body>
</html>