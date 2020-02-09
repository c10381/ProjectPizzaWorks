<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>重設密碼</title>

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
				<h1 style="text-align: center">重設密碼</h1>
			</div>
		
			<form action="${pageContext.request.contextPath}/memberSystem/doResetPwd" method="post"
					class='col-md-6 mx-auto align-items-center'>
					
				<div class="form-row form-group">											
					<input type='hidden' class="form-control" value='${email}' name='email' id='email'/>					
					
					<label for="newPwd" class="col-form-label col-sm-3 align-self-center">* 請輸入密碼：</label>
					
					<input type='password' class="form-control col-sm-6" placeholder="請輸入新密碼"  
					maxlength="16" name="newPwd" id="newPwd" required
					pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$"/>
						<!-- col end-->
					<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
					 8-16字元，不含特殊符號  
					</h6>						
				</div>	
									
				<div class="form-row form-group">
					<label for="password" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼：</label> 
					<input type="password" class="form-control col-sm-6" placeholder="請再次輸入密碼" name="chkPwd" id='chkPwd' required/>
					<div class='col-sm-3 align-self-center' id='validpwd_errbox'></div>	  			
				</div>	
									
				<div class="row">
						<!-- /.col -->
					<div class="col-sm-7"></div>
					<input id='btnReset' type="reset" value="重填" class="btn btn-primary col-sm-1"/> 
					<div>&nbsp;</div>
					<div class="col-4">
						<input id='btnAdd' type="submit" value="送出"  class="btn btn-primary col-sm-1"/>
					</div>						
				</div>				
			</form>			
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
	<script type="text/javascript">
	//鍵盤點擊開始輸入後將密碼提示清空
	$('#newPwd').keypress(function(){
		var pwd = $('#newPwd').val();
		if(pwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}		
	})
	
	//使用者將密碼用鍵盤清空後會再度顯示密碼提示
	$('#newPwd').keyup(function(){
		var pwd = $('#newPwd').val();
		if(pwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}
	})
	
	$('#newPwd').blur(function(){
		var pwd = $('#newPwd').val();
		if(pwd.length < 6){
			
		}
	})
	
	
	
	$('#chkPwd').blur(function(){
		var pwd1 = $('#newPwd').val();
		var pwd2 = $('#chkPwd').val();
		if(pwd1 != pwd2){
			$('#validpwd_errbox').text('輸入密碼不一致！');
			$('#validpwd_errbox').attr({
				"class" : "text-danger col-sm-3 align-self-center"
			});
		}else{
			$('#validpwd_errbox').text('');
		}
	})
	
	$('form').submit(function(){
		var newpwd = $('#newPwd').val(); 
	})
	
	
	
	</script>	
</body>
</html>