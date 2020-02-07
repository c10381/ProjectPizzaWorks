<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">

<style type="text/css">
</style>
<title>會員註冊</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<script src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

</head>
<body>
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<section class="ftco-section">
		<div id="container justify-content-center">
		
			<div id="header">
				<h1 style="text-align: center">會員資料填寫</h1>
			</div>

			<form:form method="POST" modelAttribute="MembersBean" class="col-md-4 mx-auto align-items-center" 
				action="../memberSystem/submitForm" >
				<fieldset>
					<legend style="text-align: center">會員資料填寫</legend>
					
				<!--form row starts  -->	
				<div class='form-row form-group'>
					<label class="col-form-label col-sm-2 align-self-center">帳號：</label>
					<form:input path="email" value="${MembersBean.email}" type="text" 
						class="form-control col-sm-6"  readonly='true'/>
					<form:hidden path="password" value="${MembersBean.password}" />
				<!--form row ends  -->
				</div>
				
				<!--form row starts  -->
				<div class='form-row form-group'>	
					<label class="col-form-label col-sm-2 align-self-center">姓氏：</label>
					<form:input id="lName" path="lastName" type="text" required="required" maxlength="15" 
								class="form-control col-sm-2"/>

					<label class="col-form-label col-sm-2 align-self-center">名字：</label>
					<form:input id="fName" path="firstName" type="text" required="required" maxlength="15" 
								class="form-control col-sm-3"/>
				<!--form row ends  -->				
				</div>
				
				<!--form row starts  -->
				<div class='form-row form-group'>
					<label class="col-form-label col-sm-2 align-self-center">性別：</label>
					<form:select path="gender" id="gender" class="form-control col-sm-2">
						<form:option value="0" label="請選擇" class="text-dark"></form:option>
						<form:option value="1" label="男" class="text-dark"></form:option>
						<form:option value="2" label="女" class="text-dark"></form:option>
					</form:select>
			
					<label class="col-form-label col-sm-2 align-self-center">生日：</label>
					<form:input id="birth" path="birthDate" type="date" 
						 maxlength="10" required='required' class="form-control col-sm-4"/>
				<!--form row ends  -->		 
				</div>
				
				<!--form row starts  -->
				<div class='form-row form-group'>
					<label class="col-form-label col-sm-2 align-self-center">地址 ：</label>
					<form:input id="addr" path="address" type="text" required='required' maxlength="10"
								class="form-control col-sm-8"/>
				<!--form row ends  -->
				</div>
				
				<!--form row starts  -->
				<div class='form-row form-group'>
					<label class="col-form-label col-sm-2 align-self-center">手機 ：</label>
					<form:input id="phone" path="cellphone" type="text" required='required' 
								class="form-control col-sm-3"/>
				<!--form row ends  -->				
				</div>
				
					<form:hidden path="activeStatus" value="1" />
					<form:hidden path="privilegeId" value="1" />
					
				<div class="row">
					<input id="btnAuto" type="button" value="一鍵輸入" class="btn btn-white btn-outline-white col-sm-2"/>
					<div class="col-sm-7"></div>
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

	<script type="text/javascript">
	
	$(function(){
		
		$("#btnAuto").click(function(){
			$("#lName").val("艾");
			$("#fName").val("披莎");
			$("#gender").val("2");
			$("#birth").val("2000-10-10");
			$("#addr").val("復興南路一段390號2樓");
			$("#phone").val("0912345678");				
		})
	})
	
	$('form').submit(function(){
		$('#btnAdd').prop('disabled',true);
	})
	
	
	</script>
</body>
</html>