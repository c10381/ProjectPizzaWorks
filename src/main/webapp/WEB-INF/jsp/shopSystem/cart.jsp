<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:if test="${CLoginOK == null}">
	<c:redirect url="/memberSystem/login" />
</c:if>
<title>Pizza|購物車</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<jsp:include page="fragment/ContentCSS.jsp" />
<link href="${pageContext.request.contextPath }/css/shopSystem/cart.css"
	rel="stylesheet">
</head>
<body>
	<jsp:include page="fragment/navbar.jsp" />
	<!-- MainContent -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-1 pb-3">
				<div class="col-md-7 col-5 heading-section ftco-animate text-center">
					<h2 class="mb-1">購物車</h2>
				</div>
			</div>
			<div class="row justify-content-center mb-5 pb-3 order-controll">
				<a href="<spring:url value='/shop/menu'/>" class="mt-3">
					<button type="button"
						class="btn btn-block btn-lg btn-outline-light rounded-full">繼續挑選</button>
				</a> <a href="<spring:url value='/shop/checkout'/>" class="mt-3">
					<button type="button"
						class="btn btn-block btn-lg btn-outline-light rounded-full">前往結帳</button>
				</a>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8 cartList mb-4"></div>
			</div>
			<div class="row justify-content-end">
				<p class="line"></p>
				<button class="btn btn-lg btn-outline-light">取消本次訂購</button>
			</div>

		</div>
	</section>



	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script src="${pageContext.request.contextPath }/js/shopSystem/cart.js"></script>
</body>
</html>