<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>密碼修改</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->

</head>
<body class="hold-transition login-page">

	<!-- ----- -->
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<!-- ----- -->
	<section class="ftco-section">
		<div id='container justify-content-center'>
		
			<div id='header'>
				<h1 style="text-align: center">會員密碼修改</h1>
			</div>
		
		<!-- /.login-logo -->
		
			<div class="card-body login-card-body">				
				<form action="${pageContext.request.contextPath}/memberSystem/doUpdPwd"  method="post"
					class='col-md-6 mx-auto align-items-center'>

					<div class="form-row form-group">
						<label for="password" class="col-form-label col-sm-3 align-self-center">* 請輸入舊密碼：</label> 
						<!-- col end-->
						<input id="oldPwd" name="oldPwd" type="password" placeholder='請輸入舊密碼' required
					 	       maxlength="15" class="form-control col-sm-6" /> 
						<!-- col end-->
						<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
						 6-15字元  
						</h6>
						
						<!-- col end-->
					</div>
					<div class="form-row form-group">
						<label for="password" class="col-form-label col-sm-3 align-self-center">* 請輸入新密碼：</label> 
						<!-- col end-->
						<input id="newPwd" name="newPwd" type="password" placeholder='請輸入新密碼' required
					 	       maxlength="15" class="form-control col-sm-6" /> 
						<!-- col end-->
						<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
						 6-15字元  
						</h6>
						
						<!-- col end-->
					</div>
					<!-- row form-group end-->					
					<div class="form-row form-group">
						<label for="validpwd" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼 ：</label> 
					<!-- col end-->
						<input id='validpwd' name="validpwd" type="password" placeholder='請再次輸入密碼' required 
						   maxlength='15' class="form-control col-sm-6"/>
					<!-- col end-->
						<div class='col-sm-3 align-self-center' id='validpwd_errbox'></div>					
					<!-- col end-->
					</div>
					<!-- row form-group end-->						
					<div class="row">
					<!-- col end-->
						<div class="col-sm-7"></div>
					<!-- col end-->
						<input id='btnReset' type="reset" value="重填" class="btn btn-primary col-sm-1"/> 
						<div>&nbsp;</div>
					<!-- col end-->
						<input id='btnAdd' type="submit" value="送出"  class="btn btn-primary col-sm-1"/>
					<!-- col end-->
					</div>
				</form>
				
			</div>
		</div>
	</section>
	<!-- /.login-box -->
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
	
	
</body>
</html>