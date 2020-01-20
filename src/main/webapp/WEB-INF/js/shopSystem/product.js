var cart = JSON.parse(localStorage.getItem('cartList')) || {};
const doubleCheese = 25;
console.log(cart);

$(function () {
	var url = location.href;
	if(url.indexOf('?')!=-1)
	{
	    var id = "";
	    //在此直接將各自的參數資料切割放進ary中
	    var ary = url.split('?');
	    //下迴圈去搜尋每個資料參數
	    for(i=0;i<=ary.length-1;i++)
	    {
	        //如果資料名稱為id的話那就把他取出來
	        if(ary[i].split('=')[0] == 'name')
	            name = ary[i].split('=')[1];
	    }
 	    name = decodeURI(name);
 	   $("#productName").append(name);
	}
	
    $("#addCart").click(function () {
        if (cart.needDelivery == undefined) {
            checkDeliver();
        } else { 
        	checkPizza(); 
        }
    })
});


// 外帶方式確認
function checkDeliver() {
    $("#delieverModal").modal("show");
    $("#delieverModal a").click(function () {
        var deliverType = $("#delieverModal select").val();
        if (deliverType == "delivery") {
            cart.needDelivery = 1;
        } else {
            cart.needDelivery = 0;
        }
        checkPizza()
    })
}

// pizza規格確認

function checkPizza() {
    let productName = $("#productName").text()
    $("#pizzaModal").modal("show");
    // 插入Model相關資訊
    $(".modal-body h5").empty().append(productName);
    insertQtty();
    insertCrust();

    // 放入購物車
    $("#pizzaModal .btn").click(function () {
    	let productId = $(this).data("id");
        updateCart(productId);
        let cartStr = JSON.stringify(cart);
        localStorage.setItem('cartList', cartStr);
    })
}


// 用於將產品細項加入購物車
function updateCart(productId) {
    this.productId = productId;
    var detail = {
        "productName": "",
        "productId": 0,
        "unitPrice": 0,
        "quantity": 0,
        "doubleCheese": 0,
        "crustTypeId": 0,
        "crustTypeName": ""
    };


    // 產品名稱
    detail.productName = $("#productName").text();
    // 數量資訊
    detail.quantity = parseInt($("#qtty option:selected").val());
    // 產品大小資訊 與 產品編號
    let size = $("#pizzaSize option:selected").val();
    if (size == "large") {
    	detail.size= "大";
        productId = productId;
    } else {
        productId += 1;
        detail.size= "小";
    }

    // 產品編號
    detail.productId = productId;

    // 產品價格
    $(".price").each(function () {
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
    cart.salesOrderDetails.push(detail);
   
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
         type: "GET",
         url: "../shop/getCrust",
         dataType : "json",
     }).done(function(data){
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
