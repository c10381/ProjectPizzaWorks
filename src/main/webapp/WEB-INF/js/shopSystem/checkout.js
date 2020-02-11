let salesOrderDetails = cart.salesOrderDetails;

$(function () {
	if(cart.needDelivery==0){
		$("form div.d-md-flex:nth-of-type(2) .form-group").hide();
	}
	updateList();
	formInfo();
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
function insertPrice(index){
	let str = "";
	let flag = false;
	let crustTypeId = salesOrderDetails[index].crustTypeId;
	let cp;
	$.each(crustPrice,function(index,val){
		//根據餅皮編號來取得價格
		if(crustTypeId==index){
			flag = true;
			cp = val;
			return false; 
		}
	});
	if(salesOrderDetails[index].doubleCheese==1) {
		flag = true;
	}
	
	let price = salesOrderDetails[index].unitPrice + cp + priceDoubleCheeese;
	if(flag){
		str += `<span class="price ml-5"><STRIKE> ${salesOrderDetails[index].unitPrice} </STRIKE> ${price}</span>`;
	} else{
		str += `<span class="price ml-5">${salesOrderDetails[index].unitPrice}</span>`;
	}
	return str;
	
	
}

	
