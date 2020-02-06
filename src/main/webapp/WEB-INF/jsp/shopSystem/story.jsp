<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
<!-------- Section ----------->
	<section class="ftco-intro">
		<div class="container-wrap">
			<div class="wrap d-md-flex">
				<div class="info">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon"><span class="icon-phone"></span></div>
							<div class="text">
								<h3>02 6631 6666</h3>
								<p>Pizza 就是應該大吃一口</p>
							</div>
						</div>
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon"><span class="icon-my_location"></span></div>
							<div class="text">
								<h3>106台北市大安區</h3>
								<p>復興南路一段390號</p>
							</div>
						</div>
						<div class="col-md-4 d-flex ftco-animate">
							<div class="icon"><span class="icon-clock-o"></span></div>
							<div class="text">
								<h3>Open 星期一-星期六</h3>
								<p>11:00am - 9:00pm</p>
							</div>
						</div>
					</div>
				</div>
				<div class="social d-md-flex pl-md-5 p-4 align-items-center">
					<ul class="social-icon">
						<li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
<!-------- End Section ----------->
<!-------- Section ----------->
	<section class="ftco-about d-md-flex">
		<div class="one-half img" style="background-image: url(${pageContext.request.contextPath}/images/shopSystem/about.jpg);"></div>
		<div class="one-half ftco-animate">
			<div class="heading-section ftco-animate ">
				<h2 class="mb-4">Welcome to <span class="flaticon-pizza">Pizza</span> BITE</h2>
			</div>
			<div>
				<p>你好，我們是義式披薩餐廳
我們不賣創意料理，只賣義大利料理
歡迎對義大利料理有熱情的伙伴加入

我們除了道地的披薩以外，也提供多道義式經典小吃與麵食
有興趣可到我們粉絲頁觀看我們菜單與餐廳簡介

經營理念
我們的旅程始於一個簡單的想法：做出道地的義大利披薩</p>
			</div>
		</div>
	</section>
<!-------- End Section ----------->

	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
<script>
 $(document).ready(function(){
	$("#ftco-navbar #ftco-nav:first-of-type .active").removeClass("active");
	$("#ftco-navbar #ftco-nav:first-of-type li:nth-of-type(2)").addClass("active")
 
 
 
 })

</script>	
</body>
</html>