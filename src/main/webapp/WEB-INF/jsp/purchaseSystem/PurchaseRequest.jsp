<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>請購單</title>
<style>
textarea {
   resize: none;
}
</style>

</head>
<body>
	<section class="py-5">
		<div class="container ">
			<div class="card">
				<div class="card-header bg-light">請購單</div>
				<div class="card-body">
					<form>
						<div class="form-group row ">
							<label for="requestTime" class="col-sm-2 col-form-label">日期</label>
							<div class='col-sm-4' id='requestTime'>
								<input type='text' class="form-control" disabled />
							</div>
						</div>
						<div class="form-group row ">
							<label for="proposalerId" class="col-sm-2 col-form-label">承辦人</label>
							<div class='col-sm-4' id='proposalerId'>
								<input type='text' class="form-control"
									value="${Mem_LoginOK.firstName }" />
							</div>
						</div>
						<div class="form-group row ">
							<label for="purchaseReason" class="col-sm-2 col-form-label">請購理由</label>
							<div class='col-sm-4' id='purchaseReason'>
								<textarea cols="50" rows="3" maxlength="100" class="form-control" placeholder="請簡述本次請購理由..."></textarea>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</section>

	<script>
		$(document).ready(
				function() {
					Date.prototype.yyyymmdd = function() {
						var mm = this.getMonth() + 1; // getMonth() is zero-based
						var dd = this.getDate();

						return [ this.getFullYear(), (mm > 9 ? '' : '0') + mm,
								(dd > 9 ? '' : '0') + dd ].join('-');
					};

					var date = new Date();
					$("#requestTime input").val(date.yyyymmdd());
				});
	</script>

</body>
</html>