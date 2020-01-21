<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修改</title>
</head>
<body>
	<section>
		<div class='container'>
			<h1 style="text-align: center">會員資料修改</h1>
		</div>
	</section>
	<hr width='3'>
	<section class='container'>
		<form:form method='POST' modelAttribute="MembersBean"
			class='form-horizontal' action='${pageContext.request.contextPath}/memberSystem/doupdate'>
			<fieldset>
				<legend>會員資料修改</legend>

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
	</section>

</body>
</html>