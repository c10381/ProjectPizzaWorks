<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>忘記密碼</title>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- ----- -->
<jsp:include page="../shopSystem/fragment/ContentMetaInfo.jsp" />
<jsp:include page="../shopSystem/fragment/ContentCSS.jsp" />
<!-- ----- -->

</head>

<body>
	<!-- ----- -->
	<jsp:include page="../shopSystem/fragment/navbar.jsp" />
	<!-- ----- -->
	<section class="ftco-section">
		<div id='container justify-content-center'>

			<div id='header'>
				<h1 style="text-align: center">忘記密碼</h1>
			</div>

			<div class="col-md-6 mx-auto align-items-center">
				<div class="form-group form-row justify-content-end">
					<div class="col-sm-1"></div>
					<label for="email" class="col-sm-2 align-self-center justify-content-end">*
						請輸入信箱：</label>
					<!-- col end-->
					<input id="email" name="email" class="form-control col-sm-5"
						type='email' placeholder="請輸入信箱" required />
					<!-- col end-->
					<div class="col-sm-3 align-self-center" id="msg"></div>
				</div>

				<div class="row">
					<div class="col-sm-4"></div>
					<input type="button"
						onclick="javascript:location.href='${pageContext.request.contextPath}/'"
						class="btn btn-primary col-sm-2" value="返回上一頁" autocomplete="off"/>
					<div>&nbsp;</div>
					<input id="btnSend" type="button" class="btn btn-primary col-sm-2" onclick="SendToBack()"
						value="送出驗證信" />
				</div>

			</div>
		</div>
	</section>

	<jsp:include page="../shopSystem/fragment/footer.jsp" />
	<jsp:include page="../shopSystem/fragment/loader.jsp" />
	<jsp:include page="../shopSystem/fragment/ContentJS.jsp" />

	<script>
		function SendToBack() {
			if(email=""){
				$('#msg').text("請輸入帳號!");
				$('#msg').attr({
					"class" : "text-danger col-sm-3 align-self-center"
				})
			}else{
				$('#btnSend').prop("disabled",true);
				$.ajax({
					url : "${pageContext.request.contextPath}/memberSystem/forgetPW",
					data : {
						"email" : $("#email").val()
					},
					type : "POST",
					error : function() {
						alert("Something Wrong.");
					},
					success : function(data) {
						if(data){
							$('#msg').attr({
								"class" : "col-sm-3 align-self-center"
							})
							$('#msg').text("驗證信發送成功！");
							$('#btnSend').prop("disabled",true);
						}else{
							$('#msg').text("查無此帳號，請重新輸入!");
							$('#msg').attr({
								"class" : "text-danger col-sm-3 align-self-center"
							})
						}					
					}
				})				
			}			
		}
	</script>
</body>

</html>