<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>Pizza|產品介紹</title>
<meta charset="utf-8">
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
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h2 class="mb-4">披薩口味</h2>
					<p class="flip">
						<span class="deg1"></span><span class="deg2"></span><span
							class="deg3"></span>
					</p>
					<p>引進高溫烘烤技術，秉持快速、經典、道地的原則提供特色義式比薩。</p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mx-auto">
				<!-- 當產品簡介與上一個不相等時（代表跟上一個非同一產品）則可以顯示 -->
				<c:forEach var='product' items='${products}' varStatus="status">

					<c:if
						test="${product.briefInfo!= products[status.index-1].briefInfo}">
						<div class="col-lg-4 col-md-6 mt-5 text-center ">
							<div class="menu-wrap">
								<a href="#" class="menu-img img mb-4"
									style="background-image: url(${pageContext.request.contextPath}/picture/${product.productId});"></a>
								<div class="text">
									<h3>
										<%  %>
									
										<c:set var="originalName" value="${product.productName }" />
										<c:set var="length" value="${fn:length(originalName) }" />
										<c:set var="showName"
											value="${fn:substring(originalName,0,6) }" />
										<a href="#">${showName }</a>
									</h3>
									<p class="price">
										<span class="pizza-lg mr-3 ">L ${product.unitPrice }</span> <span
											class="pizza-sm">S
											${products[status.index+1].unitPrice }</span>
									</p>
									<p>
										<a
											href='<spring:url value="/shop/product?name=${showName }"/>'
											class="ml-2 btn btn-white btn-outline-white mr-2">了解更多</a> <a
											href="#" class="btn btn-white btn-outline-white">快速訂購</a>
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
</body>
</html>