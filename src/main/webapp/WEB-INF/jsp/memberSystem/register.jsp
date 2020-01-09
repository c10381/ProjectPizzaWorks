<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
</head>
<body>
<div class="regitster_form">
<form>
請輸入信箱:<input type="text"><br>
請輸入密碼:<input type="password" id="pwd1"><br>
請再次確認密碼:<input type="password" id="pwd2"><br>

<button type="submit">送出</button>
<button type="reset">重填</button>

</form>
</div>
</body>
</html>