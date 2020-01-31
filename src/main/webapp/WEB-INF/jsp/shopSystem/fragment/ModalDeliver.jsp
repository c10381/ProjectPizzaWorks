<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- deliever Modal-->
<div class="modal fade" id="delieverModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="exampleModalLabel">取餐方式</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<p>請選擇取餐方式</p>
						<select name="delieverType">
							<option value="takeout">來店取餐</option>
							<option value="delivery">外送到府</option>
						</select>
					</div>

					<div class="takeOutInfo ">
						<div class="row">
							<p>預計取餐時間</p>
							<div class="flatpickr">
								<input type="text" data-input /> <a class="input-button"
									title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="delieveryInfo">
						<div class="row">
							<p>預計送達時間</p>
							<div class="flatpickr">
								<input type="text" data-input /> <a class="input-button"
									title="toggle" data-toggle> <i class="far fa-calendar-alt"></i>
								</a>
							</div>
						</div>
						<div class="row">
							<p>外送地址</p>
							<input type="text" name="deliverAddress" id="address"/>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<a class="btn btn-primary next" href="#" data-dismiss="modal">下一步</a>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>