<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    

<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">	
<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/memberSystem/login">	
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

<title>註冊成功</title>
</head>
<body>
	
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">
	
		<div id='header'>
				<h1 style="text-align: center">註冊成功</h1>
		</div>
		
		<div id='container justify-content-center'>	
			<h2 class='col-md-4 mx-auto align-items-center' style="text-align: center">請至信箱收取驗證信以啟用帳號</h2><br>
			<h2 class='col-md-4 mx-auto align-items-center' style="text-align: center">畫面將導入至登入畫面...</h2>
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
</body>
</html>