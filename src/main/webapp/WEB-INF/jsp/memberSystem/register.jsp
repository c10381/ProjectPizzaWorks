<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>新會員註冊</title>
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

	<!-- 把東西放到section / container div -->
	
	<section class="ftco-section">
		<div id='container justify-content-center'>

			<div id='header'>
				<h1 style="text-align: center">新會員註冊</h1>
			</div>

			<form method="POST" id="register" class="col-md-6 mx-auto align-items-center"			
				 action="${pageContext.request.contextPath}/memberSystem/register_form">
				<!--form starts-->
				<div class="form-row form-group">
                		<label for="email" class="col-form-label col-sm-3 align-self-center">* 請輸入註冊信箱：</label>
                		<!-- col end-->
                		<input id="email" name="email" class="form-control col-sm-6" type='email' placeholder='請輸入註冊信箱' required />
            			<!-- col end-->
            			<div class="col-sm-3 align-self-center" id="email_errbox"></div>
            			<!-- col end-->
    			</div>
    			<!-- row form-group ends-->
    			
    			<!-- email檢查按鈕 -->
				<div><input type="button" value="檢查帳號是否可用" class="btn btn-primary" onclick="emailExists()"></div>		
				
				<div class="form-row form-group">
						<label for="password" class="col-form-label col-sm-3 align-self-center">* 請輸入密碼：</label> 
						<!-- col end-->
						<input id="password" name="password" type="password" placeholder='請輸入密碼' required
					 	       maxlength="16" class="form-control col-sm-6" 
					 	 	   pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$"
					 	 	   /> 
						<!-- col end-->
						<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
						 8-16字元，不含特殊符號  
						</h6>
						
						<!-- col end-->
				</div>
    			<!-- row form-group end-->	
				<div class="form-row form-group">
					<label for="validpwd" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼 ：</label> 
					<!-- col end-->
					<input id="validpwd" name="validpwd" type="password" placeholder="請再次輸入密碼" required 
						   maxlength="15" class="form-control col-sm-6"/>
					<!-- col end-->
					<div class="col-sm-3 align-self-center" id="validpwd_errbox"></div>					
					<!-- col end-->
				</div>
    			<!-- row form-group end-->	
				<br> 
				<div class="row">
					<input type="button" id="btnAuto" value="一鍵輸入"  class="btn btn-white btn-outline-white col-sm-2"/>
					<!-- col end-->
					<div class="col-sm-7"></div>
					<!-- col end-->
					<input id="btnReset" type="reset" value="重填" class="btn btn-primary col-sm-1"/> 
					<div>&nbsp;</div>
					<!-- col end-->
					<input id="btnAdd" type="submit" value="送出"  class="btn btn-primary col-sm-1"/>
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
	
	//重填按鈕點擊後，會順便將錯誤訊息清空
	$('#btnReset').click(function(){
		$('#email_errbox').text('');
	})
	
	//全域變數，讓form可不可以被送出
	var flag = true;
	
	//檢查使用者輸入的email是否已註冊
	function emailExists(){
		var email = $('#email').val();
		if(email == ''){
			$('#email_errbox').text('請輸入帳號');
			$('#email_errbox').attr({
				"class" : "text-danger col-sm-3 align-self-center"
			})
		}else{
			$.ajax({
				url : "${pageContext.request.contextPath}/memberSystem/emailChecker?email=" + email,
				type : "POST",
				error : function(data){
					console.log('error');
				},
				success : function(data){
					//data表示後端回傳的布林值，true表示該信箱已註冊，反之亦然
					if(data){					
						$('#email_errbox').text('該信箱已註冊過');
						$('#email_errbox').attr({
							"class" : "text-danger col-sm-3 align-self-center"
						})
						flag = true;
						
					}else{
						$('#email_errbox').text('該信箱可以使用');
						$('#email_errbox').attr({
							"class" : "col-sm-3 align-self-center"
						})
						flag = false;
					}
				}			
			}) 
		}		
	}
	
	//一鍵輸入功能
	$("#btnAuto").click(function() {
		$("#email").val("iiiedujava@gmail.com");
		$("#password").val("Java8888");
		$("#validpwd").val("Java8888");
		$('#email_errbox').text('');
		$('#pwd_errbox').text('');
		$('#validpwd_errbox').text('');
		flag = false;
	})
	
	//鍵盤點擊開始輸入後將密碼提示清空
	$('#password').keypress(function(){
		var pwd = $('#password').val();
		if(pwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}		
	})
	
	//使用者將密碼用鍵盤清空後會再度顯示密碼提示
	$('#password').keyup(function(){
		var pwd = $('#password').val();
		if(pwd==''){
			$('h6').text('8-16字元，不含特殊符號 ');
		}else{
			$('h6').text('');	
		}
	})
	
	//檢查密碼輸入不得為空
	function pwdChecker(){
		var pwd = $('#password').val();
		if(pwd ==''){
			$('#pwd_errbox').remove();			 				
			$('h6').remove();				
			var pwd_txt = "<div class='col-sm-3 align-self-center' id='pwd_errbox'>請輸入密碼</div>";
			$('#password').after(pwd_txt);							
			$('#pwd_errbox').attr({
				"class" : "text-danger col-sm-3 align-self-center"					
			});
		}else{
			$('h6').remove();			
			$('#pwd_errbox').text('');
		}
	}
	
	//檢查使用者輸入的帳號/密碼/確認密碼是否有效
	$('form').submit(function(event){
		var emailtxt = $('#email').val();
		var pwd = $('#password').val();
		var vpwd = $('#validpwd').val();
		
		//先執行輸入的email是否存在，藉此可以阻擋使用者沒按帳號檢查按鈕而讓使用者通過
		emailExists();
		
		//判斷使用者是否什麼都沒輸入
		if(emailtxt == ''|| pwd =='' || vpwd ==''){
			event.preventDefault();
			flag = true;
			if(emailtxt ==''){
				//如果帳號沒輸入就跳沒輸入的錯誤
				$('#email_errbox').text('請輸入帳號');
				$('#email_errbox').attr({
					"class" : "text-danger col-sm-3 align-self-center"
				})
			}else{				
				$('#email_errbox').text('');
			}
			
			if(pwd ==''){
				//如果密碼沒輸入就跳沒輸入的錯誤
				$('#pwd_errbox').remove();								
				$('h6').remove();				
				var pwd_txt = "<div class='col-sm-3 align-self-center' id='pwd_errbox'>請輸入密碼</div>";
				$('#password').after(pwd_txt);							
				$('#pwd_errbox').attr({
					"class" : "text-danger col-sm-3 align-self-center"					
				});
			}else{
				$('#pwd_errbox').text('');
			}
			
			if(vpwd ==''){
				$('#validpwd_errbox').text('請再次輸入密碼');
				$('#validpwd_errbox').attr({
					"class" : "text-danger col-sm-3 align-self-center"
				});
			}else{
				$('#validpwd_errbox').text('');
			}			
		}else if(vpwd!=pwd){
			event.preventDefault();
			$('#validpwd_errbox').text('輸入密碼不一致，請再次確認');			
		}else if(flag){
			console.log('preventer2');
			event.preventDefault();
		}else{
			return;
		}			
					
	})
	</script>
</body>
</html>