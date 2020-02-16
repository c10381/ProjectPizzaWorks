<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>

<html>
<head>
<title>Pizza Bite| Contact Us</title>
<jsp:include page="fragment/ContentCSS.jsp" />
<jsp:include page="fragment/ContentMetaInfo.jsp" />
<style>
.ftco-about h2 span {
	color: #fac564;
}

.ftco-about .form-control {
	font-size: 18px;
}

.ftco-about textarea, .ftco-about input::placeholder, .ftco-about textarea::placeholder
	{
	font-size: 18px;
}

.ftco-about .invalid-feedback {
	font-size: 18px;
	color: #fac564;
}

.ftco-about .about-left {
	padding-top: 5%;
}

.ftco-about img {
	min-height: 1060px;
}
</style>
</head>
<body>
	<jsp:include page="fragment/navbar.jsp" />

	<!-- MainContent -->
	<section class="ftco-about d-md-flex ">
		<div class="one-half img"
			style="background-image: url(${pageContext.request.contextPath}/images/shopSystem/bg_2.jpg);"></div>
		<!-- 	end of one-half -->

		<div class="one-half about-left">
			<h2 class="mb-4">
				<span class="flaticon-pizza">Pizza Bite</span> &nbsp聯絡我們
			</h2>
			<form class="contact-form needs-validation" id="customerForm" novalidate>
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="您的大名" name="name"
								required>
							<div class="invalid-feedback">您的稱呼必須輸入</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<input type="text" class="form-control" name="email"
								placeholder="請留下您的Email"
								pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>
							<div class="invalid-feedback">請輸入正確Email格式</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<textarea name="content" id="content" cols="30" rows="7"
						class="form-control" placeholder="請給我們您的建議內容" required></textarea>
					<div class="invalid-feedback">必須輸入</div>
				</div>
				<div class="row justify-content-end">
					<div class="form-group mr-5">
						<input type="button" class="btn btn-white btn-outline-white py-3 px-5 " value="demo" id="demo" />
					</div>
					<div class="form-group ml-5">
						<input type="reset" value="清除"
							class="btn btn-white btn-outline-white py-3 px-5">
					</div>
					<div class="form-group ml-5">
						<input type="submit" value="送出" class="btn btn-primary py-3 px-5">
					</div>
				</div>
			</form>
		</div>
	</section>
	
	<!-- End of MainContent -->
	<jsp:include page="fragment/footer.jsp" />
	<jsp:include page="fragment/loader.jsp" />
	<jsp:include page="fragment/ContentJS.jsp" />
	<script>
	   (function () {
           'use strict';
           window.addEventListener('load', function () {
               var forms = document.getElementsByClassName('needs-validation');
               var validation = Array.prototype.filter.call(forms, function (form) {
                   form.addEventListener('submit', function (event) {
                       event.preventDefault();
                       event.stopPropagation();
                       if (form.checkValidity() === false) {
                           form.classList.add('was-validated');
                       } else {
                          swal({
                        	  text: "確定送出?",
                        	  icon: "warning", 
                        	  buttons: ["取消","確定"]
                          }).then((value) => {
                        	  var datastring = $("#customerForm").serialize();
                        	  
                        	  $.ajax({
                        		    type : "POST", 
                        		    url : "../messageSystem/insertoffline",
                        		    data : datastring ,
                        		}).done(function(data){
                        			 swal({
                                   	  text: "訊息已傳送",
                                   	  icon: "success", 
                                     })
                        			document.getElementById("customerForm").reset();
                        		}).fail(function(){
                        		  swal({
                                	  text: "訊息傳送失敗",
                                	  icon: "error", 
                                  })
                        	  })
                          });
                          // End of swal 
                       }
                   }, false);
               });
               // End of validation
           }, false);
           
           if(typeof customerEmail !==undefined ){
    		   $("input[name='email']").val(customerEmail); 
    	   }
           $("#ftco-navbar #ftco-nav:first-of-type li:nth-of-type(3)").addClass("active");
           $("#demo").click(function(){
       		   /* $("input[name='email']").val("user@pizza.com");  */
       		   $("input[name='name']").val("鐘先生"); 
       		   $("textarea[name='content']").val("請問明太子鮭魚Pizza還會再推出嗎?"); 
        	   
           })
       })();

     
	</script>

</body>
</html>