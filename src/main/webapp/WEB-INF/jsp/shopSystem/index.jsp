<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>Pizza Bite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="fragment/ContentCSS.jsp" />
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<style>
.carousel .carousel-item {
	height: 40vh;
}

.carousel .carousel-item img {
	min-height: 40vh;
	max-height: 50vh;
	object-fit: cover;
	object-position: center 60%;
}
</style>
</head>
<body>
	<jsp:include page="fragment/navbar.jsp" />

	<!-- MainContent -->
	<section class="ftco-section">
		<div class="container">
			<div id="carouselIndicators" class="carousel slide carousel-fade"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselIndicators" data-slide-to="1"></li>
					<li data-target="#carouselIndicators" data-slide-to="2"></li>
					<li data-target="#carouselIndicators" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="${pageContext.request.contextPath}/images/shopSystem/image_1.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/shopSystem/image_2.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/shopSystem/image_3.jpg"
							class="d-block w-100">
					</div>
					<div class="carousel-item">
						<img
							src="${pageContext.request.contextPath}/images/shopSystem/image_4.jpg"
							class="d-block w-100">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</section>


	
	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script >
	$('.carousel').carousel({
		  interval: 3000
		})
	</script>
	
</body>
</html>