<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

	<script src="https://apis.google.com/js/platform.js" async defer></script>
   	<meta name="google-signin-client_id" content="902805842893-0r20ucidti2jn2t555g5li2kohpp8i2n.apps.googleusercontent.com">

	<title>Pizza Bite 會員登入</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="viewport" 
		content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/shopSystem/chatBox.css">
	</head>
<body>	
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">		
		<div id='container justify-content-center'> 
		
			<div id='header'>
				<h1 style="text-align: center">Pizza Bite 會員登入</h1>
			</div>
						
			<form action="${pageContext.request.contextPath}/memberSystem/loginCheck" method="post" 
				  class="col-md-6 mx-auto align-items-center">
				
				<div class="form-row form-group">
					<div class="col-sm-3"></div>
					<label for="email" class="col-form-label col-sm-1 align-self-center">帳號：</label>
					<input id='email' type="email" class="form-control col-sm-3" name="email" required autocomplete="off">
					<div class="col-sm-3 align-self-center text-danger" id="email_err">${email_errMsg}</div>
				</div>
					
				<div class="form-row form-group">
					<div class="col-sm-3"></div>
					<label for="password" class="col-form-label col-sm-1 align-self-center">密碼：</label>
					<input id='password' type="password" class="form-control col-sm-3" name="password" required>						
					<div class="col-sm-3 align-self-center text-danger" id="pwd_err">${pwd_errMsg}</div>					
				</div>
					
				<div class="row">
					<div class="col-sm-3"></div>									
					<input type="button" id="Demo1" class="btn btn-white btn-outline-white col-sm-1" value="Demo1" />
					<div>&nbsp;</div>
					<input type="button" id="Demo2" class="btn btn-white btn-outline-white col-sm-1" value="Demo2" />
					<div class="col-sm-2"></div>																
						<!-- /.col -->					
					<button type="submit" class="btn btn-primary col-sm-2">登入</button>
					
					<!-- /.col -->
				</div>
				<div>&nbsp;</div>
				<div class="row">
					<div class="col-sm-3"></div>
					<p class="mb-1">
						<a href="${pageContext.request.contextPath}/memberSystem/forgetpwd">忘記密碼</a>
					</p>		
				</div>
				<div class="row">
					<div class="col-sm-3"></div>	
					<p class="mb-1">
						<a href="${pageContext.request.contextPath}/memberSystem/register">註冊</a>
					</p>
				</div>
				
				<div class="row">
					<div class="col-sm-3"></div>	
					<p class="mb-1">
						<a href="${pageContext.request.contextPath}/PaypalTest/testCheckout">Paypal</a>
					</p>
				</div>
				
				
			</form>								 	
		</div>			
	</section>
		
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
	<script>
		
	$("#Demo1").click(function() {
		console.log('reach');
		$("#email").val("iiiedujava@gmail.com");
		$("#password").val("P@ssw0rd");
	})
	
	$("#Demo2").click(function() {
		$("#email").val("c10381@gmail.com");
		$("#password").val("P@ssw0rd");
	})
	
	</script>	
</body>
</html>