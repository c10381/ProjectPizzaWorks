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
	<div class="one-half ftco-animate">
			<div class="heading-section ftco-animate ">
				<h2 class="mb-4">Pizza</h2>
			</div>
			<div>
<pre>
那不勒斯，義大利的南方小鎮，臨海、艷陽高照，它是義大利民謠、曼陀林和披薩的故鄉。
空氣中有海的鹹味，還有披薩新鮮出爐的香氣…
外脆內薄的那不勒斯披薩，口感鬆軟、帶有原始麥香，淋上頂級初榨橄欖油、
新鮮番茄熬製的番茄醬等配料，是義大利的正宗吃法

正統的那不勒斯披薩，從麵團裡加的水與鹽巴，到和麵團的攪拌機及烤披薩的窯爐等，
食材、工法、設備，每一個細節都要遵守一整套嚴謹的規範，才能得到協會認可，
才能稱得上是<span>正統那不勒斯披薩</span>。


餅皮是披薩的靈魂，也是PizzaBite最講究的地方。
只用披薩專用的義大利麵粉和入海鹽和礦泉水，
經過8小時以上的發酵，每日新鮮製作，麵團絕不隔餐使用。技法更採手工拍皮，
在430-480度爐溫下烘烤60-90秒，製作出Q軟有嚼勁，飄散迷人麥香的正統披薩，
就連邊緣的餅皮，單吃也很美味
￼</pre>
								</div>
		</div>
		<div class="one-half img" style="background-image: url(${pageContext.request.contextPath}/images/shopSystem/about2.jpg);"></div>
		
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