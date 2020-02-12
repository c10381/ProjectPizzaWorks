let salesOrderDetails = cart.salesOrderDetails;

$(function () {
	updateList();
	$(".cartList").on('click',".del_btn", function(){
		var num = $(this).find("svg").data("num");
		deleteList(num);
	})
	
	$(".cartList").on('change', 'select',  function(){
		cart.salesOrderDetails[$(this).data("num")].quantity = parseInt($(this).val());
		
		totalPriceCal();
		let cartStr = JSON.stringify(cart);
		localStorage.setItem('cartList', cartStr);
	})
});


// 更新localStorage至網站上用
function updateList() {
	countnotif();
	let str = '';
	if((cart.length==0)||(cart==undefined)){
		$(".cancellation").hide();
	}
	if((cart==undefined)||(cart.length==0)||(salesOrderDetails==undefined)||(salesOrderDetails.length==0)){
		str = `
				<p class="h6 text-center ">還未將任何商品加入購物車</p>
				<div class="row justify-content-center">
						<a href= "../shop/menu" class="mt-3 col-md-8">
							<button type="button"
								class="btn btn-block btn-lg btn-outline-light rounded-full">繼續挑選</button>
						</a>
				</div>
				`
		$(".order-controll").hide();
		$(".totalPr").hide();

	}else{
		for (let i = 0; i < salesOrderDetails.length; i++) {
			str +=
				`<div class="pricing-entry d-flex ftco-animate fadeInUp ftco-animated">
					<div class="img" style="background-image: url(../picture/${salesOrderDetails[i].productId});">
				</div>
				<div class="desc pl-3">
					<div class="d-flex text align-items-center">
						<div class="col-11">
							<h3>${salesOrderDetails[i].productName}` 
				
			str += ` ${salesOrderDetails[i].size}`; 
			
			str += 			`</h3>
						</div>`
			// 價格部分要更新
			str += singlePriceCal(i); 
			str += `<div class="col-1 del_btn">
					<i class="far fa-trash-alt" data-num="${[i]}"></i>
				</div>
			</div>`; 
			// 數量部分下拉式選單
			index = i; 
			opt = insertQtty (salesOrderDetails[i].quantity, i);
			str += opt ;
						
			str +=`<span>${salesOrderDetails[i].crustTypeName}</span> 
					<span> / </span>`
			if (salesOrderDetails[i].doubleCheese == 1) {
				str += `<span>加量一份起司</span> <span>+25</span>`
			} else {
				str += `<span>正常起司</span>`
			}
			str +=`</div ></div ></div >`;
			$(".order-controll").show();
				
		}
		totalPriceCal();
	}
	 $(".cartList").html(str);
	 let cartStr = JSON.stringify(cart);
	 localStorage.setItem('cartList', cartStr);
}


//function sizeShow(size){
//	let str ; 
//	switch (size){
//	case "大":
//		str = "  13吋"; 
//	case "小":
//		str = "  9吋";
//	default: 
//		str = "  9吋 單一尺寸"; 
//	}
//	return str; 
//}

function singlePriceCal(index){
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
	
	if(unitPrice != salesOrderDetails[index].unitPrice){
		str += `<span class="price ml-5"><STRIKE> ${salesOrderDetails[index].unitPrice} </STRIKE> ${unitPrice}</span>`;
	} else{
		str += `<span class="price ml-5">${unitPrice}</span>`;
	}
	return str;
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
	$("#totalPrice").text(formatter.format(sum));
	cart.totalSales = sum;
}

function deleteList(num){
	salesOrderDetails.splice(num, 1);
	totalPriceCal();
	updateList();
}

var deleteAll = function (){
	$(".ftco-section").on('click', ".cancellation", function(){
		swal({
			  title: "確定取消購物?",
			  text: "您的動作將無法回覆",
			  icon: "warning",
			  buttons: ["取消","刪除"],
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  salesOrderDetails =[];
				  cart = {};
				  localStorage.removeItem('cartList');
				  window.setTimeout(function() {
					  countnotif();
					  deliveryWay();
					  updateList();
					}, 0);
			  } 
			});
	})
}()

var formatter = new Intl.NumberFormat('en-US', {
			  style: 'currency',
			  currency: 'TWD',
			  minimumFractionDigits: 0,
		});


// 動態新增
function insertQtty(qtty,index) {
	let str = "";
	const num = 10;
	str += `<div class="d-block"><select name="quantity" class="ml-3" data-num="${index}">`;
	for (let i = 1; i <= num; i++) {
		if(i==qtty){
			str += `<option value="${i}" selected>${i}</option>`;
		}else{
			str += `<option value="${i}">${i}</option>`;
		}
	}
	str += `</select>`;
	return str;
}

function chanceQtty(){
	
}