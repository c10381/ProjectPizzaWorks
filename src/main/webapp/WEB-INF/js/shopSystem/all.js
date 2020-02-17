
let cart = JSON.parse(localStorage.getItem('cartList')) || {};
let freight = 60 ; 
let priceDoubleCheeese = 25; 
let crustPrice = [0 , 0 , 60]

$(function() {
	countnotif();
	deliveryWay();
	
	$("#twzipcode").twzipcode({
		'zipcodeIntoDistrict': true,
		'css': ['county','district'],
		'hideCounty': ['基隆市', '宜蘭縣','新竹市', '新竹縣','桃園市', '苗栗縣', 
			'臺中市', '南投縣', '彰化縣','嘉義市','嘉義縣', '雲林縣','臺南市', '高雄市','屏東縣', '臺東縣','花蓮縣', '澎湖縣','連江縣', '金門縣'],
		'hideDistrict': ['207', '208', '221','222', '223', '224', '226', '227', '228',
						 '232', '233','236', '237', '238', '239', '243','244',  '248', '249', '251', '252', '253'] 
	});
	
	
	
	$("#demoToCart").click(function(){
		$("#address").val("仁愛路三段99號");
	})
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

