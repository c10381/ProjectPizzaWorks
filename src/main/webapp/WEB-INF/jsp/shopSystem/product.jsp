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

<style>
.pd-img{
display:flex;
align-items:center;
justify-content:center;
}

</style>
</head>
<body>

	<jsp:include page="fragment/navbar.jsp" />

	<!-- MainContent -->

	<section class="ftco-section contact-section">
		<div class="container mt-5">
			<div class="row staff">
				<c:forEach items="${products}" var="item" varStatus="status">
					<c:if test="${status.first }">
						<div class="col-md-5 ftco-animate pd-img">
							<img
								src="${pageContext.request.contextPath}/picture/${products[status.index].productId}"
								class="img-fluid" />
						</div>
					</c:if>
				</c:forEach>
				<div class="col-md-1"></div>

				<div class="col-md-5 product-info ftco-animate">
					<div class="row">
						<c:forEach items="${products}" var="product" varStatus="status">
							<c:if test="${status.first }">
								<div class="col-md-12 mb-4">
									<%-- 	<h2 class="h4 mt-sm-3" id="productName">${item.productName }</h2> --%>
									<h2 class="h4 mt-sm-3" id="productName"></h2>
								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">餡料</p>
									<c:forEach items="${product.recipes }" var="item" varStatus="s">
										<c:choose>
											<c:when test="${ item.material.materialsName == '高筋麵粉' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '低筋麵粉' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '酵母' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '橄欖油' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '鹽' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '糖' }">
											</c:when>
											<c:when test="${ item.material.materialsName == '油' }">
											</c:when>
											<c:otherwise>
											 ${item.material.materialsName }
											 <c:if test="${!s.last  }">、</c:if>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<!-- <p>豬肉、胡麻油、起司、杏鮑菇、紅椒</p> -->
								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">美味菜單</p>
									<c:if test="${status.first }">
										<p>${product.briefInfo }</p>
									</c:if>

								</div>
								<div class="col-md-12 mb-3">
									<p class="h5">價格</p>
									<!-- 依照有幾個相同名字的產品，來決定要顯示的價格 -->
									<c:choose>
										<c:when test="${status.first==status.last }">
										<span>$</span><span class="price"
											data-id="${product.productId }"> ${product.unitPrice }</span>
										</c:when>
										<c:otherwise>
										<p>
										    大 <span>$</span><span class="price"
											data-id="${product.productId }"> ${product.unitPrice }</span>／ 小 <span>$</span><span
											class="price"
											data-id="${products[status.index+1].productId }">
											${products[status.index+1].unitPrice }</span>
										</p>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-md-12 mb-3">
									<div class="row">
										<c:if test="${product.spicyLevel>=1 }">
											&nbsp<span class="icon icon-asterisk text-primary text-lg"> 辣 &nbsp</span>
										</c:if>
										<c:if test="${product.seafood==1 }">
											&nbsp<span class="icon icon-asterisk text-primary text-lg"> 海鮮 &nbsp</span>
										</c:if>
										<c:if test="${product.pork==1 }">
											&nbsp<span class="icon icon-asterisk text-primary text-lg"> 豬 &nbsp</span>
										</c:if>
										<c:if test="${product.beef==1 }">
											&nbsp<span class="icon icon-asterisk text-primary text-lg"> 牛 &nbsp</span>
										</c:if>
										<c:if test="${product.chicken==1 }">
											&nbsp<span class="icon icon-asterisk text-primary text-lg"> 雞 &nbsp</span>
										</c:if>
									</div>
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
	<script>
		 $(document).ready(function(){
			$("#ftco-navbar #ftco-nav:first-of-type li:nth-of-type(1)").addClass("active")
		 })
	</script>	
</body>
</html>