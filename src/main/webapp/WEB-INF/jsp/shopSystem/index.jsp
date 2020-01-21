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
</head>
<body>
	<jsp:include page="fragment/navbar.jsp" />

	<!-- MainContent -->
	<section class="ftco-section">
		<h1>我好像是首頁</h1>
	</section>



	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script src="${pageContext.request.contextPath }/js/shopSystem/cart.js"></script>
</body>
</html>