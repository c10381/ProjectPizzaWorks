<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Out</title>
    <style type="text/css">
        table { border: 0; }
        table td { padding: 10px; }
    </style>
</head>
<body>
<div align="center">
    <h1>Check Out</h1>
    <br/>
    	<form action="${pageContext.request.contextPath}/PaypalTest/paypalCheckout" method="post" >

    	<table>
        	<tr>
            	<td>Product/Service:</td>
            	<td><input type="text" name="productName" value="iPhone" id="productName"/></td>
        	</tr>
        	<tr>
            	<td>Sub Total(小計):</td>
            	<td><input type="text" name="subtotal" value="100" id="subtotal"/></td>
        	</tr>
        	<tr>
            	<td>Shipping(運費):</td>
            	<td><input type="text" name="shipping" value="10" id="shipping"/></td>
        	</tr>    
        	<tr>
            	<td>Tax(稅):</td>
            	<td><input type="text" name="tax" value="10" id="tax"/></td>
        	</tr>    
        	<tr>
            	<td>Total Amount:</td>
            	<td><input type="text" name="total" value="120" id="total"/></td>
        	</tr>
        	<tr>
            	<td colspan="2" align="center">
                	<input type="submit" value="Checkout" />
            	</td>
        	</tr>
    	</table>

    </form>
</div>

<script>

function mySubmit(){
	var productName = $("#productName").value;
	let subtotal = $("#subtotal").value;
	let shipping = $("#shipping").value;
	let tax = $("#tax").value;
	let total = $("#total").value;
	console.log(productName);
	console.log(subtotal);
	console.log(shipping);
	console.log(tax);
	console.log(total);
	
	
}


</script>
</body>
</html>