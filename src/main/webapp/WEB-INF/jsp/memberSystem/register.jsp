<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<script type="text/javascript"></script>

<title>新會員註冊</title>

</head>
<body>
	<div id='container'>
		<div id='header'>
			<h1 style="text-align: center">新會員註冊</h1>
		</div>

		<form method='POST' id="register" class='form-horizontal'
			action="${pageContext.request.contextPath}/memberSystem/register">
			* 請輸入註冊信箱：<input id="email" name="email" type='email'
				placeholder='請輸入信箱' required='required' /><br>
			<div id='content'>
				<label for="password">* 請輸入密碼 (至少8碼，最多20碼，需包含大小寫英數字且不可含特殊字元)：</label> 
				<input id="password" name="password" type="password" placeholder='請輸入密碼' required='required' 
					maxlength='20' pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="密碼請符合輸入格式!" />
					<br> 
					<span id="result"></span> 
				<label>* 請再次輸入密碼 ：</label> 
				<input id='validpwd' name="validpwd" type="password" placeholder='請再次輸入密碼' required='required' maxlength='20'
					pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" /> 
					<div id="errbox"></div>
					<br>
				<input id='btnAdd' type="submit" value="送出" disabled/> <input id='btnReset' type="reset" value="重填" />
			</div>
		</form>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/shopManageSystem/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#password").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#validpwd").val();
				if (pwd2 != pwd1) {
					$("#btnAdd").prop("disabled", true);
					var errMsgP = document.createElement("p");
					$("#errbox").append(errMsgP);
					$("#errbox > p").attr("id","errMsg");
					$("#errMsg").text("密碼不一致，請確認您的輸入！");
				}else{
					$("#errMsg").remove();	
					$("#btnAdd").prop("disabled",false);
				}
			})
			
			$("#validpwd").change(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#validpwd").val();
				if (pwd2 != pwd1) {
					$("#btnAdd").prop("disabled", true);
					var errMsgP = document.createElement("p");
					$("#errbox").append(errMsgP);
					$("#errbox > p").attr("id","errMsg");
					$("#errMsg").text("密碼不一致，請確認您的輸入！");
				}else{
					$("#errMsg").remove();	
					$("#btnAdd").prop("disabled",false);
				}
			})
		})
	</script>
</body>
</html>