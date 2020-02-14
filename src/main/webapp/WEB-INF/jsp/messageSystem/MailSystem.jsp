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
				<div class="form-group row align-items-center">
				<div class="col-4">
					身分：
					<select id="privilege">
						<option value='1' selected>顧客</option>
						<option value='2'>員工</option>						
					</select>
				</div>
				<div class="col-8 row align-items-center">
					寄件人：
					<input type="text" class="form-control col-9" placeholder="請輸入姓名，自動搜尋..." id="MailTo" list="searchMem">
					<datalist id='searchMem'></datalist>
					<input type="hidden" name="answer" id="answerInput-hidden">
				</div>
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
					});
			$('#MailTo').on('input', function() {
				var searchKeyword = $(this).val();
				var privilege = $("#privilege").val();
				var ajaxDate;
				if (searchKeyword.length >= 1) {
					$.get('${pageContext.request.contextPath}/messageSystem/getEmail?name='+searchKeyword+"&privilege="+privilege, function(data) {
						
						$('#searchMem').empty();
						for(let i=0;i<Object.keys(data).length;i++){/* 
							console.log(Object.keys(data)[i]);
							console.log(Object.values(data)[i]); */
							ajaxDate=data;
							$('#searchMem').append("<option value=\'"+Object.values(data)[i]+"\' onclick='getEmail("+Object.values(data)[i]+")'>"+Object.keys(data)[i]+"</option>");							
						}
					}, "json");
				} else {
					$('#searchMem').empty();
				}
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
							"${pageContext.request.contextPath}/messageSystem/SendMail",
							{
								"to" : mailTo,
								"subject" : mailsubject,
								"Context" : mailcontext
							}, function(data) {
								if (data == true) {
									swal("寄送信件成功", "成功送出信件給 "+mailTo, "success");
									floatPageClose();
								}
							}) 
		}
		function DemoButton() {
			/* $("#MailTo").val("c10381@gmail.com"); */
			$("#Mailsubject").val("嗨，你好嗎？");
			$("#compose-textarea")
					.summernote(
							'editor.pasteHTML',
							"<div style='font-size:50px'><span style='color: rgb(99, 99, 99); background-color: rgb(255, 255, 255);'>感謝各位廠商今天到來</span></div>");
		}
		function emptyButton(){
			$("#MailTo").val("");
			$("#Mailsubject").val("");
			$("#compose-textarea")
			.summernote(
					'reset');
			}
	</script>
</body>
</html>