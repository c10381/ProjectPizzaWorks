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
<body class="hold-transition sidebar-mini" onload="clock()">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- import navbar(use request),change the color in Jsp -->
		<jsp:include page="/backendSystem/navbar" />
		<!-- import sidebar(use request),select the jsp in controller(by Bean privilege) -->
		<jsp:include page="/backendSystem/sidebar" />

		<!-- Main content ,use jQuery load() to load page-->
		<div class="content-wrapper">
			<jsp:include page="/backendSystem/navbar" />

		</div>
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
			$('.content-wrapper').empty();
			$('.content-wrapper').load(
					"${pageContext.request.contextPath}" + requestPage);
		}
	</script>
</body>
</html>