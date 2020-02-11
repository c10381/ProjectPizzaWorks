<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pizza Bite| 顧客訂單檢視</title>
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<jsp:include page="fragment/ContentCSS.jsp" />
</head>
<body>
<jsp:include page="fragment/navbar.jsp" />
<!-- MainContent -->
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-8 heading-section ftco-animate text-center">
					<h2 class="mb-4">訂單查詢 </h2>
				</div>
			</div>
		</div>
		<!-- / container 標題 -->
		<div class="container col-md-8" id="salesOrder">
		</div>
		<!-- /Container -->
	</section>
<!-- End MainContent -->
<jsp:include page="fragment/footer.jsp" />
<jsp:include page="fragment/loader.jsp" />
<jsp:include page="fragment/ContentJS.jsp" />

<script>
$(function(){
	let orders = ${orders};
	order = orders.reverse();
	let order_str = "";
	console.log(order)
	
	if(orders.length!=0){
		order_str +=`<div class="accordion" id="accordionOrder">`;
		//塞資料囉
		orders.forEach(function(item, index , array){
			order_str += order_generate(item);
		});
		order_str += `</div>`;
	}else{
		order_str = `<h5 class="text-center">查無訂單</h5>`
	}
	$("#salesOrder").html(order_str);
})

function order_generate(obj){
	let dtl_ary = obj.salesOrderDetails;
	let str = "";
	str +=`<div class="card my-5">`; 
	// header部分
	str += `<div class="card-header" id="heading\${obj.salesOrderId}">
				<div class="row justify-content-between  align-items-center">
						<p class="col-md-3">\${dateFormat(obj.orderTime)}</p>
						<p class="col">訂單編號<span>\${obj.salesOrderId}</span></p>
						<p class="col-md-3">訂單金額<span class="totalSales">\${obj.totalSales}</span></p>
						<p class="col-md-3">訂單狀態<span>\${obj.orderStatus}</span></p>
						<div class="col-sm-1">	
							<a href="#collapse\${obj.salesOrderId}" data-toggle="collapse" aria-expanded="true"
							aria-controls="collapse\${obj.salesOrderId}" class="icon icon-plus"></a>
					   </div>`
	str += `	</div>
		   </div>`; 
	// End of header
	// Body 訂單部分
	str += `<div id="collapse\${obj.salesOrderId}" class="collapse" aria-labelledby="heading\${obj.salesOrderId}" data-parent="#accordionOrder">
				<div class="card-body">
					<div class="row justify-content-between"> 
						<div class="col-md-3">`;
	// 取餐方式
	str += `<div class="row">
				  <div class="col mb-2">
					<div class="row_label">取餐方式 </div>
					<div class="row_content">\${obj.needDelivery} </div>
				  </div>
			</div>` ;
	// 外送地址
	str += `<div class="row">
				<div class="col mb-2">
					<div class="row_label">外送地址 </div>
					<div class="row_content">\${obj.deliverAddress} </div>
				</div>
			</div>`; 
	// 餐點備註
	str += `<div class="row">
				<div class="col mb-2">
					<div class="row_label">餐點備註</div>
					<div class="row_content pr-2">\${obj.note}</div>
				</div>
			</div>` ;
	// 訂單部分結束
	str += `</div>
				<div class="col-md-1">
					<div class="row">
						<div class="row_label">購買項目</div>
					</div>
				</div>`
	// 開始處理訂單明細
	str += `<div class="col-md-8">`
	
	dtl_ary.forEach(function(item, index , self){
		 str += order_dtl_generate(item);	
	})
	
	str += `</div>`;
		
	// 單筆訂單結束
	str += `	</div></div>
			</div>
		</div>`;
	return str ; 
};


function order_dtl_generate(obj){
	let str ="";
	// 訂單明細部分
	str += `<div class="row no-gutters detail_item ">
					<a href="#" class="col-4">\${obj.productName}</a>
					<div class="row_content quantity col-1 ">\${obj.quantity}</div>
					<div class="row_content crust col-2">\${obj.crustTypeName}</div>
					<div class="row_content cheese col-3">\${obj.Cheese}</div>
					<div class="row_content totalPrice col-2">\${obj.unitPrice}</div>
				</div>`
			;
	return str ; 
}

function dateFormat(date){
	index = date.lastIndexOf(":");
	return date.substring(0,index);
}

</script>
</body>
</html>