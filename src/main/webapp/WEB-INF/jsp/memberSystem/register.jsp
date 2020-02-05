<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">


<title>新會員註冊</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->
<style>
#errbox {
	display: inline-block;
}
</style>
</head>
<body>
	<!-- ----- -->
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<!-- ----- -->

	<!-- 把東西放到section / container div -->
	
	<section class="ftco-section">
		<div id='container justify-content-center'>

			<div id='header'>
				<h1 style="text-align: center">新會員註冊</h1>
			</div>

			<form method='POST' id="register" class='col-md-6 mx-auto align-items-center needs-validation'
				
				novalidate action="${pageContext.request.contextPath}/memberSystem/register">
				<!--form starts-->
				<div class='form-row form-group'>
                		<label for="email" class="col-form-label col-sm-3 align-self-center">* 請輸入註冊信箱：</label>
                		<!-- col end-->
                		<input id="email" name="email" class="form-control col-sm-6" type='email' placeholder='請輸入註冊信箱'  required />
            			<!-- col end-->
            			<div class='col-sm-3 align-self-center' id='email_errbox'></div>
            			<!-- col end-->
    			</div>
    			<!-- row form-group ends-->	
						
				<div class="form-row form-group">
						<label for="password" class="col-form-label col-sm-3 align-self-center">* 請輸入密碼：</label> 
						<!-- col end-->
						<input id="password" name="password" type="password" placeholder='請輸入密碼' required
					 	       maxlength='20' pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" title="密碼請符合輸入格式!"
					 		   class="form-control col-sm-6"/>
						<!-- col end-->
						<small id="pwdReminder" class="form-text text-muted col-sm-3 align-self-center">
						(至少8碼，最多20碼 <br>需包含大小寫英數字<br>不可含特殊字元) 
						</small>
						
						<!-- col end-->
				</div>
    			<!-- row form-group end-->	
				<div class="form-row form-group">
					<label for="validpwd" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼 ：</label> 
					<!-- col end-->
					<input id='validpwd' name="validpwd" type="password" placeholder='請再次輸入密碼' 
						   required maxlength='20' class="form-control col-sm-6"/>
					<!-- col end-->
					<div class='col-sm-3 align-self-center' id='validpwd_errbox'></div>					
					<!-- col end-->
				</div>
    			<!-- row form-group end-->	
				<br> 
				<div class="row">
					<input type='button' id='btnAuto' value="一鍵輸入"  class="btn btn-white btn-outline-white col-sm-2"/>
					<!-- col end-->
					<div class="col-sm-6"></div>
					<!-- col end-->
					<input id='btnReset' type="reset" value="重填" class="btn btn-primary col-sm-2"/> 
					<!-- col end-->
					<input id='btnAdd' type="submit" value="送出"  class="btn btn-primary col-sm-2"/>
					<!-- col end-->
				</div> 
				<!-- row end -->
			</form>
		</div>
	</section>

	
	<!-- ----- -->

	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />

	<!-- ----- -->
	<script type="text/javascript">
	

		
	$("#btnAuto").click(function() {
		$("#email").val("iiiedujava@gmail.com");
		$("#password").val("Java8888");
		$("#validpwd").val("Java8888");
	})
	
	$('#btnReset').click(function(){
		$("#btnAdd").prop("disabled", true);
	})
	
	
	$('form').submit(function(event){
		event.preventDefault();
		console.log('reach');
		var email = $('#email').val();
		var pwd = $('#password').val();
		var validpwd = $('#validpwd').val();
		if(email == ''){
			console.log('reach2');
			event.preventDefault();
			console.log('reach3');
		}		
	})
	
		/* function emailWarning(){
			var email = $('#email').val();
			if (email == null || email === '') {
				var mail_errMsg_span = document.createElement("span");
				$("#email_errbox").html(mail_errMsg_span);
				$("#email_errbox > span").attr("id", "email_errMsg");
				$("#email_errMsg").text("請輸入帳號");
				$("#email_errMsg").attr({
					"class" : "text",
					"class" : "text-danger"
				})
			} else {
				$("#email_errMsg").remove();
			}
		} */
		
		/* $(function() {
			
			//使用者滑鼠離開後會判斷input是否為空
			$('#email').blur(function(){
				var email = $('#email').val();
				if (email == null || email === '') {
					var mail_errMsg_span = document.createElement("span");
					$("#email_errbox").append(mail_errMsg_span);
					$("#email_errbox > span").attr("id", "email_errMsg");
					$("#email_errMsg").text("請輸入帳號");
					$("#email_errMsg").attr({
						"class" : "text",
						"class" : "text-danger"
					})
				} else {
					$("#email_errMsg").remove();
				}
			});
			
			//使用者滑鼠離開後會判斷input是否為空
			
			

			$("#password").blur(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#validpwd").val();
				if (pwd2 != pwd1 || pwd1===null || pwd2===null) {
					$("#btnAdd").prop("disabled", true);
					var errMsgP = document.createElement("span");
					$("#errbox").append(errMsgP);
					$("#errbox > span").attr("id", "errMsg");
					$("#errMsg").text("密碼不一致，請確認您的輸入！");
					$("#errMsg").attr({
						"class" : "text",
						"class" : "text-danger"
					})
				} else {
					$("#errMsg").remove();
					$("#btnAdd").prop("disabled", false);
				}
			})

			$("#validpwd").blur(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#validpwd").val();
				if (pwd2 != pwd1  || pwd1===null || pwd2===null) {
					$("#btnAdd").prop("disabled", true);
					var errMsgP = document.createElement("span");
					$("#errbox").append(errMsgP);
					$("#errbox > span").attr("id", "errMsg");
					$("#errMsg").text("密碼不一致，請確認您的輸入！");
					$("#errMsg").attr({
						"class" : "text",
						"class" : "text-danger"
					})
				} else {
					$("#errMsg").remove();
					$("#btnAdd").prop("disabled", false);
				}
			})

			$("#register").submit(function() {
				var pwd1 = $("#password").val();
				var pwd2 = $("#validpwd").val();
				
				
				if (pwd2 != pwd1 ) {
					$("#btnAdd").prop("disabled", true);
					var errMsgP = document.createElement("span");
					$("#errbox").append(errMsgP);
					$("#errbox > span").attr("id", "errMsg");
					$("#errMsg").text("密碼不一致，請確認您的輸入！");
					$("#errMsg").attr({
						"class" : "text",
						"class" : "text-danger"
					})
				}else if(pwd1 ===null || pwd2===null){
					$("#btnAdd").prop("disabled", true);
				} 
				
				else {
					$("#errMsg").remove();
					$("#btnAdd").prop("disabled", false);
				}
			})
		}) */
	</script>
</body>
</html>