<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/memberSystem/passwordscheck.css" />
<script src="${pageContext.request.contextPath}/js/memberSystem/passwordscheck.js"></script>
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro|Open+Sans+Condensed:300|Raleway' rel='stylesheet' type='text/css'> -->

<title>會員註冊</title>

</head>
<body>
	<div id='container'>
			<div id='header'>
				<h1 style="text-align: center">新會員註冊</h1>
			</div>
	
			<form method='POST' id="register" class='form-horizontal' action="${pageContext.request.contextPath}/memberSystem/register">					
					* 請輸入註冊信箱：<input id="email" name="email" type='email' placeholder='請輸入信箱' required='required' /><br>
					<div id='content'>
					<label for="password">* 請輸入密碼 (最多輸入16位，且不可含特殊字元) ：</label>
					<input id="password" name="password" type="password" placeholder='請輸入密碼' required='required' maxlength='20' /><br> 
					<span id="result"></span> 
					<label>* 請再次輸入密碼 ：</label> 
					<input id='validpwd' name="validpwd" type="password" placeholder='請再次輸入密碼' required='required' maxlength='20' /><br> 
						<input id='btnAdd' type="submit"value="送出" /> 
						<input id='btnReset' type="reset" value="重填" />
					</div>				
			</form>
	</div>
</body>
</html>