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
			<div onclick="LogOut()" class="dropdown-item"> <i class="fas fa-door-open"></i> 登出
			</div>
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
					<div class="dropdown-divider"></div>
					<!-- 第二個box ends -->
	
					
					<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
						box3 <span class="float-right text-muted text-sm">box3 time</span>
					</a>
				</div>
				
				<div class="dropdown-divider" id='test_yee'></div>
				
				<a href="#" class="dropdown-item dropdown-footer">See All Orders</a>
		</div>
	</li>
</ul>


<script type="text/javascript">
	var header = ' New Order';
	var divider="<div class='dropdown-divider'></div>"
	
	
	function getOrders(){		
		$.ajax({
		url:'${pageContext.request.contextPath}/backendSystem/getOrders',
		type: 'GET',
		error: function(data){
			console.log("error");
		},
		success: function(data){
			var time = new Date($.now());
			var UTC = time.toUTCString();
			var orderTime = new Date(data[0].orderTime);
			var millseconds = (time-orderTime);
			var days = Math.floor(millseconds/86400000);
			var hours = Math.floor((millseconds-(days*86400000))/3600000);
			var minutes = Math.floor((millseconds-(days*86400000)-(hours*3600000))/60000);
			var seconds = Math.floor((millseconds-(days*86400000)-(hours*3600000)-(minutes*60000))/1000);
							
			console.log('距離:'+days+'天'+hours+'小時'+minutes+'分'+seconds+'秒');				
			
			if(data.length<1){
				$('#note').hide();
			}else{
				$('#note').show();
			}
						
			$('#note').html(data.length);
			
			if(data.length==0){
				$('#note1').html(0+header);	
			}else{
				$('.dropdown-divider').remove();
				$('#note1').html(data.length+header);
			}
							
			reseter(3);
						
			},			
		});	
	}
	getOrders();
	setInterval(getOrders,30000);
	
	$('.nav-link').click(function(){
		$('#note').hide();
	})
	
	function reseter(datalength){
		$('#notification_container').children().remove();
		
		if(datalength===1){
			var temp_link1 = "#";
			var temp_msgTitle1 = "Yee";
			var temp_msgTime = "";
			var a_html = "<a href='"+temp_link+"' class='dropdown-item'> <i class='fas fa-file mr-2'></i>";
			a_html += temp_msgTitle + "<span class='float-right text-muted text-sm'>";
			a_html += temp_msgTime + "</span></a>" + divider;
			$('#notification_container').append(a_html);		
		}else if (datalength===2){
			var temp_link = "#";
			var temp_msgTitle = "Yee";
			var temp_msgTime = "";
			var a_html = "<a href='"+temp_link+"' class='dropdown-item'> <i class='fas fa-file mr-2'></i>";
			a_html += temp_msgTitle + "<span class='float-right text-muted text-sm'>";
			a_html += temp_msgTime + "</span></a>" + divider;
			$('#notification_container').append(a_html);
		}else if (datalegth>=3){
			
		}	
		
		
	}
	

	
	
	
</script>
</nav>