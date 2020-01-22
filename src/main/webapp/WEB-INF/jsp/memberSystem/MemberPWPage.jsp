<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>忘記密碼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="hold-transition login-page">
	<div class="login-box" style="width: 30%; margin:auto;">
		<!-- 佔位子用的 -->
		<div style="height: 30px; margin:auto;"></div>
		<div class="login-logo">
			<a href="../../index2.html"><b>更改密碼</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<div class="login-box-msg">${errorMessage}</div>
				<div class="login-box-msg">${CLoginOK.lastName}</div>
				<form
					action="${pageContext.request.contextPath}/memberSystem/coworkerchangePW"
					method="Post">
					<input type="hidden" class="form-control" id="email" name="email"
						value="${Mem_LoginOK.email}">

					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="請輸入新密碼"
							id="password" name="password">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="請重新輸入新密碼"
							id="Compassword" name="comfirmPassword">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					
					<!-- 佔位子空格用 -->
					<div class="login-box-msg"></div>
					<!-- /.social-auth-links -->
					<div class="row">
						<div class="col-12">
							<div id="SendButton">
								<button class="btn btn-primary btn-block">送出變更密碼</button>
							</div>
						</div>
						<!-- /.col -->
					</div>



				</form>

			</div>
		</div>
	</div>
	<!-- /.login-box -->
	<script>
	/* function submit(){

		$.ajax({
            contentType : 'application/json; charset=utf-8',
            type: "POST",
            url:'${pageContext.request.contextPath}/memberSystem/coworkerchangePW',
            dataType : 'json',
            data : {
                "email":$("#email").val(),
                "password":$("#password").val(),
                "comfirmPassword":$("#Compassword").val(),
                },
            success : 
            	window.location.replace(data);,
            error : function(){
                console.log(callback);
            }
        });
 */
		
		}
	</script>
</body>

</html>