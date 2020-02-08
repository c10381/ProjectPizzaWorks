<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>密碼修改</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->

</head>
<body>
	<!-- ----- -->
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<!-- ----- -->
	<section class="ftco-section">
		<div id='container justify-content-center'>
		
			<div id='header'>
				<h1 style="text-align: center">會員密碼修改</h1>
			</div>
					
			<form action="${pageContext.request.contextPath}/memberSystem/doUpdPwd"  method="post"
					class='col-md-6 mx-auto align-items-center'>
				<div class="form-row form-group">
					<label for="password" class="col-form-label col-sm-3 align-self-center" >* 請輸入舊密碼：</label> 
						<!-- col end-->
					<input id="oldPwd" name="oldPwd" type="password" placeholder="請輸入舊密碼" required
					 maxlength="16" class="form-control col-sm-6" onblur="pwdChecker()"/> 
						<!-- col end-->
					<div class="col-sm-3 align-self-center" id="oldpwd_errbox"></div>	
				</div>
				
				<div class="form-row form-group">
					<label for="password" class="col-form-label col-sm-3 align-self-center">* 請輸入新密碼：</label> 
					<!-- col end-->
					<input id="newPwd" name="newPwd" type="password" placeholder="請輸入新密碼" required
					 	  maxlength="16" class="form-control col-sm-6" 
					 	  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$"/> 
					<!-- col end-->
					<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
						8-16字元，不含特殊符號   
					</h6>
				</div>
					<!-- row form-group end-->					
				<div class="form-row form-group">
					<label for="validpwd" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼 ：</label> 
					<!-- col end-->
					<input id="validPwd" name="validpwd" type="password" placeholder='請再次輸入密碼' required 
						   maxlength="15" class="form-control col-sm-6"/>
					<!-- col end-->
					<div class="col-sm-3 align-self-center" id="validpwd_errbox"></div>					
					<!-- col end-->
				</div>
					<!-- row form-group end-->						
				<div class="row">
					<!-- col end-->
						<div class="col-sm-7"></div>
					<!-- col end-->
						<input id="btnReset" type="reset" value="重填" class="btn btn-primary col-sm-1"/> 
						<div>&nbsp;</div>
					<!-- col end-->
						<input id="btnAdd" type="submit" value="送出" class="btn btn-primary col-sm-1" disabled/>
					<!-- col end-->
				</div>
			</form>	
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	<script type="text/javascript">
	
	function pwdChecker(){
		var oldpwd = $('#oldPwd').val();
		if(oldpwd==""){
			console.log('reach');
			$('#oldpwd_errbox').text('請輸入密碼!');
			$('#oldpwd_errbox').attr({
				"class" : "text-danger col-sm-3 align-self-center"					
			});
		}else{
			$.ajax({
				url: "${pageContext.request.contextPath}/memberSystem/oldPwdChecker?oldPwd=" + oldpwd,
				type: "POST",
				error: function(data){
					console.log('error');
				},
				success: function(data){
					console.log();
					if(data){
						$('#oldpwd_errbox').text('');
						console.log(data);
						$('#btnAdd').prop('disabled',false);						
					}else{	
						$('#oldpwd_errbox').text('密碼不正確');
						$('#oldpwd_errbox').attr({
							"class" : "text-danger col-sm-3 align-self-center"					
						});
						$('#btnAdd').prop('disabled',true);
					}
				}
			})			
		}						
	}
	
	$('form').submit(function(event){		
		var pwd1 = $("#newPwd").val();
		var pwd2 = $("#validPwd").val();				
		if(pwd1 != pwd2){
			event.preventDefault();
			$('#validpwd_errbox').text('輸入密碼不一致，請再次確認!');
		}
	})
	
	$('#newPwd').keypress(function(){
		var newpwd = $('#newPwd').val();
		if(newpwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}		
	})
	
	$('#newPwd').keyup(function(){
		var newpwd = $('#newpwd').val();
		if(newpwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}
	})
		
	</script>	
</body>
</html>