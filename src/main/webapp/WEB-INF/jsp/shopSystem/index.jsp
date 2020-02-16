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
}

.carousel .carousel-item img {
	min-height: 70vh;
	max-height: 80vh; 
	object-fit: cover;
	object-position: center;
}

#carouselIndicators {
	height: 80vh; 

}
</style>
</head>
<body>

	<jsp:include page="fragment/navbar.jsp" />
	<!-- MainContent -->
	 <section style="padding-top:2em; padding-bottom:2em;  ">
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
	</section> 
	 <section class="ftco-section ftco-services">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h2 class="mb-4">我們的服務</h2>
					<p>堅持 | 新鮮 | 真實 | 手作</p>
					<p>享受美食，也可以沒有負擔！ 新鮮、天然、美味是Pizza Bite深信不移的理念。</p>
				</div>
			</div>
			<!-- /row -->
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div class="icon d-flex justify-content-center align-items-center mb-5">
							<span class="flaticon-diet"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">美味pizza</h3>
							<p>Pizza Bite's 義式窯烤披薩、義式半月型派餅、沙拉...等。</p>
						</div>
					</div>
				</div>
				<!-- / col-->
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div class="icon d-flex justify-content-center align-items-center mb-5">
							<span class="flaticon-bicycle"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">外送服務</h3>
							<p>懶得出門想叫外送？Pizza Bite讓你在家中也能享用美味的Pizza</p>
						</div>
					</div>
				</div>
				<!-- / col-->
				<div class="col-md-4 ftco-animate">
					<div class="media d-block text-center block-6 services">
						<div class="icon d-flex justify-content-center align-items-center mb-5"><span
								class="flaticon-pizza-1"></span></div>
						<div class="media-body">
							<h3 class="heading">最好的食材</h3>
							<p>使用最好的食材是毋庸置疑的。Pizza Bite堅持絕不販賣我們自己不會吃或是不會給家人吃的食物。</p>
						</div>
					</div>
				</div>
				<!-- / col-->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</section>
	<!-- /section  -->



	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script>
		 $('.carousel').carousel({
			interval : 2000
		}) 
	</script>
</body>
</html>