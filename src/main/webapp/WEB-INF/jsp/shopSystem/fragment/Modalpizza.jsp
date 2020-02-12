<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- pizza Modal-->
<div class="modal fade order_modal" id="pizzaModal" tabindex="-1"
	role="dialog" aria-labelledby="PizzaModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="PizzaModalLabel">請選擇您的披薩</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<h5 class="text-light py-3"></h5>
				<div class="row-fluid">
					<div class="form-group">
						<label for="pizzaSize" class="md_label">披薩尺寸:</label> <select
							name="pizzaSize" id="pizzaSize" class="md_content">
							<option value="large">大</option>
							<option value="small">小</option>
						</select>
					</div>
					<div class="form-group">
						<label for="qtty" class="md_label">數量</label> <select name="qtty"
							id="qtty" class="md_content"></select>
					</div>
				</div>
				<div class="row-fluid">
					<div class="form-group">
						<label for="crust" class="md_label">請選擇餅皮</label> <select
							name="crust" id="crust" class="md_content"></select>
					</div>
				</div>
				<div class="row-fluid">
					<div class="form-group ">
						<div class="col align-items-center">
							<input type="checkbox" name="doubleCheese" id="doubleCheese">
							<label for="doubleCheese" class="md_label">雙倍起司 +25</label>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<c:forEach items="${ products}" var="item" varStatus="status">
					<c:if test="${status.first }">
						<button class="btn btn-primary" type="button" data-dismiss="modal"
							data-id="${item.productId }">
							放入購物車 <span class="amount"> </span>
						</button>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>