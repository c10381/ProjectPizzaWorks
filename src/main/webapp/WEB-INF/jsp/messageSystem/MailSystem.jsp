<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- DataTable -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/messageSystem/summernote-bs4.css">

</head>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="card-primary card-outline">
			<div class="card-header">
				<i class='fas fa-times'
					style='font-size: 20px; margin-right: 2%; float: left'
					onclick='floatPageClose()'></i>
				<h3 class="card-title">信件系統</h3>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<div class="form-group">
					<input class="form-control" placeholder="寄件人：" id="MailTo">
				</div>
				<div class="form-group">
					<input class="form-control" placeholder="標題：" id="Mailsubject">
				</div>
				<div class="form-group">
					<textarea id="compose-textarea" class="form-control"
						style="height: 300px"></textarea>
				</div>

			</div>
			<!-- /.card-body -->
			<div class="card-footer">
				<div class="float-right">
					<button type="submit" class="btn btn-Info" onclick="DemoButton()">
						<i class="far fa-hand-peace"></i> DEMO
					</button>
					<button type="submit" class="btn btn-primary" onclick="sendEmail()">
						<i class="far fa-envelope"></i> 送出
					</button>
				</div>
				<button type="reset" class="btn btn-default" onclick="emptyButton()">
					<i class="fas fa-times"></i> 清除重填
				</button>
			</div>
			<!-- /.card-footer -->
		</div>
		<!-- /.card -->

	</section>
	<!-- /.content -->
	<script
		src="${pageContext.request.contextPath}/js/messageSystem/summernote-bs4.min.js"></script>
	<script>
		$(function() {
			//Add text editor
			$('#compose-textarea').summernote(
					{
						height : 350, // set editor height
						minHeight : 350, // set minimum height of editor
						toolbar : [
								// [groupName, [list of button]]
								[
										'style',
										[ 'bold', 'italic', 'underline',
												'clear' ] ],
								[
										'font',
										[ 'strikethrough', 'superscript',
												'subscript' ] ],
								[ 'fontsize', [ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
								[ 'height', [ 'height' ] ] ]
					})
		})
		//如果要寄給不是會員，要設判別
		function sendEmail() {
			var mailTo = $("#MailTo").val();
			var mailsubject = $("#Mailsubject").val();
			var mailcontext = $("#compose-textarea").summernote("code");
			console.log(mailTo + " " + mailsubject + " " + mailcontext);
			$
					.post(
							"${pageContext.request.contextPath}/messageSystem/SendSalesMail",
							{
								"to" : mailTo,
								"subject" : mailsubject,
								"Context" : mailcontext
							}, function(data) {
								if (data == true) {
									//成功要跳通知？
								}
							})
		}
		function DemoButton() {
			$("#MailTo").val("c10381@gmail.com");
			$("#Mailsubject").val("嗨，你好嗎？");
			$("#compose-textarea")
					.summernote(
							'editor.pasteHTML',
							"<div style='font-size:100px'><span style='color: rgb(99, 99, 99); background-color: rgb(255, 255, 255);'>嗨，新年好</span></div>");
		}
		functoin emptyButton(){
			$("#MailTo").val("");
			$("#Mailsubject").val("");
			$("#compose-textarea")
			.summernote(
					'editor.pasteHTML',
					"");
			}
	</script>
</body>
</html>