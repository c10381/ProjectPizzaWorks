<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>Pizza Bite| Welcome</title>
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
	<section class="ftco-section contact-section">
		<div class="container mt-5">
			<div class="row block-9">
				<div class="col-md-6 ftco-animate">
					<form action="#" class="contact-form">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="您的大名">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="請留下您的Email">
								</div>
							</div>
						</div>
						<div class="form-group">
							<textarea name="" id="" cols="30" rows="7" class="form-control"
								placeholder="建議內容"></textarea>
						</div>
						<div class="row justify-content-between">
							<div class="form-group">
								<input type="reset" value="清除"
									class="btn btn-white btn-outline-white py-3 px-5">
							</div>
							<div class="form-group">
								<input type="submit" value="送出"
									class="btn btn-primary py-3 px-5">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<%-- <jsp:include page="fragment/chatBox.jsp" /> --%>
	<jsp:include page="fragment/ContentJS.jsp" />
	<script>
		$('.carousel').carousel({
			interval : 3000
		})
		$("#ftco-navbar #ftco-nav:first-of-type .active").removeClass("active");
	</script>

</body>
</html>