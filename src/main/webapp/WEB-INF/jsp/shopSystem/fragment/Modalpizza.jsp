<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- pizza Modal-->
<div class="modal fade" id="pizzaModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="exampleModalLabel">請選擇你的披薩</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<select name="size">
					<option value=" large">大</option>
					<option value="small">小</option>
				</select>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">
					放入購物車<span class="amount"> $355</span>
				</button>
			</div>
		</div>
	</div>
</div>