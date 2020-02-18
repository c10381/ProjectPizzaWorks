<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>會員密碼修改</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->

</head>
<body>
	
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">
		<div id='container justify-content-center'>
		
			<div id='header'>
				<h1 style="text-align: center">會員密碼修改</h1>
			</div>
					
			<form action="${pageContext.request.contextPath}/memberSystem/doUpdPwd"  method="post"
					class='col-md-6 mx-auto align-items-center'>
					
				<div class="form-row form-group">
					<div class="col-lg-3"></div>
					<label for="password" class="col-form-label col-sm-2 align-self-center" >* 請輸入舊密碼：</label>
					<input id="oldPwd" name="oldPwd" type="text" required maxlength="16" class="form-control col-lg-3" onblur="oldPwdChecker()"/> 
					<div class="col-lg-3 align-self-center" id="oldpwd_errbox"></div>	
				</div>
				
				<div class="form-row form-group">
					<div class="col-lg-3"></div>
					<label for="password" class="col-form-label col-lg-2 align-self-center">* 請輸入新密碼：</label> 
					<!-- col end-->
					<input id="newPwd" name="newPwd" type="text" required maxlength="16" class="form-control col-lg-3" 
					 	  pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d+@]{8,16}$"/> 
					<!-- col end-->
					<div id="newpwd_errbox" class="form-text text-muted col-lg-3 align-self-center">
						8-16字元，大、小寫英文、數字及特殊符號各一   
					</div>
				</div>
					<!-- row form-group end-->					
				<div class="form-row form-group">
					<div class="col-lg-3"></div>
					<label for="validpwd" class="col-form-label col-sm-2 align-self-center">* 再次輸入密碼 ：</label> 
					<input id="validPwd" name="validpwd" type="text" required 
						   maxlength="16" class="form-control col-lg-3"/>
					<!-- col end-->
					<div class="col-lg-3 align-self-center" id="validpwd_errbox"></div>					
					<!-- col end-->
				</div>
					<!-- row form-group end-->						
				<div class="row">
						<div class="col-lg-4"></div>
						<input type="button" id="Demo" class="btn btn-white btn-outline-white col-lg-1" value="Demo" />
						<div class="col-lg-1"></div>	
					<!-- col end-->
						<input id="btnReset" type="reset" value="重填" class="btn btn-primary col-lg-1"/> 
						<div>&nbsp;</div>
					<!-- col end-->
						<input id="btnAdd" type="submit" value="送出" class="btn btn-primary col-lg-1" disabled/>
					<!-- col end-->
				</div>
			</form>	
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	<script type="text/javascript">
	
	$("#Demo").click(function(){
		$("#oldPwd").val("P@ssw0rd");
		$("#newPwd").val("p@ssw0rD");
		$("#validPwd").val("p@ssw0rD");
		$('#btnAdd').prop('disabled',false);
	})
	
	function oldPwdChecker(){
		let oldpwd = $('#oldPwd').val();
		//let objArray = [{"oldPwd":oldpwd}];
		//let jsonStr = JSON.stringify(objArray);
		//console.log(jsonStr);
		if(oldpwd==""){
			$('#oldpwd_errbox').text('請輸入密碼!');
			$("#btnAdd").prop("disabled",true);
			$('#oldpwd_errbox').attr({
				"class" : "text-danger col-lg-3 align-self-center"					
			});
		}else{
			
			$.ajax({
				url: "${pageContext.request.contextPath}/memberSystem/oldPwdChecker",
				type: "POST",
				data: oldpwd,
				contentType : 'application/json; charset=utf-8',
				success: function(data){
					console.log(data);
					if(data){
						$('#oldpwd_errbox').text("");
						$('#btnAdd').prop('disabled',false);						
					}else{	
						$('#oldpwd_errbox').text('密碼不正確');
						$('#oldpwd_errbox').attr({
							"class" : "text-danger col-lg-3 align-self-center"					
						});
						$('#btnAdd').prop('disabled',true);
					}
				}
			})			
		}						
	}
	
	$('#newPwd').blur(function(){
		let oldpwd = $("#oldPwd").val();
		let newpwd = $("#newPwd").val();
		if(oldpwd == newpwd){
			$('#newpwd_errbox').text('新密碼不可與舊密碼相同!');
			$('#newpwd_errbox').attr({
				"class" : "text-danger col-lg-3 align-self-center"					
			});
			$('#btnAdd').prop('disabled',true);
		}else{
			$('#newpwd_errbox').text('');
			$('#btnAdd').prop('disabled',false);
		}	
	})
	
	
	$('#validPwd').blur(function(){
		let newpwd = $("#newPwd").val();
		let validpwd = $("#validPwd").val();
		if(newpwd == validpwd){
			$('#validpwd_errbox').text('密碼輸入不一致');
			$('#validpwd_errbox').attr({
				"class" : "text-danger col-lg-3 align-self-center"					
			});
			$('#btnAdd').prop('disabled',true);
		}else{
			$('#newpwd_errbox').text('');
			$('#btnAdd').prop('disabled',false);
		}	
	})
	
	
	
	
	$('form').submit(function(event){		
		let pwd1 = $("#newPwd").val();
		let pwd2 = $("#validPwd").val();
		let pwd3 = $("#oldPwd").val();
		
		if(pwd1 != pwd2){
			event.preventDefault();
			$('#validpwd_errbox').attr({
				"class" : "text-danger col-lg-3 align-self-center"					
			});
			$('#validpwd_errbox').text('輸入密碼不一致，請再次確認!');
		}else if(pwd1 == pwd3){
			event.preventDefault();
			$('#newpwd_errbox').text("新密碼不可與舊密碼相同!");
			$('#newpwd_errbox').attr({
				"class" : "text-danger col-lg-3 align-self-center"					
			});			
		}
	})
	
	$('#newPwd').keypress(function(){
		let newpwd = $('#newPwd').val();
		if(newpwd==''){
			$('h6').text('8-16字元，大、小寫英文、數字及特殊符號各一 ');
		}else{
			$('h6').text('');	
		}		
	})
	
	$('#newPwd').keyup(function(){
		let newpwd = $('#newpwd').val();
		if(newpwd==''){
			$('h6').text('8-16字元，大、小寫英文、數字及特殊符號各一');
		}else{
			$('h6').text('');	
		}
	})
		
	</script>	
</body>
</html>