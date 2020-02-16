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
	
	<section class="ftco-section">
    <div id='container justify-content-center'>
        <div id='header'>
            <h1 style="text-align: center">請確認訂單內容</h1>
        </div>
        <!-- / div header  -->
        <form action="${pageContext.request.contextPath}/PaypalTest/execute_Payment" method="post">
            <table class="mx-auto" > 
                <tr>
                    <td colspan="2" class="text-lg text-white" ><b>訂單內容</b></td>
                    <td>
                        <input type="hidden" name="paymentId" value="${paymentId}" />
                        <input type="hidden" name="PayerID" value="${PayerID}" />
                    </td>
                </tr>
                <tr>
                    <td class="text-lg text-primary">${transaction.description}</td>
                </tr>

                <tr>
                    <td class="text-lg">總金額</td>
                    <td class="text-lg text-primary">${transaction.amount.total} NTD</td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-lg text-white"><b>付款資訊</b></td>
                </tr>
                <tr>
                    <td class="text-lg">訂購人</td>
                    <td class="text-lg text-primary">${payer.lastName}${payer.firstName}</td>
                </tr>
                <tr>
                    <td class="text-lg">Email</td>
                    <td class="text-lg text-primary">${payer.email}</td>
                </tr>
                <tr>
                    <td><br /></td>
                </tr>
                <tr>
                    <td colspan="2" class="text-lg text-white"><b>送餐地點</b></td>
                </tr>
                <tr>
                    <td class="text-lg">取餐人</td>
                    <td class="text-lg text-primary">${shippingAddress.recipientName}</td>
                </tr>
                <tr>
                    <td class="text-lg">地址</td>
                    <td class="text-lg text-primary">${shippingAddress.line1}</td>
                </tr>
                <tr> <td><br /></td></tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="確認付款" class="btn btn-primary " />
                    </td>
                </tr>
            </table>
        </form>

    </div>
</section>
	
	
	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />
</body>
</html>