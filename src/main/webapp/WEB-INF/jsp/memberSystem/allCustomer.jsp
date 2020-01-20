<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顧客資料檢視</title>
</head>
<body>
	<div align="center">
		<h2>顧客資料</h2>
		<table border="1">
			<tr style="background-color: #a8fefa">
				<th>帳號
				<th>姓
				<th>名
				<th>性別
				<th>生日
				<th>電話
				<th>地址
				<th>狀態 <c:forEach items="${Customers}" var="cus">
						<tr>
							<td>${cus.email}</td>
							<td>${cus.firstName}</td>
							<td>${cus.lastName}</td>
							<td>${cus.gender}</td>
							<td>${cus.birthDate}</td>
							<td>${cus.cellphone}</td>
							<td>${cus.address}</td>
							<td>${cus.activeStatus}</td>
						</tr>
					</c:forEach>
		</table>
	</div>
</body>
</html>