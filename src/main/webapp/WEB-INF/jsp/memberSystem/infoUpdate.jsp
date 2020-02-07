<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<title>會員資料修改</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->

</head>
<body>
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">
		<div id='container justify-content-center'>
			<div id='header'>
				<h1 style="text-align: center">聯絡資料修改</h1>
			</div>
		
		
		<form:form method='POST' modelAttribute="MembersBean"
			class='form-horizontal' action='${pageContext.request.contextPath}/memberSystem/doupdate'>
			<fieldset>
				<legend>聯絡資料修改</legend>

				<br> <label>地址 ：</label>
				<form:input id="address" path="address" type="text"
					value='${CLoginOK.address}'	required='required' />

				<br> <label>連絡電話 ：</label>
				<form:input id="cellphone" path="cellphone" type="text"
					value='${CLoginOK.cellphone}'	required='required' />

				<br> <input id='btnAdd' type="submit" value="送出" /> 
					 <input id='btnReset' type="reset" value="重填" />
			</fieldset>
		</form:form>
		</div>
	</section>
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
</body>
</html>