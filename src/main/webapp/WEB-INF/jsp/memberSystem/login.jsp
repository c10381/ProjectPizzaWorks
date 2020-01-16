<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">
</style>
<title>會員登入</title>

</head>
<body>
	<section>
		<div class='container'>
			<h1 style="text-align: center">會員登入</h1>
		</div>
	</section>
	<hr width='3'>
	<section class='container'>
		<form:form method='POST' modelAttribute="MembersBean" action='${pageContext.request.contextPath}/memberSystem/loginCheck' 
			class='form-horizontal'>
			<fieldset>
				<legend>登入</legend>
				<label> 請輸入信箱：</label>
				<form:input id="email" path="email" type='text' placeholder='請輸入信箱'
					required='required' />
				<br> <label> 請輸入密碼：</label>
				<form:input id="password" path="password" type="password"
					placeholder='請輸入密碼' required='required' maxlength='16' />
				<br> <input id='btnAdd' type="submit" value="送出" /> <input
					id='btnReset' type="reset" value="重填" />	
			</fieldset>
		</form:form>		
	</section>
	<p style='color: red;'>${errorMessage}</p>
</body>
</html>