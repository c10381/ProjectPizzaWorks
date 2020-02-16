<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Pizza Bite Manager</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/shopSystem/icon.png">
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
<!-- 後台chatroom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backendSystem/chatroomstyle.css" />

<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery/jquery.min.js"></script>
<!-- jQuery-ui 1.12.1 -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery-ui.min.js"></script>
<!-- flatpickr -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/flatpickr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/themes/dark.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/plugins/confirmDate/confirmDate.css">
<!-- fselect -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/backendSystem/fSelect.css">
<style>
.sidebar {
  overflow-y: scroll; /* Add the ability to scroll */
}

/* Hide scrollbar for Chrome, Safari and Opera */
.sidebar::-webkit-scrollbar {
    display: none;
}

/* Hide scrollbar for IE and Edge */
.sidebar {
    -ms-overflow-style: none;
}
</style>

</head>
<body  class="sidebar-mini layout-fixed" onload="clock()">
	<!-- Site wrapper -->
	<div class="wrapper">
		<!-- import navbar(use request),change the color in Jsp -->
		<!--  /backendSystem/navbar-->
		<jsp:include page="/backendSystem/navbar" />


		<!-- import sidebar(use request),select the jsp in controller(by Bean privilege) -->

		<aside class="main-sidebar elevation-4 sidebar-dark-primary">
			<!-- Brand Logo -->
			<a href="${pageContext.request.contextPath}/admin"
				class="brand-link"> <img
				src="${pageContext.request.contextPath}/images/shopManageSystem/tempLogo.jpg"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">PizzaBiteManager</span>
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

						<!-- 依角色變換sidebar(透過controller) -->
						<jsp:include page="/backendSystem/sidebar" />

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<div style="position:relative;">
			<!-- 浮動視窗 -->
			<div id="floatBlock" style="right:0;z-index:99;margin-top:1%;height:100%;width:85%;display:none;border-radius:10px;background:#ffffff;position:absolute; overflow-y:scroll;">
			</div>
			<!-- Main content ,use jQuery load() to load page-->
			<div class="content-wrapper"
			style="box-sizing: border-box; padding: 30px 0 0 30px;"></div>
		</div>
		<!-- Main content -->
	<!-- ./wrapper -->
		</div>
	<!-- Backend chatroom -->
	<div id ="chatroom">
	<div class="chat_box">
      <div class="chat_header">
        <h1 class="chat_heading">Pizza Message</h1>
      	<div class="btn btn-default btn-sm">離線</div>
      </div>
      <hr />
      <div class="chat_content"></div>
    </div>
    <!-- <div id="chatmessageContent"></div> -->
	</div>
	<!-- Backend chatroom -->

	<!-- footer -->
	<footer class="main-footer">
		<div class="float-right d-none d-sm-block">
			<b>Version</b> 5.2.1
		</div>
		<strong>Copyright &copy; 2020 <a href="http://adminlte.io">iiiEDU</a>.
		</strong> All rights reserved.
	</footer>
	<!-- /footer -->

	
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
	<!-- jQuery-UI -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery-ui.min.js"></script>
	<!-- sweetalert -->
    <script src="${pageContext.request.contextPath}/js/backendSystem/sweetalert.min.js"></script>
	<!-- WebSocket用套件 -->
	<script src="${pageContext.request.contextPath}/js/messageSystem/sockjs-0.3.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/messageSystem/stomp.js"></script>
    <!-- flatpickr -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/flatpickr.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/plugins/confirmDate/confirmDate.js"></script>
	
    <script src="${pageContext.request.contextPath}/js/backendSystem/fSelect.js"></script>
	<!-- chatroom Js (放最後面)-->
	<script src="${pageContext.request.contextPath}/js/backendSystem/chatroommain.js"></script>
    
	
	<script>
		//紀錄email
		var customerEmail="${CLoginOK.email}";
		var memberEmail="${Mem_LoginOK.email}";
		var contextPath="${pageContext.request.contextPath}";
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
		//LogOut功能
		function LogOut(){
			//WebSocket登出
			disconnect();
			window.location.replace("${pageContext.request.contextPath}/logout");
		}
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
		function loadingPageWithData(requestPage,data) {
			if (requestPage == '') {
				console.log("還沒做，加油R");
			} else {
				$('.content-wrapper').empty();
				$('.content-wrapper').load(
						"${pageContext.request.contextPath}" + requestPage,data);
			}

		}
		/* 浮動分頁打開 */
		function floatPage(requestPage,width,height){
			var note=document.querySelectorAll(".note-popover");
			if(note.length!=0){
				//編輯器存在
				for (var i = 0; i < note.length; i++) {
					note[i].remove();
					}
				}
			$("#floatBlock").css("width",width);
			$("#floatBlock").css("height",height);
			$("#floatBlock").css("box-shadow","0 2px 2px 1px rgba(0, 0, 0, 0.2)");
			$("#floatBlock").show("slide", { direction: "right" }, "slow"); 

			$('#floatBlock').empty();
			$("#floatBlock").load("${pageContext.request.contextPath}"+requestPage);
			
			//插不進去
			/* $("<div><i class='fas fa-times' style='font-size:20px;margin-right:3px;float:right ' onclick='floatPageClose()'></i></div>").insertBefore("#floatBlock > div:first"); */
			
		}
		
		/* 浮動分頁關閉(隱藏) */
		function floatPageClose(){
			$('#floatBlock').empty();
			$("#floatBlock").hide("slide", { direction: "right" }, "slow");
			var note=document.querySelectorAll(".note-popover");
			if(note.length!=0){
				//編輯器存在
				for (var i = 0; i < note.length; i++) {
					note[i].remove();
					}
				}
		}
		//自動Loading首頁
		$().ready(function(){
			<c:choose>
				<c:when test="${Mem_LoginOK.privilegeId==2}">
					
				</c:when>
				<c:when test="${Mem_LoginOK.privilegeId==3}">
					
				</c:when>
				<c:when test="${Mem_LoginOK.privilegeId==4}">
					
				</c:when>
				<c:when test="${Mem_LoginOK.privilegeId==5}">
					;
				</c:when>
				<c:when test="${Mem_LoginOK.privilegeId==6}">
					//客服人員
					loadingPage('/customerService');
				</c:when>
				<c:when test="${Mem_LoginOK.privilegeId==7}">
					
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			}
		)
		
		
	</script>

		
</body>
</html>