<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />

<title>檢視訂單</title>
<style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
</style>
</head>
<body>
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
<div align="center">
    <h1>請再次確認訂單內容</h1>
    <form action="${pageContext.request.contextPath}/PaypalTest/execute_Payment" method="post">
    <table>
        <tr>
            <td colspan="2"><b>訂單內容:</b></td>
            <td>
                <input type="hidden" name="paymentId" value="${paymentId}" />
                <input type="hidden" name="PayerID" value="${PayerID}" />
            </td>
        </tr>
        <tr>
            <td>訂購餐點:</td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td>小計:</td>
            <td>${transaction.amount.details.subtotal} NTD</td>
        </tr>
        <tr>
            <td>運費:</td>
            <td>${transaction.amount.details.shipping} NTD</td>
        </tr>
        <tr>
            <td>稅:</td>
            <td>${transaction.amount.details.tax} NTD</td>
        </tr>
        <tr>
            <td>總金額:</td>
            <td>${transaction.amount.total} NTD</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Payer Information:</b></td>
        </tr>

        <tr>
            <td>訂購人:</td>
            <td>${payer.lastName}${payer.firstName}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${payer.email}</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>送餐地點:</b></td>
        </tr>
        <tr>
            <td>取餐人:</td>
            <td>${shippingAddress.recipientName}</td>
        </tr>
        <tr>
            <td>Line 1:</td>
            <td>${shippingAddress.line1}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${shippingAddress.city}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${shippingAddress.state}</td>
        </tr>
        <tr>
            <td>Country Code:</td>
            <td>${shippingAddress.countryCode}</td>
        </tr>
        <tr>
            <td>Postal Code:</td>
            <td>${shippingAddress.postalCode}</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="確認付款" />
            </td>
        </tr>    
    </table>
    </form>
</div>
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
</body>
</html>