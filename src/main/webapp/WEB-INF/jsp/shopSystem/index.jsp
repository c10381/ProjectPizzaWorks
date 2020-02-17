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
							<p>Pizza Bite's 義式窯烤披薩。</p>
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

	<section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
	          <div class="col-md-7 heading-section ftco-animate text-center">
	            <h2 class="mb-4"><span class="text-primary">HOT</span>熱銷排行</h2>
	          </div>
        	</div>
        	<!-- /row -->
    	</div>
    	<!-- /Container -->
    	<div class="container-wrap">
    		<div class="row no-gutters d-flex">
    		</div>
    		<!-- /row -->
    	</div>
    	<!-- /container-wrap -->
    </section>	


	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script>
		$(function(){

			$('.carousel').carousel({
				interval : 2000
			}) 
			
			$.ajax({
	    		type : "GET", 
	    		url : "${pageContext.request.contextPath }/shop/topSales",
	    		dataType: "json",
			}).done(function(data){
				console.log(data);
				let str = ""; 
				for(let i = 0 ; i < data.length; i++){
					str += generate_services_wrap(data[i], i); 
				}
				 $(".container-wrap .row").html(str);  
			})
		})
    				
		
		function generate_services_wrap(product , index){
			let productName  = product.productName;
			let len = productName.length; 
			let size = productName.substring(len-2,len-1);
			
			if(productName.substring(len-1,len)==')'){
				productName = productName.substring(0,(len-3));
			}
			let productPrice = product.unitPrice; 
			if(size =='大'){
				productPrice -= 100; 
			} 
			
			let str = ''; 
				str += '<div class="col-lg-4 d-flex ftco-animate fadeInUp ftco-animated">' ;
				str +=		'<div class="services-wrap d-flex">' ; 
			
				if(Math.floor(index/3) == 0){
				str += 			'<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath}/picture/'+product.productId+') ; background-size:contain"></a> ';
				str +=			'<div class="text p-4">';
				str +=				'<h3>'+ productName +'</h3>';
				str +=				'<p>'+ product.briefInfo+ '</p>';
				str +=				'<p class="price"><span>$'+productPrice+' 起</span> <a href="#" class="ml-2 btn btn-white btn-outline-white">立即訂購</a></p>';
				str +=			'</div>';
			}else{
				str +=			'<div class="text p-4">';
				str +=				'<h3>'+ productName +'</h3>';
				str +=				'<p>'+ product.briefInfo+ '</p>';
				str +=				'<p class="price"><span> $'+  productPrice+' 起</span> <a href="#" class="ml-2 btn btn-white btn-outline-white">立即訂購</a></p>';
				str +=			'</div>';
				str += 			'<a href="#" class="img" style="background-image: url(${pageContext.request.contextPath}/picture/'+product.productId+'); background-size:contain;"></a>';
			}
				str +=		'</div>';
				str +=	'</div>';
				str +=  '<!--/產品 -->'
			return str ; 
		}
	</script>
</body>
</html>