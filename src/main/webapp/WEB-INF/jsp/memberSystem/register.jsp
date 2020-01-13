<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet"
 href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<style type="text/css">

</style>
<title>會員註冊</title>

<script type="text/javascript">

</script>
</head>
<body>
 <section>
  <div class='container'>
   <h1 style="text-align: center">新會員註冊</h1>
  </div>
 </section>
<hr width='3'>
<section class='container'>
<form:form method='POST' modelAttribute="MembersBean" class='form-horizontal' action="memberSystem/register">
<fieldset>
<legend>登入資訊註冊</legend>
<label>* 請輸入註冊信箱：</label>
<form:input id="email" path="email" type='text' required='required'/><br>
<label>* 請輸入密碼　    ：</label>
<form:input id="password" path="password" type="password" required='required'/><br>
<input id='btnAdd' type="submit" value="送出" />
<input id='btnReset' type="reset" value="重填" />

</fieldset>
</form:form>
</section>
</body>
</html>