<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- START navbar -->
<nav
	class="navbar navbar-expand-md navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/ "><span
			class="flaticon-pizza-1 mr-1"></span>Pizza<br /> <small>BITE</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="nav navbar-nav mr-auto">
				<li class="nav-item active"><a
					href="<spring:url value='/shop/menu' />" class="nav-link">精選菜單</a></li>
				<li class="nav-item"><a href="<spring:url value='/shop/story' />" class="nav-link">品牌故事</a>
				</li>
				<li class="nav-item"><a href="contact.html" class="nav-link">店面資訊</a>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-collapse nav-rt" id="ftco-nav">
			<ul class="nav navbar-nav ml-auto">
				
				<li class="nav-item active"><a
					href='<spring:url value="/shop/cart" />' class="nav-link"> <i
						class="fas fa-shopping-cart"></i> <span
						class="badge badge-pill count-notif"></span>
				</a></li>

				<!-- User Information / 登入登出 -->
				<c:choose>
					<c:when test="${CLoginOK==null }">
						<li class="nav-item"><a
							href="<spring:url value='/memberSystem/login' />"
							class="nav-link nav-link">登入 / 註冊 </a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown no-arrow">
							<a href='#'
								class="nav-link text-white nav-link dropdown-toggle"
								id="userDropdown" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> 
									Hi, ${CLoginOK.lastName }${CLoginOK.firstName}</a>

							<div
								class="dropdown-menu dropdown-menu-right shadow"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="#"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 會員資訊 
								</a> 
								<a class="dropdown-item" href="#">
									<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 密碼修改
								</a>
								<a class="dropdown-item" href="#">
									<i class="fa fa-outdent fa-sm fa-fw mr-2 text-gray-400"></i> 訂單查詢
								</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="<spring:url value='/shop/logout'/>" > <!-- data-toggle="modal" data-target="#logoutModal" -->
									<i 	class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 登出
								</a>
							</div>
						</li>
					</c:otherwise>

				</c:choose>


			</ul>
		</div>
	</div>
</nav>
<!-- END navber -->