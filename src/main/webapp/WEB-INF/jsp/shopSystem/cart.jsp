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
<title>Pizza Bite|購物車</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<jsp:include page="fragment/ContentCSS.jsp" />
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
			<!-- 動態載入 -->
			<div class="row justify-content-center">
			
				<div class="col-md-8 cartList mb-4"></div>
			
			</div>
			
			<div class="row justify-content-end totalPr">
				<div class="col-md-2 mb-4">
	              <h2 class="h4">購物金額</h2>
	            </div>
				<div class="col-md-4 mb-4">
	              <h3 id="totalPrice"></h3>
	            </div>
				
			</div>
			<div class="row justify-content-center order-controll">
				<div class="col-md-6 ">
					<button class="btn btn-lg btn-outline-light rounded-full mt-3 cancellation">取消本次訂購</button>
				</div>
				<a href="<spring:url value='/shop/menu'/>" class="mt-3">
					<button type="button"
						class="btn btn-block btn-lg btn-outline-light rounded-full">繼續挑選</button>
				</a> <a href="<spring:url value='/shop/checkout'/>" class="mt-3 ml-3">
					<button type="button"
						class="btn btn-block btn-lg btn-outline-light rounded-full px-5">前往結帳</button>
				</a>
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