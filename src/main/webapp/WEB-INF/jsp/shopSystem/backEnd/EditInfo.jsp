<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>


<body>

	<!-- 
	private String storeName;
	private Integer phone;
	private String address;
	private String email;
	private String businessdayStart;
	private String businessdayEnd;
	private String businessdayStartTime;
	private String businessdayEndTime;
	private String brandStory;
	private String brandstoryEdited; -->
	<button id="demo" class="btn btn-success" >一鍵輸入</button>
	
	
	<!-- SELECT2 EXAMPLE -->
        <div class="card card-default mt-3 mr-4">
          <div class="card-header">
            <h3 class="card-title">店面資訊修改</h3>

            <div class="card-tools">
              <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
              <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-remove"></i></button>
            </div>
          </div>
          <form:form method="POST" modelAttribute="Bean"
					action="${pageContext.request.contextPath}/insertWebInfo" id="webinfo">
          <!-- /.card-header -->
          <div class="card-body">
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
						<label class='control-label' for='storeName'>店名</label>
						<div class='col-lg-10'>
							<form:input id="storeName" path="storeName" type='text'
								class='form:input-large form-control'  style="width: 100%;"/>
						</div>
				</div>
                <!-- /.form-group -->
                <div class="form-group">
						<label class='control-label' for='phone'>店家電話</label>
						<div class='col-lg-10'>
							<form:input id="phone" path="phone" type='text'
								class='form:input-large form-control select2bs4'  style="width: 100%;" />
						</div>
					</div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label class='control-label' for='address'>店家地址</label>
						<div class='col-lg-10'>
							<form:input id="address" path="address" type='text'
								class='form:input-large form-control select2bs4'  style="width: 100%;" />
						</div>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label class='control-label' for='email'>聯絡信箱</label>
						<div class='col-lg-10'>
							<form:input id="email" path="email" type='text'
								class='form:input-large form-control select2bs4'  style="width: 100%;" />
						</div>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label class='control-label' for='businessdayStart'>開始營業日期</label>
						<div class='col-lg-10'>
							<form:input id="businessdayStart" path="businessdayStart" type='text'
								class='form:input-large form-control select2bs4'  style="width: 70%;" />
						</div>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label class='control-label' for='businessdayEnd'>結束營業日期</label>
						<div class='col-lg-10'>
							<form:input id="businessdayEnd" path="businessdayEnd" type='text'
								class='form:input-large form-control select2bs4'  style="width: 70%;" />
						</div>
                </div>
                <!-- /.form-group -->
                 </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label class='control-label' for='businessdayStartTime'>開始營業時間</label>
						<div class='col-lg-10'>
							<form:input id="businessdayStartTime" path="businessdayStartTime" type='text'
								class='form:input-large form-control select2bs4'  style="width: 70%;" />
						</div>
                </div>
                <!-- /.form-group -->
                <div class="form-group">
                  <label class='control-label' for='businessdayEndTime'>結束營業時間</label>
						<div class='col-lg-10'>
							<form:input id="businessdayEndTime" path="businessdayEndTime" type='text'
								class='form:input-large form-control select2bs4'  style="width: 70%;" />
						</div>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
              <div class="col-md-6">
               <div class="form-group">
                 <label class='control-label' for='brandStory'>品牌故事(標題)</label>
						<div class='col-lg-10'>
							<form:input id="brandStory" path="brandStory" type='text'
								class='form:input-large form-control select2bs4'  style="width: 100%;" />
						</div>
                </div>
                <!-- /.form-group -->
               </div>
              <!-- /.col -->
              <div class="col-md-6">
                <div class="form-group">
                  <label class='control-label' for='brandstoryEdited'>品牌故事(內文)</label>
					<div class='col-lg-10'>
						<form:textarea id="brandstoryEdited" path="brandstoryEdited" type='text'
							class='form:input-large form-control select2bs4'  style="width: 100%;" rows="5"/>
					</div>
                </div>
                <!-- /.form-group -->
              </div>
              <!-- /.col -->
            </div>
            <!-- /.row -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer">
          		<div class="form-group">
					<div class='control-label'>
						<input id="add" type='submit' class='btn btn-primary' value="送出修改" />
					</div>
				</div>
          </div>
         </form:form>
         <!-- /form -->
        </div>
        <!-- /.card -->
	
	<script>
		$(function(){
			$("#webinfo").submit(function(e){
				e.preventDefault();
				console.log($("#webinfo")[0]);
				var formData = new FormData($("#webinfo")[0]);
				
				$.ajax({
					url:$("#webinfo").attr('action'),
					method:$("#webinfo").attr('method'),
					data:formData,
					contentType: false,
                    processData: false,
					error : function(error) {
						swal({
							text: "資料修改失敗！",
							icon: "error",
						});
					},
					success : function(data) {
						$('.content-wrapper').empty();
						swal({
							text:"資料修改成功！",
							icon: "success",
						
						});
					}
				});
			});
			
			
			
		});
		
	
		$("#demo")
				.click(
						function() {
							$("#storeName").val("Pizza Bite");
							$("#phone").val(0222556699);
							$("#address").val("106台北市大安區信義路三段184號");
							$("#email").val("service@pizza.com");
							$("#businessdayStart").val("Mon");
							$("#businessdayEnd").val("Sat");
							$("#businessdayStartTime").val("12:00");
							$("#businessdayEndTime").val("23:00");
							$("#brandStory")
									.val(
											"Welcome to <span class='flaticon-pizza'>Pizza</span> Bite");
							$("#brandstoryEdited")
									.val(
											"你好，我們是義式披薩餐廳 我們不賣創意料理，只賣義大利料理 歡迎對義大利料理有熱情的伙伴加入 我們除了道地的披薩以外，也提供多道義式經典小吃與麵食 有興趣可到我們粉絲頁觀看我們菜單與餐廳簡介 經營理念 我們的旅程始於一個簡單的想法：做出道地的義大利披薩");

						})
	</script>

</body>
</html>