let salesOrderDetails = cart.salesOrderDetails;

$(function () {
	if(cart.needDelivery==0){
		$("form div.d-md-flex:nth-of-type(2) .form-group").hide();
	}
	updateList();
	formInfo();
	
	
	// 點擊送出按鈕時，送出訂單
	$(":button").click(function(e){
		e.preventDefault();
		cart.note = $("#note").val();
		if(cart.needDelivery==0){
			cart.deliverAddress = "店取";
		}
		swal({
			  title: "是否送出訂單?",
			  icon: "warning",
			  buttons: ["取消","送出"],
			})
			.then((value) => {
			  if (value) {
			   sendOrder();
			} 
		});
	})
});


function sendPayPal(){
//	送出現金結帳
	$.ajax({
	    type : "POST", 
	    url : "../PaypalTest/paypalCheckout",
	    data : JSON.stringify(cart),
	    contentType : "application/json",
	    
	}).done(function(){
		// 動作請再修改
		swal("成功")
	}).fail(function(){
		// 動作請再修改
		swal("失敗"); 
	})
	
}

function updateList() {
	let str = '';
	let row_order_control = '';
	if(cart.length==0 ||cart==undefined ){
		window.location.replace("../shop/");
	}else{
		for (let i = 0; i < salesOrderDetails.length; i++) {
			str +=
				`
				<div class="pricing-entry d-flex ftco-animate fadeInUp ftco-animated">
					<div class="img" style="background-image: url(../picture/${salesOrderDetails[i].productId});"></div>
						<div class="desc pl-3">
							<div class="d-flex text align-items-center">
								<div class="col-md-11">
									<h3>${salesOrderDetails[i].productName} ${salesOrderDetails[i].size}披薩</h3>
								</div>`;
			//當有餅皮或加起司時，價格做變動
			str += insertPrice(i);
			str +=`</div>
						<div class="d-block">
							<span> 數量： ${salesOrderDetails[i].quantity}</span>
							<span>${salesOrderDetails[i].crustTypeName}</span> 
							<span> / </span>`
			if (salesOrderDetails[i].doubleCheese == 1) {
				str += `<span>加量一份起司</span> <span>+25</span>`
			} else {
				str += `<span>正常起司</span>`
			}

			str +=`</div >
				</div >
			</div >
			`
		}
	}	
	
	str += `<div class="row pt-3"><h2>總金額</h2>`; 
	str += `<h3 class="ml-2 price">${totalPriceCal()}</h3></div>`;
	
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
function insertPrice(index){
	let str = "";
	let unitPrice = salesOrderDetails[index].unitPrice; 
	let crustTypeId = salesOrderDetails[index].crustTypeId;
	crustPrice.forEach(function(item, index, array){
		if(crustTypeId==index){
			unitPrice += item; 
		}
	})
	
	if(salesOrderDetails[index].doubleCheese==1) {
		unitPrice += priceDoubleCheeese; 
	}
	
	str += `<span class="price col-sm-3">${unitPrice}</span>`;
	return str;
}

function sendOrder(){
//	送出訂單
	$.ajax({
	    type : "POST", 
	    url : "../shop/order",
	    data : JSON.stringify(cart),
	    contentType : "application/json",
	    dataType: "text",
	}).done(function(result){
		if(result=="OK"){
			  swal({
				  title: "訂單送出成功",
				  icon: "success",
				  buttons: {
					  paypal:{
						  text: "使用PayPal付款",
						  value: "paypal"
					  },
					  cash: {
						  text: "現金付款",
					  },
				  }
				}).then((value)=>{
					switch(value){
					case "paypal":
						swal("PayPal");
						sendPayPal(); 
				        break;
					case "cash":
						swal({
						text: "您的訂單已完成(現金付款)，將為您導向訂單畫面",
						timer: 3000,
					}).then(()=>{
						localStorage.clear();
						updateList();
						window.location.replace("../member/orders");
					})
						break; 
					default:
						swal("訂單已完成");
					}
				})
				// End of Swal 
		}else{
			swal("訂單送出失敗，請稍後再試或請與客服人員聯絡")
		}
	}).fail(function(){
		swal("訂單送出失敗，請稍後再試或請與客服人員聯絡")
	})
}	


function totalPriceCal(){
	let sum = 0 ;
	// 每個單品價錢
	salesOrderDetails.forEach(function(item, index, array){
		let unitPrice = item.unitPrice; 
		if(item.doubleCheese==1){
			unitPrice += priceDoubleCheeese; 
		}
		// 根據餅皮編號來取得價格
		let crustTypeId = item.crustTypeId; 
		// 產品價格的陣列去與餅皮編號做比較
		crustPrice.forEach(function(item , index){
			if(index==crustTypeId){
				unitPrice += item;
			}
		})
		sum += unitPrice * item.quantity; 
	})
	// 將價格塞入網頁上，同時更新到變數中
	cart.totalSales = sum;
	return sum; 
}
