let cart = JSON.parse(localStorage.getItem('cartList')) || {};

$(function() {
	countnotif();
})


function countnotif(){
	if(cart.salesOrderDetails!=undefined){
		let size = cart.salesOrderDetails.length;
		$(".count-notif").html(size);
	}
}