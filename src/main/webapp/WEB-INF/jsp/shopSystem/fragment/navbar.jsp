<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <!-- START navbar -->
<nav class="navbar navbar-expand-md navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/shop/ "><span
			class="flaticon-pizza-1 mr-1"></span>Pizza<br />
		<small>Sim</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="nav navbar-nav mr-auto">
				<li class="nav-item active"><a href="<spring:url value='/shop/menu' />"
					class="nav-link">精選菜單</a></li>
				<li class="nav-item"><a href="about.html" class="nav-link">品牌故事</a>
				</li>
				<li class="nav-item"><a href="contact.html" class="nav-link">店面資訊</a>
				</li>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="nav navbar-nav ml-auto">
				<li class="nav-item active"><a href='<spring:url value="/shop/cart" />'
					class="nav-link"> <i class="fas fa-shopping-cart"></i>
				</a></li>
				<li class="nav-item"><a href="<spring:url value='/memberSystem/login' />" class="nav-link">登入 / 註冊 </a>
				</li>
			</ul>
		</div>
	</div>
</nav>
<!-- END navber -->