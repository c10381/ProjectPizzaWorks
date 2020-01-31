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
	
<script src='https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js'></script>
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

</head>
<body>
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<section class="ftco-section">
		<div id='container justify-content-center'>
			<div id='header'>
				<h1 style="text-align: center">會員資料填寫</h1>
			</div>

			<hr width='3'>

			<form:form method='POST' modelAttribute="MembersBean"
				class='col-md-4 mx-auto align-items-center' action='customer_add'>
				<fieldset>
					<legend>會員資料填寫</legend>

					<form:hidden path="email" value="${MembersBean.email }" />
					<form:hidden path="password" value="${MembersBean.password}" />

					<label>姓 ：</label>
					<form:input id='lastName' path='lastName' type='text'
						required='required' maxlength='15'/>

					<label>名 ：</label>
					<form:input id='firstName' path='firstName' type='text'
						required='required' maxlength='15'/>

					<br> <label>性別 ：</label>
					<form:select path="gender" id='gender'>
						<form:option value="0" label="請選擇"></form:option>
						<form:option value="1" label="男"></form:option>
						<form:option value="2" label="女"></form:option>
					</form:select>

					<br> <label>生日 ：</label>
					<form:input id='birthDate' path='birthDate' type="date" 
						pattern='' maxlength='10'/>

					<br> <label>地址 ：</label>
					<form:input id="address" path="address" type="text"
						required='required' maxlength='10'/>

					<br> <label>手機 ：</label>
					<form:input id="cellphone" path="cellphone" type="text" 
						 required='required' />

					<br>
					<form:hidden path="activeStatus" value="1" />

					<br>
					<form:hidden path="privilegeId" value="1" />

					<br> <input id='btnAdd' type="submit" value="送出" disabled />
					<input id='btnReset' type="reset" value="重填" /> 
					<input id='btnAuto' type='button' value="一鍵輸入" />

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
			$("#lastName").val("蔡");
			$("#firstName").val("育承");
			$("#gender").val("1");
			$("#birthDate").val("1992-10-14");
			$("#address").val("新北市板橋區信義路74巷5弄1號3樓");
			$("#cellphone").val("0922123233");				
			$("#btnAdd").prop("disabled", false);
		})
	})
	</script>
</body>
</html>