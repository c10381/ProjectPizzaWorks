<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<title>會員註冊</title>

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
					required='required' />

				<label>名 ：</label>
				<form:input id='firstName' path='firstName' type='text'
					required='required' />

				<br> <label>性別 ：</label>
				<form:select path="gender">
					<form:option value="0" label="請選擇"></form:option>
					<form:option value="1" label="男"></form:option>
					<form:option value="2" label="女"></form:option>
				</form:select>

				<br> <label>生日 ：</label>
				<form:input id='birthDate' path='birthDate' type="date" />

				<br> <label>地址 ：</label>
				<form:input id="address" path="address" type="text"
					required='required' />

				<br> <label>連絡電話 ：</label>
				<form:input id="cellphone" path="cellphone" type="text"
					required='required' />

				<br>
				<form:hidden path="activeStatus" value="1" />

				<br>
				<form:hidden path="privilegeId" value="1" />

				<br> <input id='btnAdd'   type="submit" value="送出" /> 
					 <input id='btnReset' type="reset"  value="重填" />

			</fieldset>
		</form:form>
		</div>
	</section>
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
		
</body>
</html>