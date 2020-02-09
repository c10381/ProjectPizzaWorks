<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="refresh" content="3;url=${pageContext.request.contextPath}/memberSystem/login">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

<title>修改成功</title>
</head>
<body>
	
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<section class="ftco-section">
	<div id='container justify-content-center'>
	
	<h2 style="text-align: center" class='col-md-4 mx-auto align-items-center'>修改成功</h2>
	
	</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
</body>
</html>