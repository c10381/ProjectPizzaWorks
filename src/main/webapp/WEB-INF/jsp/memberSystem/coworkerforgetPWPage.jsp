<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- icon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/images/shopSystem/icon.png">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/all.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/backendSystem/adminlte.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">
</head>

<body class="hold-transition login-page"
	style="background: url(${pageContext.request.contextPath}/images/shopSystem/bg_4.jpg) no-repeat fixed;background-size: cover;">
		<div class="login-box" style="background: transparent;">
			<div class="login-logo">
				<b style="color: #fac564;">Pizza Bite Manager<br>Forget Password</b>
			</div>
			<!-- /.login-logo -->
			<div class="card">
				<div class="card-body login-card-body" style="background: url(${pageContext.request.contextPath}/images/shopSystem/bg_4.jpg) no-repeat fixed;background-size: cover;">
					<p class="login-box-msg">${errorMessage}</p>
					
						<div class="input-group mb-3">
							<input type="email" class="form-control" placeholder="Email"
								name="email" value="" id="email" style="border-color: #fac564;border-width:2px;">
							<div class="input-group-append">
								<div class="input-group-text" style="color: #fac564;border-color: #fac564;border-width:2px;">
									<span class="fas fa-envelope"></span>
								</div>
							</div>
						</div>
						
						<div class="row justify-content-between">
							
							<!-- /.col -->
							<div class="col-4">
								<a href="${pageContext.request.contextPath}/admin"><button class="btn btn-block btn-seconary" style="background: #fac564;">
									返回首頁
								</button></a>
							</div>
							<!-- /.col -->
							<!-- /.col -->
							<div class="col-5">
								<button type="submit" class="btn btn-block btn-seconary" style="background: #fac564;" onclick="SendToBack()">通知管理者</button>
							</div>
							<!-- /.col -->
						</div>

					<!-- /.social-auth-links -->

					<p class="mb-1"></p>

					<!-- /.login-card-body -->
				</div>
			</div>
			<!-- /.login-box -->
			<!-- Login Demo btns-->
			<footer class="footer fixed-bottom justify-content-center align-self-center">
				<div style="margin: 0 auto 50px auto; width: 100px" class="justify-content-center align-items-center">
					<div id="admin" class="btn btn-default btn-md" style="margin: 5px;background: #fac564;color: black;">一鍵輸入</div>
					
				</div>
			</footer>
	</div>
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/js/backendSystem/adminlte.min.js"></script>
	<!-- sweetalert -->
    <script src="${pageContext.request.contextPath}/js/backendSystem/sweetalert.min.js"></script>
	<script>
	$().ready(function(){
		$("#admin").click(function(){
			$("#email").val("asd@pizza.com");
		});
	});
	function SendToBack() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/memberSystem/coworkforgetPWrequest",
						data : {
							"email" : $("#email").val()
						},
						type : "Get",
						error : function() {
							alert("Something Wrong.");
						},
						success : function(data) {
							console.log(data);
							$("#SendButton").empty();
							if(data=="ok"){
								swal({
									text: "已成功送出申請",
									icon: "success",
									buttons: {
										 catch: {
										      text: "OK",
										      value: true,
										    },
										  },
									}).then((value)=>{
										window.location.replace("${pageContext.request.contextPath}/admin");
										});
								$("#SendButton").append("<div class='col-8'>已通知管理員</div>");
							}else{
								$("#SendButton").append("<div class='col-8'>系統無此Email</div>");
							}
							
						}
					})
		}
	</script>
</body>
</html>
