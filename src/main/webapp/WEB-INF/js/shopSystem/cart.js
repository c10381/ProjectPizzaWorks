//let cart = JSON.parse(localStorage.getItem('cartList')) || {};
let salesOrderDetails = cart.salesOrderDetails;
//console.log(salesOrderDetails)
$(function () {
	updateList();
	$(".cartList").on('click',".del_btn", function(){
		var num = $(this).find("svg").data("num");
		deleteList(num);
	})
	totalPriceCal();
	chanceQtty();
	
});


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
							<h3>${salesOrderDetails[i].productName} ${salesOrderDetails[i].size}披薩</h3>
						</div>
						<span class="price">${salesOrderDetails[i].unitPrice}</span>
						<div class="col-1 del_btn">
							<i class="far fa-trash-alt" data-num="${[i]}"></i>
						</div>
				</div>`
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
	}
	 $(".cartList").html(str);
	 let cartStr = JSON.stringify(cart);
	 localStorage.setItem('cartList', cartStr);
}


function totalPriceCal(){
	let sum = 0 ;
	// 每個單品價錢
	$.each(salesOrderDetails,function(index,val){
		sum += (val.unitPrice);
		if(val.doubleCheese==1){
			sum+= priceDoubleCheeese;
		}
		let crustTypeId = val.crustTypeId
		$.each(crustPrice,function(index,val){
			//根據餅皮編號來取得價格
			if(index==crustTypeId){
				sum+= val;
			}
		})
		sum = sum* val.quantity;
	})
	$("#totalPrice").text(formatter.format(sum));
	cart.totalSales = sum;
}

function deleteList(num){
	salesOrderDetails.splice(num, 1);
	updateList();
	totalPriceCal()
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
					}, 100);
				  
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
	$("select").on('change', function(){
		cart.salesOrderDetails[$(this).data("num")].quantity = parseInt($(this).val());
		
		totalPriceCal();
		let cartStr = JSON.stringify(cart);
		localStorage.setItem('cartList', cartStr);
	})
}