<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- Navbar -->
<!-- <nav class="main-header navbar navbar-expand navbar-dark navbar-success"> -->
<c:choose>
	<c:when test="${Mem_LoginOK.privilegeId==2}">
		<nav
			class="main-header navbar navbar-expand navbar-light navbar-white">
	</c:when>
	<c:when test="${Mem_LoginOK.privilegeId==3}">
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-success">
	</c:when>
	<c:when test="${Mem_LoginOK.privilegeId==4}">
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-danger">
	</c:when>
	<c:when test="${Mem_LoginOK.privilegeId==5}">
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-primary">
	</c:when>
	<c:when test="${Mem_LoginOK.privilegeId==6}">
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-lightblue">
	</c:when>
	<c:when test="${Mem_LoginOK.privilegeId==7}">
		<nav
			class="main-header navbar navbar-expand navbar-dark navbar-secondary">
	</c:when>
</c:choose>
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
	<!-- Notifications Dropdown Menu -->
	<li class="nav-item dropdown"><a class="nav-link"
		data-toggle="dropdown" href="#"> <i class="fas fa-user"></i> <span
			class="badge badge-warning navbar-badge"></span>
	</a>
		<div class="dropdown-menu dropdown-menu-sm dropdown-menu-right">
			<div onclick="loadingPage('/memberSystem/memberPW')"
				class="dropdown-item">
				<i class="fas fa-key"></i> 修改密碼
			</div>
			<div class="dropdown-divider"></div>
			<a href="${pageContext.request.contextPath}/logout"
				class="dropdown-item"> <i class="fas fa-door-open"></i> 登出
			</a>
		</div></li>

	<!-- Messages Dropdown Menu -->
	<!-- <li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> Message Start
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
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> Message Start
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
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> Message Start
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
							</div> Message End
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All
							Messages</a>
					</div></li> -->


	<!-- Notifications Dropdown Menu -->
	<li class="nav-item dropdown"><a class="nav-link"
		data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
			class="badge badge-warning navbar-badge" id='note'></span>
	</a>
		<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
			<span class="dropdown-item dropdown-header" id='note1'></span>
			<div class="dropdown-divider"></div>

			<div id='notification_container'>
				<!-- 第一個box starts -->
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					box1 <span class="float-right text-muted text-sm">box1 time</span>
				</a>

				<div class="dropdown-divider"></div>
				<!-- 第一個box ends -->

				<!-- 第二個box starts -->
				<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
					box2 <span class="float-right text-muted text-sm">box2 time</span>
				</a>
				<!-- 第二個box ends -->


				<div href="#" class="dropdown-item">
					<i class="fas fa-file mr-2"></i> box3 <span
						class="float-right text-muted text-sm">box3 time</span>
				</div>
			</div>

			<div 
				class="dropdown-item dropdown-footer" style="cursor: pointer" id='footer'>box for All</div>
		</div></li>
	<!-- Notifications Dropdown Menu -->
	<li class="nav-item dropdown">
		<div class="form-group">
			<div class="custom-control custom-switch">
				<input type="checkbox" class="custom-control-input"
					id="customSwitch1" value="3000" checked> <label class="custom-control-label"
					for="customSwitch1"></label>
			</div>
		</div>
	</li>
</ul>


<script type="text/javascript">
	var divider = "<div class='dropdown-divider'></div>";
	var time_interval = 3000;
	var identity = ${Mem_LoginOK.privilegeId};
	var intervalId;
	getNotification();
	intervalId = setInterval(getNotification, time_interval);
	
	//每幾秒抓通知的開關
	$('#customSwitch1').change(function(){
		if($(this).is(":checked") == true){
			$(this).attr('checked:',true);
			console.log('Start up');
			time_interval = 30000;
			intervalId = setInterval(getNotification, time_interval);
		} else if($(this).is(":checked") == false){
			$(this).attr('checked:',false);
			console.log('Stop');
			clearInterval(intervalId);
		}
	});
	
	function getNotification() {
		//由identity判斷登入者的身分，之後用相對應的ajax取/放值，目前只有網管人員及客服人員沒有通知
		if(identity === 3){
			//銷貨人員通知
			getSalesOrderNotification();
		}else if (identity === 4){
			//採購人員通知
			getPurchaseRequestNotification();
		}else if (identity === 5){
			//存貨人員通知
			getStockRequestNotification();			
		}else if (identity === 7){
			//admin通知
			getPwdChangeRequestNotification();			
		}				
	}
	
	$('.nav-link').click(function() {
		$('#note').hide();
	})

	//動態生成點擊小鈴鐺後會生成的下拉欄位，最多三欄
	
	function getSalesOrderNotification(){
		$.ajax({
			url : '${pageContext.request.contextPath}/backendSystem/getOrderNotification',
			type : 'GET',
			error : function(data) {
				console.log("error");
			},
			success : function(data) {				
				$('#footer').html('查看所有訂單');
				$('#footer').attr("onclick","loadingPage('/shopManageSystem/salesOrders')");				
				if (data.length == 0) {
					$('#note').hide();
					$('#note1').html('目前沒有訂單');
				} else {					
					$('#note').show();
					$('#note').html(data.length);
					$('#note1').html('有 ' + data.length + ' 筆新訂單');
				}
				salesOrderNotifier(data);
			},
		});
	}
	
	function salesOrderNotifier(data) {
		//先清掉#notification_container下的全部子元素，即全部的下拉欄位
		$('#notification_container').children().remove();
		//呼叫後台controller需要給予的路徑值，因為是由get做request，所以下面跑迴圈的後面還要加上"?id="以及對應的單號
		var orderLink = "/shopManageSystem/getSalesOrder?id=";
		var orderId = "單號：";
		var orderLength = 3;

		if (data.length < 4) {
			orderLength = data.length;
		}
		
		for (i = 0; i < orderLength; i++) {
			orderId += data[i].salesOrderId;
			var timeResult = timeReader(data[i].orderTime);
			var div_html = "<div onclick=\"loadingPage('"
					+ orderLink
					+ data[i].salesOrderId
					+ "')\" class='dropdown-item' style='cursor: pointer'> <i class='fas fa-file mr-2'></i>";
			div_html += orderId;
			div_html += "<span class='float-right text-muted text-sm'>";
			div_html += timeResult + "</span></div>" + divider;
			$('#notification_container').append(div_html);
		}		
	}
	
	
	function getPurchaseRequestNotification(){
		$.ajax({
			url : '${pageContext.request.contextPath}/backendSystem/getPurchaseNotification',
			type : 'GET',
			error : function(data) {
				console.log("error");
			},
			success : function(data) {				
				$('#footer').html('查看所有請購需求');
				$('#footer').attr("onclick","loadingPage('/shopManageSystem/salesOrders')");				
				if (data.length == 0) {
					$('#note').hide();
					$('#note1').html('目前沒有請購需求');
				} else {
					$('#note').show();
					$('#note').html(data.length);
					$('#note1').html('有 ' + data.length + ' 筆請購需求');
				}
				purchaseRequestNotifier(data);
			},
		});
	}
	
	function purchaseRequestNotifier(data){		
		$('#notification_container').children().remove();
		var link = "/shopManageSystem/getPurchaseRequest?id=";//變更網址
		var requestId = "採購單號：";
		var requestLength = 3;

		if (data.length < 4) {
			requestLength = data.length;
		}
		
		for (i = 0; i < requestLength; i++) {
			requestId += data[i].pRequestId;//要改掉salesOrderId
			var timeResult = timeReader(data[i].requestTime);//要改掉orderTime
			var div_html = "<div onclick=\"loadingPage('"
					+ link
					+ data[i].pRequestId
					+ "')\" class='dropdown-item' style='cursor: pointer'> <i class='fas fa-file mr-2'></i>";
			div_html += requestId;
			div_html += "<span class='float-right text-muted text-sm'>";
			div_html += timeResult + "</span></div>" + divider;
			$('#notification_container').append(div_html);
	 	}		
	}
		
	function getStockRequestNotification(){
		$.ajax({
			url : '${pageContext.request.contextPath}/backendSystem/getStockNotification',
			type : 'GET',
			error : function(data) {
				console.log("error");
			},
			success : function(data) {
				$('#footer').html('查看所有進貨通知');
				$('#footer').attr("onclick","loadingPage('/shopManageSystem/salesOrders')");
				if (data.length == 0) {
					$('#note').hide();
					$('#note1').html('沒有新的進貨通知');
				} else {
					$('#note').show();
					$('#note').html(data.length);
					$('#note1').html('有 ' + data.length + ' 筆進貨通知');
				}
				stockRequestNotifier(data);
			},
		});
	}
	
	function stockRequestNotifier(data){
		$('#notification_container').children().remove();
		var link = "/shopManageSystem/getSalesOrder?id=";//變更網址
		var requestId = "進貨單號：";
		var requestLength = 3;

		if (data.length < 4) {
			requestLength = data.length;
		}
		
		for (i = 0; i < requestLength; i++) {
			requestId += data[i].sRequestId;//要改掉salesOrderId
			var timeResult = timeReader(data[i].requestTime);//要確認requestTime
			var div_html = "<div onclick=\"loadingPage('"
					+ link
					+ data[i].sRequestId
					+ "')\" class='dropdown-item' style='cursor: pointer'> <i class='fas fa-file mr-2'></i>";
			div_html += requestId;
			div_html += "<span class='float-right text-muted text-sm'>";
			div_html += timeResult + "</span></div>" + divider;
			$('#notification_container').append(div_html);
	 	}
	}
	
		
	function getPwdChangeRequestNotification(){
		$.ajax({
			url : '${pageContext.request.contextPath}/backendSystem/getPwdChangeNotification',
			type : 'GET',
			error : function(data) {
				console.log("error");
			},
			success : function(data) {
				$('#footer').html('查看所有變更請求');
				$('#footer').attr("onclick","loadingPage('/shopManageSystem/salesOrders')");
				if (data.length == 0) {
					$('#note').hide();
					$('#note1').html('沒有新的變更請求');
				} else {
					$('#note').show();
					$('#note').html(data.length);
					$('#note1').html('有 ' + data.length + ' 筆密碼變更請求');
				}
				pwdChangeRequestNotifier(data);
			},
		});
	}
	
	function pwdChangeRequestNotifier(data){
		$('#notification_container').children().remove();
		var link = "/shopManageSystem/getSalesOrder?id=";
		var requestId = "員工編號：";
		var requestLength = 3;

		if (data.length < 4) {
			requestLength = data.length;
		}
		
		for (i = 0; i < requestLength; i++) {
			requestId += data[i].vRequestId;//要改掉salesOrderId
			var timeResult = timeReader(data[i].requestTime);//要確認requestTime
			var div_html = "<div onclick=\"loadingPage('"
					+ link
					+ data[i].vRequestId
					+ "')\" class='dropdown-item' style='cursor: pointer'> <i class='fas fa-file mr-2'></i>";
			div_html += requestId;
			div_html += "<span class='float-right text-muted text-sm'>";
			div_html += timeResult + "</span></div>" + divider;
			$('#notification_container').append(div_html);
	 	}
	}
		
	//顯示請求是多久前發出的，會根據距離現在多久而回傳相對應的result，需給一個固定格式的時間字串
	function timeReader(data) {

		var time = new Date($.now());
		var UTC = time.toUTCString();
		var orderTime = new Date(data);
		var millseconds = (time - orderTime);
		var days = Math.floor(millseconds / 86400000);
		var hours = Math.floor((millseconds - (days * 86400000)) / 3600000);
		var minutes = Math
				.floor((millseconds - (days * 86400000) - (hours * 3600000)) / 60000);
		var seconds = Math.floor((millseconds - (days * 86400000)
				- (hours * 3600000) - (minutes * 60000)) / 1000);

		console.log('距離:' + days + '天' + hours + '小時' + minutes + '分' + seconds + '秒');

		if (days != 0) {
			var result = '天前';
			days += result;
			return days;
		} else {
			if (hours != 0) {
				var result = '小時前';
				hours += result;
				return hours;
			} else {
				if (minutes != 0) {
					var result = '分鐘前';
					minutes += result;
					return minutes;
				} else {
					var result = '秒鐘前';
					seconds += result;
					return seconds;
				}
			}
		}
	}
</script>
</nav>