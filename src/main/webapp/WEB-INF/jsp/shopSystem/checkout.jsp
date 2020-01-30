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
<title>結帳 - Pizza Sim</title>
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
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 col-5 heading-section ftco-animate text-center">
					<h2 class="mb-4">結帳</h2>
					<p class="line"></p>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-8 cartList"></div>
			</div>
		</div>
	</section>

	<section class="ftco-appointment">
		<div class="overlay"></div>
		<div class="container-wrap">
			<div class="row no-gutters d-md-flex align-items-center">
				<div class="col-md-6 appointment ftco-animate">
					<h3 class="mb-3">訂購資料</h3>
					<form action="#" class="appointment-form">
						<div class="d-md-flex">
							<div class="form-group">
							<label>取餐方式</label>
								<input type="text" name="needDelivery" class="form-control" value="" disabled>
							</div>
						</div>
						<div class="d-md-flex">
							<div class="form-group">
							<label>送達地點</label>
								<input type="text" name="deliverAddress" class="form-control" placeholder="First Name">
							</div>
						</div>
						<div class="d-me-flex">
							<div class="form-group">
							<label>預定取餐時間</label>
								<input type="text" name="requireTime" class="form-control" placeholder="Last Name">
							</div>
						</div>
						<div class="form-group">
							<label>備註</label>
							<textarea name="note" id="note" cols="30" rows="3" class="form-control"
								placeholder="[邀您一同愛護地球] 即日起，不再主動提供餐巾紙及辣椒包。"></textarea>
						</div>
						<div class="form-group">
							<input type="button" value="確認"
								class="btn btn-primary py-3 px-4">
						</div>
					</form>
				</div>
				
				<div class="col-md-6 d-flex align-self-stretch">
					<div id="map"></div>
				</div>
				
			</div>
		</div>
	</section>

	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script
		src="${pageContext.request.contextPath }/js/shopSystem/checkout.js"></script>
</body>
</html>