<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Insert title here</title>
</head>
<body>

<input type="text" name="email" id="email">
<div id="SendButton">
<button onclick="SendToBack()">Send</button>
</div>
<script>
function SendToBack(){
	$.ajax({
		url:"${pageContext.request.contextPath}/memberSystem/forgetPW",
		data: {"email":$("#email").val()},
		type:"POST",
		error: function(){
			alert("Something Wrong.");
		},
		success: function(data){
			 $("#SendButton").empty();
			$("#SendButton").append("<p>"+data+"</p>");
			} 
	})
}

</script>

</body>
</html>