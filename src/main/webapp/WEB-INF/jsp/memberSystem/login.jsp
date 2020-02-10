<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">

<title>會員登入</title>
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

		<div class='login-box col-lg-4 col-sm-6 col-md-6 mx-auto align-items-center needs-validation'> 
		<div class="login-logo" id='header'>
			<a href="#"><b>Pizza Bite</b>會員登入</a>
		</div>
		<!-- /.login-logo -->
			<div id='container justify-content-center'>
		<!-- <div class="card">
			<div class="card-body login-card-body"> -->				
				<form action="${pageContext.request.contextPath}/memberSystem/loginCheck" method="post">
					<div class="input-group mb-3">
						<input id='email' type="email" class="form-control" placeholder="請輸入信箱" name="email" required autocomplete="off">
						<div class="col-sm-4 align-self-center text-danger" id="email_err">${email_errMsg}</div>
					</div>
					
					<div class="input-group mb-3">
						<input id='password' type="password" class="form-control" placeholder="請輸入密碼" name="password" required>						
						<div class="col-sm-4 align-self-center text-danger" id="pwd_err">${pwd_errMsg}</div>					
					</div>
					
					<div class="row">
						
						<div class="col-4">
							<input type="button" id="Demo1" class="btn btn-white btn-outline-white" value="Demo1" />
							<input type="button" id="Demo2" class="btn btn-white btn-outline-white" value="Demo2" />
						</div>
																
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				<p class="mb-1">
					<a href="${pageContext.request.contextPath}/memberSystem/forgetpwd">忘記密碼</a>
				</p>
				
				<p class="mb-1">
					<a href="${pageContext.request.contextPath}/memberSystem/register">註冊</a>
				</p>			
		</div>
	</div>
	
	</section>
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
	<script type="text/javascript">
		
	$("#Demo1").click(function() {
		console.log('reach');
		$("#email").val("iiiedujava@gmail.com");
		$("#password").val("Java8888");
	})
	
	$("#Demo2").click(function() {
		$("#email").val("c10381@gmail.com");
		$("#password").val("Java8888");
	})
	
	</script>	
</body>
</html>