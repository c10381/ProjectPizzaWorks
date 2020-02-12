const doubleCheese = 25;


$(function() {
	// 暫時方法 存取商品名稱
	var url = location.href;
	if (url.indexOf('?') != -1) {
		var id = "";
		// 在此直接將各自的參數資料切割放進ary中
		var ary = url.split('?');
		// 下迴圈去搜尋每個資料參數
		for (i = 0; i <= ary.length - 1; i++) {
			// 如果資料名稱為id的話那就把他取出來
			if (ary[i].split('=')[0] == 'name')
				name = ary[i].split('=')[1];
		}
		name = decodeURI(name);
		$("#productName").append(name);
	}

	$("#addCart").click(function() {
		if (cart.needDelivery == undefined) {
			checkDeliver();
		} else {
			checkPizza();
		}
	})
	
	$(".staff").on("click", ".goToMenu", function(){
		location.replace('../shop/cart');
	})
});

// 外帶方式確認
function checkDeliver() {
	$("#delieverModal").modal("show");
	$(".delieveryInfo").hide();
	insertTime();

	$("select[name='delieverType']").change(function() {
		$(".flatpickr-input").val("");
		$(".takeOutInfo").toggle();
		$(".delieveryInfo").toggle();

	})

	$("#delieverModal .next").click(function() {
		var deliverType = $("#delieverModal select").val();

		// 取得需求日期
		$(".flatpickr-input").each(function() {
			if($(this).val()!=""){
				cart.requireTime = ($(this).val());
			};
		})

		if (deliverType == "delivery") {
			cart.needDelivery = 1;
			cart.deliverAddress = $("#address").val();
		} else {
			cart.needDelivery = 0;
		}
		checkPizza();
	})
}

// pizza規格確認
function checkPizza() {
	let productName = $("#productName").text()
	$("#pizzaModal").modal("show");
	// 插入Model相關資訊
	$(".modal-body h5").empty().append(productName);
	
	let productPrice = [];
	$(".price").each(function(index, value){
		productPrice.push(parseInt($(this).html().trim()));
	}); 
	// 處理只有單一產品的下拉式選單
	let length =  productPrice.length ; 
	if(length<=1){
		$("#pizzaSize").html('<option value="one">單一尺寸</option>');
		$("#pizzaSize").attr("disabled", true);
	}
	insertQtty();
	insertCrust();

	// 放入購物車
	$("#pizzaModal .btn").click(function() {
		let productId = $(this).data("id");
		updateCart(productId);
		let cartStr = JSON.stringify(cart);
		localStorage.setItem('cartList', cartStr);
		
		// 將按鈕改變狀態使其無法點擊
		$("#addCart").text("已加入購物車，前往結帳");
		$("#addCart").off("click");
		$("#addCart").addClass("goToMenu");
		$("#addCart").removeAttr("id");
		
		
	})
}

// 用於將產品細項加入購物車
function updateCart(productId) {
	this.productId = productId;
	var detail = {
		"productName" : "",
		"productId" : 0,
		"unitPrice" : 0,
		"quantity" : 0,
		"doubleCheese" : 0,
		"crustTypeId" : 0,
		"crustTypeName" : ""
	};

	let productPrice = [];
	$(".price").each(function(index, value){
		productPrice.push(parseInt($(this).html().trim()));
	}); 
	
	// 產品名稱
	detail.productName = $("#productName").text();
	// 數量資訊
	detail.quantity = parseInt($("#qtty option:selected").val());
	// 產品大小資訊 與 產品編號
	let size = $("#pizzaSize option:selected").val();
	
//	if (size == "large") {
//		detail.size = "大";
//		productId = productId;
//	} else {
//		productId += 1;
//		detail.size = "小";
//	}
	switch(size){
	case "large" :
		detail.size = "大";
		productId = productId;
		detail.unitPrice = productPrice[0];
		break;
	case "small" :
		detail.size = "小";
		productId = productId +1 ;
		detail.unitPrice = productPrice[1];
		break;
	case "one" :
		detail.size = "單一尺寸";
		productId = productId ;
		detail.unitPrice = productPrice[0];
		break;
	}

	// 產品編號
	detail.productId = productId;

	// 產品價格
	$(".price").each(function() {
		if (productId == $(this).data("id")) {
			detail.unitPrice = parseInt($(this).text());
		}
	})

	// 是否增加起司
	if ($("input[name='doubleCheese']").prop("checked")) {
		detail.doubleCheese = 1;
	}

	// 餅皮
	detail.crustTypeId = parseInt($("select[name=crust]").val());
	detail.crustTypeName = $("select[name=crust] :selected").text();

	if (cart.salesOrderDetails == undefined) {
		cart.salesOrderDetails = []
	}
	
	let index = checkDoubleAdd(detail.productId, detail.doubleCheese, detail.crustTypeId); 
	if(index!=-1){
		if(cart.salesOrderDetails[index].quantity+detail.quantity > 10){
			swal({
				title: "購物車單一品項不得大於10樣",
				  icon: "warning",
			})
		}else{
			cart.salesOrderDetails[index].quantity += detail.quantity; 
		}
	}else{
		cart.salesOrderDetails.push(detail);
	}
	
	countnotif();

}

//判斷購物車是否有相同品項
function checkDoubleAdd( productId, doubleCheese , crustTypeId){
	let detailIndex = -1; 
	cart.salesOrderDetails.forEach(function(item , index){
		if(item.productId==productId && item.doubleCheese == doubleCheese && item.crustTypeId == crustTypeId){
			detailIndex = index ; 
		} 
	})
	return detailIndex; 
}

// 動態插入pizza選擇數量
function insertQtty() {
	let option = "";
	const num = 10;
	for (let i = 1; i <= num; i++) {
		option += `<option value="${i}">${i}</option>`;
	}
	$("#qtty").empty().append(option);
}

// 動態插入pizza餅皮選擇
function insertCrust() {
	$.ajax({
				type : "GET",
				url : "../shop/getCrust",
				dataType : "json",
			})
			.done(
					function(data) {
						let option = "";
						for (let i = 0; i < data.length; i++) {
							option += `<option value="${data[i].crustTypeId}">${data[i].crustTypeName}`;
							const price = data[i].unitPrice;
							if (price != 0) {
								option += ` + ${price} `;
							}
							option += `</option>`
						}
						$("#crust").empty().append(option);
					})
}

function insertTime() {
	flatpickr(".flatpickr", {
		altInputClass : "form-group",
		enableTime : true,
		plugins : [ new confirmDatePlugin({
			confirmText : "確定",
			showAlways : false,
			theme : "light"
		}) ],
		time_24hr : true,
		minDate : "today",
		maxDate : new Date().fp_incr(7),
		wrap : true,
	});
}