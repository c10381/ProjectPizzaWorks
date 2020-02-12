<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Pizza|產品介紹</title>
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
			<div class="row mx-auto menu">
				<!-- 當產品簡介與上一個不相等時（代表跟上一個非同一產品）則可以顯示 -->
				<c:forEach var='product' items='${products}' varStatus="status">
					<c:if
						test="${product.briefInfo!= products[status.index-1].briefInfo}">
						<div class="col-lg-4 col-md-6 mt-5 text-center ">
							<div class="menu-wrap" data-id="${product.productId}">
								<a href="#" class="menu-img img mb-4"
									style="background-image: url(${pageContext.request.contextPath}/picture/${product.productId});"></a>
								<div class="text">
									<h3>
										<c:set var="originalName" value="${product.productName }" />
										<c:set var="showName"
											value="${fn:split(originalName,'//(')[0] }" />
										<a href="#">${showName }</a>
									</h3>

									<c:choose>
										<c:when
											test="${ (product.briefInfo!=products[status.index-1].briefInfo) &&  (product.briefInfo!=products[status.index+1].briefInfo)}">
											<p>
												<span class="price pizza-one mr-3 ">${product.unitPrice }</span>
											</p>
										</c:when>
										<c:otherwise>
											<p>
												<span class="price pizza-lg mr-3 ">${product.unitPrice }</span>
												<span class="price pizza-sm">${products[status.index+1].unitPrice }</span>
											</p>
										</c:otherwise>
									</c:choose>

									<p>
										<a
											href='<spring:url value="/shop/product?name=${showName }"/>'
											class="ml-2 btn btn-white btn-outline-white mr-2">了解更多</a>
										<button class="btn btn-white btn-outline-white"
											data-id="${product.productId }">快速訂購</button>
									</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- pizza Modal-->
	<div class="modal fade order_modal" id="pizzaModal" tabindex="-1"
		role="dialog" aria-labelledby="PizzaModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-dark" id="PizzaModalLabel">請選擇您的披薩</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<h5 class="text-light py-3"></h5>
					<div class="row-fluid">
						<div class="form-group">
							<label for="pizzaSize" class="md_label">披薩尺寸:</label> 
							
							<select name="pizzaSize"
								id="pizzaSize" class="md_content">
								<option value="large">大</option>
								<option value="small">小</option>
							</select>
						</div>
						<div class="form-group">
							<label for="qtty"  class="md_label">數量</label> <select name="qtty" id="qtty" class="md_content"></select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="form-group">
							<label for="crust"  class="md_label">請選擇餅皮</label> <select name="crust" id="crust" class="md_content"></select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="form-group ">
							<div class="col align-items-center">
								<input type="checkbox" name = "doubleCheese" id = "doubleCheese" >
								<label for ="doubleCheese" class="md_label">雙倍起司 +25</label>
							</div>
						</div>
					</div>
					
				</div>
				<div class="modal-footer">
					<c:forEach items="${ products}" var="item" varStatus="status">
						<c:if test="${status.first }">
							<button class="btn btn-primary" type="button"
								data-dismiss="modal">
								放入購物車 <span class="amount"> </span>
							</button>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ModalDeliver.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script src="${pageContext.request.contextPath }/js/shopSystem/menu.js"></script>
	<script>
		$(document).ready(
				function() {
					$("#ftco-navbar #ftco-nav:first-of-type li:nth-of-type(1)")
							.addClass("active")
				})
	</script>
</body>
</html>