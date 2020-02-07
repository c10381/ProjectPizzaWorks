<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>驗證成功</title>
<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/memberSystem/login">

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
	
</head>
<body>

	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">
		
		<div id='container justify-content-center'>	
			<h2>${MembersBean.lastName}${MembersBean.firstName}您好！</h2>
			<h3>信箱驗證成功，畫面將在3秒後自動跳轉至登入頁面!</h3>
			<h3>請準備好您的神奇小卡，並享受一段味蕾的刺激旅程...</h3>
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />

</body>
</html>