<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>Pizza|產品介紹</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<jsp:include page="fragment/ContentCSS.jsp" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/flatpickr.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/themes/dark.css">	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/plugins/confirmDate/confirmDate.css">
</head>
<body>

	<jsp:include page="fragment/navbar.jsp" />

	<!-- MainContent -->

	<section class="ftco-section contact-section">
		<div class="container mt-5">
			<div class="row staff">
				<c:forEach items="${products}" var="item" varStatus="status">
					<c:if test="${status.first }">
						<div class="col-md-6 ftco-animate">
							<img
								src="${pageContext.request.contextPath}/picture/${products[status.index].productId}"
								class="img-fluid" />
						</div>
					</c:if>
				</c:forEach>
				<div class="col-md-1"></div>

				<div class="col-md-4 product-info ftco-animate">
					<div class="row">
						<c:forEach items="${products}" var="item" varStatus="status">
							<c:if test="${status.first }">
								<div class="col-md-12 mb-4">
									<%-- 	<h2 class="h4 mt-sm-3" id="productName">${item.productName }</h2> --%>
									<h2 class="h4 mt-sm-3" id="productName"></h2>
								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">餡料</p>
									<p>豬肉、胡麻油、起司、杏鮑菇、紅椒</p>
								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">美味菜單</p>
									<c:if test="${status.first }">
										<p>${item.briefInfo }</p>
									</c:if>

								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">價格</p>
									<p>
										大 <span>$</span><span class="price"
											data-id="${item.productId }"> ${item.unitPrice }</span>／ 小 <span>$</span><span
											class="price"
											data-id="${products[status.index+1].productId }">
											${products[status.index+1].unitPrice }</span>
									</p>
								</div>
								<div class="col-md-12 mb-3">
									<button type="button"
										class="btn btn-block btn-lg btn-outline-light rounded-full"
										id="addCart">加入訂單</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ModalDeliver.jsp" />
	<jsp:include page="fragment/Modalpizza.jsp" />

	<jsp:include page="fragment/ContentJS.jsp" />
	<script
		src="${pageContext.request.contextPath }/js/shopSystem/product.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/flatpickr.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.3/plugins/confirmDate/confirmDate.js"></script>
</body>
</html>