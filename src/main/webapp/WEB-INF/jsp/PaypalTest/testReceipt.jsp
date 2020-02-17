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
	
	
	<section class="ftco-section">		
		<div id='container justify-content-center'> 
			<div id='header'>
				<h1 style="text-align: center">付款成功，感謝您的訂購!</h1>
			</div>
			<!-- /div header -->
			    <table class="mx-auto">
		            <tr>
		                <td class="text-lg text-white"><b>商家資訊</b></td>
		                <td class="text-lg text-primary">Pizza Bite</td>
		            </tr>
		            <tr>
		                <td class="text-lg text-white"><b>訂購者</b></td>
		                <td class="text-lg text-primary">${payer.firstName} ${payer.lastName}</td>
		            </tr>
		            <tr>
		                <td class="text-lg text-white"><b>訂單內容</b></td>
		                <td class="text-lg text-primary">${transaction.description}</td>
		            </tr>
		            <tr>
		                <td class="text-lg text-white"><b>總金額</b></td>
		                <td class="text-lg text-primary">${transaction.amount.total} NTD</td>
		            </tr>
		            <tr>
		            	<td colspan="2" align="right">
		            		<a href="${pageContext.request.contextPath}/member/orders"><button type="button" class="btn btn-primary rounded-full">前往訂單一覽</button></a>
		            	</td>
		            </tr>
        	</table>
		</div>			
	</section>
	
	
		<jsp:include page="../shopSystem/fragment/footer.jsp" />
		<jsp:include page="../shopSystem/fragment/loader.jsp" />
		<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />

</body>
</html>