<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>會員資料修改</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

</head>
<body>
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	
	<section class="ftco-section">
		<div id='container justify-content-center'>
		
			<div id='header'>
				<h1 style="text-align: center">聯絡資料檢視/修改</h1>
			</div>		
			<form:form method='POST' modelAttribute="MembersBean"
				class='col-md-6 mx-auto align-items-center' action='${pageContext.request.contextPath}/memberSystem/doupdate'>
			<fieldset>			
<!-- 				<legend style="text-align: center">聯絡資料檢視/修改</legend>
 -->				
				<div class='form-row form-group '>
					<div class="col-sm-3"></div>
					<label class="col-form-label col-sm-1 align-self-center">地址 ：</label>
					<form:input id="address" path="address" type="text"
					value='${CLoginOK.address}'	required='required' class="form-control col-sm-4"/>
				</div>
				
				<div class='form-row form-group'>
					<div class="col-sm-3"></div>
					<label class="col-form-label col-sm-1 align-self-center ">電話 ：</label>
					<form:input id="cellphone" path="cellphone" type="text"
						value='${CLoginOK.cellphone}' required='required' class="form-control col-sm-2" />
				</div>
				
				<div class="row">
					<div class="col-sm-6"></div>
					<input id='btnReset' type="reset" value="重填" class="btn btn-primary col-sm-1"/> 
					<div>&nbsp;</div>
					<input id='btnAdd' type="submit" value="送出"  class="btn btn-primary col-sm-1"/> 
				</div>
			</fieldset>
		</form:form>
		</div>
	</section>
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
</body>
</html>