let cart = JSON.parse(localStorage.getItem('cartList')) || {};
let salesOrderDetails = cart.salesOrderDetails;
// 還沒做 先用插入的

cart.deliverAddress = "店取";
cart.requireTime = "2020-01-22 19:00:15";
cart.totalSales = 8888;
console.log(cart)

$(function () {
	updateList();
	formInfo();
	
	$(":button").click(function(e){
		e.preventDefault();
		if(confirm("是否送出訂單?")){
			
			$.ajax({
			    type : "POST", 
			    url : "../shop/order",
			    data : JSON.stringify(cart),
			    contentType : "application/json",
			    dataType: "text",
			}).done(function(result){
				console.log(result);
				if(result=="OK"){
					localStorage.clear();
					updateList();
					alert("訂單新建成功");
					window.location.replace("../shop/");
				}
			})
			
		};
		
		
	})
});



function updateList() {
	let str = '';
	let row_order_control = '';
	let cartSize = salesOrderDetails.length;
	if(cartSize==0 ||salesOrderDetails==undefined ){
		window.location.replace("../shop/");
	}else{
		for (let i = 0; i < cartSize; i++) {
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

			str +=`</div ></div ></div >`
		}
		

		
	}		
	$(".cartList").html(str);
}


 function formInfo(){
	let deliveryType = cart.needDelivery;
	if(deliveryType==0){
		$(":text[name='needDelivery']").val("來店取餐");
		$(":text[name='deliverAddress']").val(cart.deliverAddress);
	} else{
		$(":text[name='needDelivery']").val("外送");
		$(":text[name='deliverAddress']").val(cart.deliverAddress);
	}
	
	$(":text[name='requireTime']").val(cart.requireTime);
	
}


	
