<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- START footer -->
<footer class="ftco-footer ftco-section img">
	<div class="overlay"></div>
	<div class="container">
		<div class="row mb-5">
			<div class="col-lg-3 col-md-6 mb-5 mb-md-5">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">About Us</h2>
					<p>「 PIZZA 是最獨立的食物。 不管在哪裡、做什麼，吃 PIZZA 都可以是一件很酷的事 。」
對於獨特、經典和忠於原味的精神，在 PIZZA 這件事情上，也差不多是時候了。</p>
					<ul
						class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
						<li class="ftco-animate"><a href="#"><span
								class="icon-twitter"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-facebook"></span></a></li>
						<li class="ftco-animate"><a href="#"><span
								class="icon-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 mb-5 mb-md-5">
			</div>
			<div class="col-lg-2 col-md-6 mb-5 mb-md-5">
				<div class="ftco-footer-widget mb-4 ml-md-4">
					<h2 class="ftco-heading-2">提供服務</h2>
					<ul class="list-unstyled">
						<li><a href="#" class="py-2 d-block">美食</a></li>
						<li><a href="#" class="py-2 d-block">外送</a></li>
						<li><a href="#" class="py-2 d-block">派對聚會</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 mb-5 mb-md-5">
				<div class="ftco-footer-widget mb-4">
					<h2 class="ftco-heading-2">聯絡我們</h2>
					<div class="block-23 mb-3">
						<ul>
							<li><span class="icon icon-map-marker"></span><span
								class="text address">106台北市大安區復興南路一段390號</span></li>
							<li><span class="icon icon-phone"></span><span
									class="text phone">02 6631 6666</span></li>
							<li><span class="icon icon-envelope"></span>
								<span class="text email">info@pizzaaabbcc.com</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">

				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</div>
</footer>
<jsp:include page="chatBox.jsp" />
<!-- END footer -->
 	<script>
 	let contextPath = "${pageContext.request.contextPath}";
		<c:if test="${CLoginOK!=null }">
 		let memCheck = true;
 		let customerEmail = "${CLoginOK.email}";
 		let fromFirstName = "${CLoginOK.firstName}";
 		let fromLastName = "${CLoginOK.lastName}";
 		</c:if>
 	</script>

