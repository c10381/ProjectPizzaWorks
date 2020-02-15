<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- deliever Modal-->
<div class="modal fade order_modal" id="delieverModal" tabindex="-1" role="dialog"
	aria-labelledby="DeliverModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="DeliverModalLabel">取餐方式</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<p class="md_label">請選擇取餐方式</p>
						<select name="delieverType" class="md_content">
							<option value="takeout">來店取餐</option>
							<option value="delivery">外送到府</option>
						</select>
					</div>

					<div class="takeOutInfo ">
						<div class="row">
							<p class="md_label">預計取餐時間</p>
							<div class="flatpickr">
								<input type="text" class="md_content" data-input /> <a class="input-button"
									title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="delieveryInfo">
						<div class="row">
							<p class="md_label">預計送達時間</p>
							<div class="flatpickr">
								<input type="text" class="md_content" data-input /> <a class="input-button"
									title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
								</a>
							</div>
						</div>
						<div class="row">
							<p class="md_label">外送地址</p>
							<input type="text" class="md_content" name="deliverAddress" id="address"/>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
				<a class="btn btn-primary next" href="#">下一步</a>
			</div>
		</div>
	</div>
</div>