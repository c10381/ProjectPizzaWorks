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
	<button id="demo">Demo</button>
	<form:form method="Get" modelAttribute="Bean"
		action="${pageContext.request.contextPath}/insertWebInfo">


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='storeName'>店名</label>
						<div class='col-lg-10'>
							<form:input id="storeName" path="storeName" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>

		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='phone'>電話</label>
						<div class='col-lg-10'>
							<form:input id="phone" path="phone" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='address'>地址</label>
						<div class='col-lg-10'>
							<form:input id="address" path="address" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>

		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='email'>信箱</label>
						<div class='col-lg-10'>
							<form:input id="email" path="email" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>

		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='businessdayStart'>開始營業日期</label>
						<div class='col-lg-10'>
							<form:input id="businessdayStart" path="businessdayStart"
								type='text' class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>

		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='businessdayEnd'>結束營業日期</label>
						<div class='col-lg-10'>
							<form:input id="businessdayEnd" path="businessdayEnd" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='businessdayStartTime'>開始營業時間</label>
						<div class='col-lg-10'>
							<form:input id="businessdayStartTime" path="businessdayStartTime"
								type='text' class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='businessdayEndTime'>結束營業時間</label>
						<div class='col-lg-10'>
							<form:input id="businessdayEndTime" path="businessdayEndTime"
								type='text' class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='brandStory'>品牌故事</label>
						<div class='col-lg-10'>
							<form:input id="brandStory" path="brandStory" type='text'
								class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="lightblue" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<label class='control-label col-lg-2' for='brandstoryEdited'>品牌故事內文</label>
						<div class='col-lg-10'>
							<form:input id="brandstoryEdited" path="brandstoryEdited"
								type='text' class='form:input-large' />
						</div>
					</div></td>
			</tr>
		</table>


		<table border="1" style="margin: 0px auto;">
			<tr height="52" bgcolor="#CA8EFF" align="center">
				<td width="350"><p align="left" />
					<div class="form-group">
						<div class='control-label col-lg-2 col-lg-10'>
							<input id="add" type='submit' class='btn btn-primary' value="送出" />
						</div>
					</div></td>
			</tr>
		</table>

	</form:form>
	<script>
	$("#demo").click(function(){
		$("#storeName").val("Pizza Bite"); 
		$("#phone").val(0222556699);
		$("#address").val("106台北市大安區信義路三段184號");
		$("#email").val("service@pizza.com");
		$("#businessdayStart").val("Mon");
		$("#businessdayEnd").val("Sat");
		$("#businessdayStartTime").val("12:00");
		$("#businessdayEndTime").val("23:00");
		$("#brandStory").val("Welcome to <span class="flaticon-pizza">Pizza</span> Bite");
		$("#brandstoryEdited").val("你好，我們是義式披薩餐廳 我們不賣創意料理，只賣義大利料理 歡迎對義大利料理有熱情的伙伴加入 我們除了道地的披薩以外，也提供多道義式經典小吃與麵食 有興趣可到我們粉絲頁觀看我們菜單與餐廳簡介 經營理念 我們的旅程始於一個簡單的想法：做出道地的義大利披薩");
	
	})
	</script>
	
</body>
</html>