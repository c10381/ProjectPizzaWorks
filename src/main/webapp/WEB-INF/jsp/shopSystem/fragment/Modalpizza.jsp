<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- pizza Modal-->
<div class="modal fade" id="pizzaModal" tabindex="-1" role="dialog"
	aria-labelledby="PizzaModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title text-dark" id="PizzaModalLabel">請選擇您的披薩</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body ">
				<h5 class="text-dark"></h5>
				<div class="container">
					<div class="row">
						<div class="form-group">
							<label for="pizzaSize">披薩尺寸:</label> 
							<select name="pizzaSize" id="pizzaSize">
								<option value="large">大</option>
								<option value="small">小</option>
							</select> 
						</div>
						<div class="form-group">
							<label for="qtty">數量</label> 
							<select name="qtty" id="qtty"></select>
						</div>
					</div>
					<div class="row">
						<div class="form-group"> 
							<label for="crust">請選擇餅皮</label> 
						 	<select name="crust" id="crust"></select> 
						 </div>
						<div class="form-group">
							<label for="doubleCheese"></label> 
							<input type="checkbox" name = "doubleCheese" id = "doubleCheese">雙倍起司 +25
						</div>
					</div>
				</div>     
			</div>
			<div class="modal-footer">
				<c:forEach items="${ products}" var="item" varStatus="status">
					<c:if test="${status.first }">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal" data-id="${item.productId }">
							放入購物車 <span class="amount"> </span>
						</button>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>