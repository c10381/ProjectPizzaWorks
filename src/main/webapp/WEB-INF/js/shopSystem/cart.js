//let cart = JSON.parse(localStorage.getItem('cartList')) || {};
let salesOrderDetails = cart.salesOrderDetails;
console.log(cart);

$(function () {
	updateList();
	$(".cartList").on('click',".del_btn", function(){
		var num = $(this).find("svg").data("num");
		deleteList(num);
	})
});


function updateList() {
	countnotif();
	let str = '';
	if(cart.length==0||salesOrderDetails.length==0  ){
		str = `<p class="h6 text-center ">還未將任何商品加入購物車</p>
					<div class="col-md-6 justify-content-center mx-auto mt-3">
						<a href= "../shop/menu" class="mt-3">
							<button type="button"
								class="btn btn-block btn-lg btn-outline-light rounded-full">繼續挑選</button>
						</a>
					</div>`
		$(".order-controll").hide();
		
	}else{
		for (let i = 0; i < salesOrderDetails.length; i++) {
			str +=
				`
				<div class="pricing-entry d-flex ftco-animate fadeInUp ftco-animated">
				<div class="img" style="background-image: url(../images/shopSystem/pizza-3.jpg);"></div>
				<div class="desc pl-3">
	      	<div class="d-flex text align-items-center">
						<div class="col-11">
							<h3>${salesOrderDetails[i].productName} ${salesOrderDetails[i].size}披薩</h3>
						</div>
						<span class="price">${salesOrderDetails[i].unitPrice}</span>
						<div class="col-1 del_btn">
							<i class="far fa-trash-alt" data-num="${[i]}"></i>
						</div>
				</div>
					<div class="d-block">
						<select name="quantity" class="ml-3">
							<option value="1">1</option>
								<option value="2">2</option>
							<option value="3">3</option>
							</select>
							
						<span>${salesOrderDetails[i].crustTypeName}</span> 
						
						<span> / </span>
			`
			if (salesOrderDetails[i].doubleCheese == 1) {
				str += `<span>加量一份起司</span> <span>+25</span>`
			} else {
				str += `<span>正常起司</span>`
			}
			str +=`</div ></div ></div >`;
			$(".order-controll").show();
				
		}
	}		
	$(".cartList").html(str);
	 let cartStr = JSON.stringify(cart);
	 localStorage.setItem('cartList', cartStr);
}




function deleteList(num){
	salesOrderDetails.splice(num, 1);
	updateList();
}


	
