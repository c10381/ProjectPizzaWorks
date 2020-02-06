let cart = JSON.parse(localStorage.getItem('cartList')) || {};
let freight = 60 ; 
let priceDoubleCheeese = 25; 
let crustPrice = [0 , 0 , 60]

$(function() {
	countnotif();
	deliveryWay();
})


function countnotif(){
	if(cart.salesOrderDetails!=undefined){
		let size = cart.salesOrderDetails.length;
		$(".count-notif").html(size);
	}else{
		$(".count-notif").html(0);
	}
}

function deliveryWay(){
	if(cart.needDelivery!=undefined){
		let way = (cart.needDelivery==0)? "來店取餐" : "外送"
		str = `<li class="nav-item way"><p class="nav-link">取餐方式 | ${way}</p></li>`;
		$(".nav-rt ul").prepend(str);
	}else{
		$(".nav-rt ul .way").remove();
	}
}

