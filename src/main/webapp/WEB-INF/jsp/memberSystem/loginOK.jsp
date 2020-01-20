<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登入成功</title>
</head>
<body>

<h1>登入成功!</h1>

<a href='${pageContext.request.contextPath}/memberSystem/infoUpdate'>資料修改</a><BR>
<a href='${pageContext.request.contextPath}/memberSystem/updPwd'>密碼修改</a><BR>
<a href='${pageContext.request.contextPath}/memberSystem/allCustomer'>顧客檢視</a><BR>

</body>
</html>