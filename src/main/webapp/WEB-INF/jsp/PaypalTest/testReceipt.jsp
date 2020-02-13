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

<title>訂購成功</title>
<style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
</style>
</head>
<body>
		
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<div align="center">
    <h1>付款成功，感謝您的訂購!</h1>
    <br/>
    <h2>訂單資訊如下:</h2>
    <table>
        <tr>
            <td><b>Merchant:</b></td>
            <td>Company ABC Ltd.</td>
        </tr>
        <tr>
            <td><b>訂購者:</b></td>
            <td>${payer.firstName} ${payer.lastName}</td>      
        </tr>
        <tr>
            <td><b>訂單內容:</b></td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td><b>小計:</b></td>
            <td>${transaction.amount.details.subtotal} NTD</td>
        </tr>
        <tr>
            <td><b>運費:</b></td>
            <td>${transaction.amount.details.shipping} NTD</td>
        </tr>
        <tr>
            <td><b>Tax:</b></td>
            <td>${transaction.amount.details.tax} NTD</td>
        </tr>
        <tr>
            <td><b>總金額:</b></td>
            <td>${transaction.amount.total} NTD</td>
        </tr>                    
    </table>
</div>
		
		<jsp:include page="../shopSystem/fragment/footer.jsp" />
		<jsp:include page="../shopSystem/fragment/loader.jsp" />
		<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />

</body>
</html>