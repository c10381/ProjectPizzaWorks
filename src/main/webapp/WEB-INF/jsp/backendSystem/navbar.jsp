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
	<li class="nav-item dropdown">
		<a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> 
			<span class="badge badge-warning navbar-badge" id='note'></span>
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
	
					
					<div href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
						box3 <span class="float-right text-muted text-sm">box3 time</span>
					</div>
				</div>
				
				<div onclick= "loadingPage('/shopManageSystem/salesOrders')" 
					 class="dropdown-item dropdown-footer" style="cursor: pointer">查看所有訂單</div>
		</div>
	</li>
</ul>


<script type="text/javascript">
	var divider="<div class='dropdown-divider'></div>"	
	function getOrders(){		
		$.ajax({
		url:'${pageContext.request.contextPath}/backendSystem/getOrders',
		type: 'GET',
		error: function(data){
			console.log("error");
		},
		success: function(data){
			if(data.length==0){
				$('#note').hide();
				$('#note1').html('目前沒有新訂單');	
			}else{
				$('#note').show();
				$('#note').html(data.length);
				$('#note1').html('有 '+data.length+' 筆新訂單');
			}									
			notifier(data);						
			},			
		});	
	}
	getOrders();
	setInterval(getOrders,30000);
	
	$('.nav-link').click(function(){
		$('#note').hide();
	})
	
	//動態生成點擊小鈴鐺後會生成的下拉欄位，最多三欄
	function notifier(data){
		//先清掉#notification_container下的全部子元素，即全部的下拉欄位
		$('#notification_container').children().remove();
		
		//呼叫後台controller需要給予的路徑值，因為是由get做request，所以下面跑迴圈的後面還要加上"?id="以及
		var orderLink = "/shopManageSystem/getSalesOrder?id="
		var orderId = "單號："
		var orderLength = 3;
		
		if(data.length<4){			
			orderLength = data.length;
		}
		for (i=0 ; i<orderLength; i++){
			orderId += data[i].salesOrderId;
			var timeResult = timeReader(data[i].orderTime);
			var div_html = "<div onclick=\"loadingPage('"+orderLink+data[i].salesOrderId+"')\" class='dropdown-item' style='cursor: pointer'> <i class='fas fa-file mr-2'></i>";
			div_html += orderId;
			div_html += "<span class='float-right text-muted text-sm'>";
			div_html += timeResult + "</span></div>" + divider;			
			$('#notification_container').append(div_html);	
		}
	}
		
	//顯示訂單是多久前下單的，會根據距離現在多久而回傳相對應的result，需給一個固定格式的時間字串
	function timeReader(data){
				
		var time = new Date($.now());
		var UTC = time.toUTCString();
		var orderTime = new Date(data);
		var millseconds = (time-orderTime);
		var days = Math.floor(millseconds/86400000);
		var hours = Math.floor((millseconds-(days*86400000))/3600000);
		var minutes = Math.floor((millseconds-(days*86400000)-(hours*3600000))/60000);
		var seconds = Math.floor((millseconds-(days*86400000)-(hours*3600000)-(minutes*60000))/1000);
						
		console.log('距離:'+days+'天'+hours+'小時'+minutes+'分'+seconds+'秒');
		
		if(days!=0){
			var result ='天前';
			days += result;
			return days;
		}else{
			if(hours!=0){
				var result ='小時前';
				hours += result;
				return hours;
			}else{
				if(minutes!=0){
					var result = '分鐘前';
					minutes += result;
					return minutes;
				}else{
					var result ='秒鐘前';
					seconds += result;
					return seconds;
				}
			}
		}		
	}
	
</script>
</nav>