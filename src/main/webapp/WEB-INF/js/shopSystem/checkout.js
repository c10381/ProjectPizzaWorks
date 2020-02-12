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
			.then((willDelete) => {
			  if (willDelete) {
				  sendOrder();
			  
			} 
		});
//		swal.fire({
//			 title: "是否送出訂單?",
//			 icon: "question",
//			 showCloseButton: true,
//			 showCancelButton: true,
//			 confirmButtonColor: '#fac564',
//			 background: "#121618", 
//		})
	})
});

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
			localStorage.clear();
			updateList();
			swal({
				  title: "訂單送出成功",
				  icon: "success",
				  timer: 3000,
				}).then(()=>{
					 window.location.replace("../");
				})
		  
		}else{
			swal("訂單送出失敗，請稍後再試")
		}
	}).fail(function(){
		swal("訂單送出失敗，請稍後再試")
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
	str += `<h3 class="ml-2">${totalPriceCal()}</h3></div>`;
	
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
	
//	if(unitPrice != salesOrderDetails[index].unitPrice){
//		str += `<span class="price col-sm-3">${unitPrice}</span>`;
//	} else{
//		str += `<span class="price col-sm-3">${unitPrice}</span>`;
//	}
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
			localStorage.clear();
			updateList();
			swal({
				  title: "訂單送出成功",
				  icon: "success",
				  timer: 3000,
				}).then(()=>{
					 window.location.replace("../");
				})
		  
		}else{
			swal("訂單送出失敗，請稍後再試")
		}
	}).fail(function(){
		swal("訂單送出失敗，請稍後再試")
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
