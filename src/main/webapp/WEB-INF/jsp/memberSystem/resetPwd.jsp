<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>重新設定密碼</title>

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
		
			<form action="${pageContext.request.contextPath}/memberSystem/doResetPwd" method="post"
					class='col-md-6 mx-auto align-items-center'>
					
				<div class="form-row form-group">											
					<input type='hidden' class="form-control" value='${email}'  name='email' id='email'/>					
					
					<label for="newPwd" class="col-form-label col-sm-3 align-self-center">* 請輸入密碼：</label>
					
					<input type='password' class="form-control col-sm-6" placeholder="請輸入新密碼"  
					maxlength="15" name="newPwd" id="newPwd"/>
						<!-- col end-->
					<h6 id="pwdReminder" class="form-text text-muted col-sm-2 align-self-center">
					 6-15字元  
					</h6>						
				</div>	
									
				<div class="form-row form-group">
					<label for="password" class="col-form-label col-sm-3 align-self-center">* 請再次輸入密碼：</label> 
					<input type="password" class="form-control" placeholder="請再次輸入密碼" name="chkPwd" id='chkPwd'
						  class="form-control col-sm-6"/>
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
	
	
	
</body>
</html>