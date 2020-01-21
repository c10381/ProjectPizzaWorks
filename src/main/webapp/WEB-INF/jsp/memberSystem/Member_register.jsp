<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta charset="UTF-8">
<style type="text/css">
</style>
</head>
<body>
	<div id="tabs" style="width: 50%;margin:auto;">
		<ul>
			<li><a href="#registerOneMember">單一員工註冊</a></li>
			<li><a href="#registerManyMember">上傳CSV</a></li>
		</ul>



		<div id="registerOneMember">
			<section>
				<div class='container'>
					<h1 style="text-align: center">會員資料填寫</h1>
				</div>
			</section>
			<hr width='3'>
			<section class='container'style="width: 60%;margin:auto;">
				<form:form modelAttribute="oneRegister"
					class='form-horizontal'>
					<fieldset>
						<label>帳號(Email) ：</label>
						<form:input id='email' path='email' type='text'
							required='required' /><br>
						<label>密碼 ：</label>
						<form:input id='password' path='password' type='password'
							required='required' value="P@ssw0rd" readonly="true" />
						<br> <label>身分 ：</label>
						<form:select id="privilegeId" path="privilegeId">
							<form:option value="0" label="請選擇"></form:option>
							<form:option value="2" label="網站後台管理員"></form:option>
							<form:option value="3" label="銷貨負責人"></form:option>
							<form:option value="4" label="進貨負責人"></form:option>
							<form:option value="5" label="存貨負責人"></form:option>
							<form:option value="6" label="客服人員"></form:option>
							<form:option value="7" label="管理者"></form:option>
						</form:select>
						<br> <label>姓 ：</label>
						<form:input id='lastName' path='lastName' type='text'
							required='required' />

						<label>名 ：</label>
						<form:input id='firstName' path='firstName' type='text'
							required='required' />

						<br> <label>性別 ：</label>
						<form:select id="gender" path="gender">
							<form:option value="0" label="請選擇"></form:option>
							<form:option value="1" label="男"></form:option>
							<form:option value="2" label="女"></form:option>
						</form:select>

						<br> <label>生日 ：</label>
						<form:input id='birthDate' path='birthDate' type="date" />

						<br> <label>地址 ：</label>
						<form:input id="address" path="address" type="text"
							required='required' />

						<br> <label>連絡電話 ：</label>
						<form:input id="cellphone" path="cellphone" type="text"
							required='required' />

						<br>
						<form:hidden path="activeStatus" value="1" />


						<br> <input id='btnAdd' type="submit" value="送出" /> <input
							id='btnReset' type="reset" value="重填" />

					</fieldset>
				</form:form>
			</section>

		</div>
		<!-- /registerOneMember -->
		<div id="registerManyMember">
			<div style="width:100%;margin:5px;">
				<input type="file" id="files" name="files[]" multiple />
				<button style="margin-right:5px" onclick="submitCsv()">送出註冊清單</button>
			</div>
			<br>
			<div>
				
				<table id="CsvTable" class="display">
    				
				</table>
			</div>
		</div>
		<!-- /registerManyMember -->
	</div>
	<!-- /tag -->
	<script>
		//jQuery-UI Tabs
		$(function() {
			$("#tabs").tabs();
		});
		//單一員工註冊(使用Ajax)
		$(document).ready(function() {
			$('.form-horizontal').submit(function(e) {
				var frm = $('.form-horizontal');
				//阻止form執行submit
				e.preventDefault();

		    	var data = {}

		    	$.each(this, function(i, v){
		            var input = $(v);
		        	data[input.attr("name")] = input.val();
		        	delete data["undefined"];
		    	});
		        $.ajax({
		            contentType : 'application/json; charset=utf-8',
		            type: "POST",
		            url:'${pageContext.request.contextPath}/memberSystem/member_add',
		            dataType : 'json',
		            data : JSON.stringify(data),
		            success : function(callback){
			            //0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功、3:權限不足無法進行此操作
		            	if(callback==0){
		            		alert("新增帳號失敗,請通知系統管理員，errorCode=0");
				        }else if(callback==1){
		            		alert("帳號已存在");
				        }else if(callback==2){
					        //確認成功要把填入資料清掉，但還沒完成
//					        $("#email").attr("value","");
//					        $("#privilegeId").attr("value",0);
//					        $("#lastName").attr("value","");
//					        $("#firstName").attr("value","");
//					        $("#gender").attr("value",0);
//					        $("#birthDate").attr("value","");
//					        $("#address").attr("value","");
//					        $("#cellphone").attr("value","");
				        	alert(data.email+"已建立成功");
						}else if(callback==3){
							alert("權限不足無法進行此操作");
						}
		            },
		            error : function(){
		                console.log(data);
		            }
		        });
			});
			//Client上傳CSV功能開始，呼叫此$(document).ready外面的function
			if(isFileAPIAvailable()) {
		          $('#files').bind('change', handleDialog);
		    }
		//下面是$(document).ready的尾巴
		});
		
		//csv功能，確認瀏覽器取得API可運作
		function isFileAPIAvailable() {
      	  if (window.File && window.FileReader && window.FileList && window.Blob) {
      	    // Great success! All the File APIs are supported.
      	    return true;
      	  } else {
      	    document.writeln('The HTML5 APIs used in this form are only available in the following browsers:<br />');
      	    document.writeln(' - Google Chrome: 13.0 or later<br />');
      	    document.writeln(' - Mozilla Firefox: 6.0 or later<br />');
      	    document.writeln(' - Internet Explorer: Not supported (partial support expected in 10.0)<br />');
      	    document.writeln(' - Safari: Not supported<br />');
      	    document.writeln(' - Opera: Not supported');
      	    return false;
      	  }
      };
      var csvdata=[];
		//csv功能，將csv轉成Objects Array
      function handleDialog(event) {
        var files = event.target.files;
        var file = files[0];

        var reader = new FileReader();
        reader.readAsText(file);
        reader.onload = function(event){
          var csv = event.target.result;
          //這個data就是我們要的東西，塞進去DataTable咖實在
          csvdata = $.csv.toObjects(csv);
          //console.log(data);
          $('#CsvTable').append("<thead><th>姓</th><th>名</th><th>帳號(Email)</th><th>地址</th><th>性別</th><th>連絡電話</th><th>身分</th><th>生日</th></thead><tbody></tbody>");
          //呼叫DataTable
          $('#CsvTable').DataTable( {
        	    data: csvdata,
        	    columns: [
        	        { data: 'lastName' },
        	        { data: 'firstName' },
        	        { data: 'email' },
        	        { data: 'address' },
        	        { data: 'gender' },
        	        { data: 'cellphone' },
        	        { data: 'privilegeId' },
        	        { data: 'birthDate' },
        	    ],
				//中文化相關
        	    oLanguage:{"sProcessing":"處理中...",
                "sLengthMenu":"顯示 _MENU_ 項結果",
                "sZeroRecords":"沒有匹配結果",
                "sInfo":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                "sInfoEmpty":"顯示第 0 至 0 項結果，共 0 項",
                "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
                "sSearch":"搜索:",
                "oPaginate":{"sFirst":"首頁",
                                     "sPrevious":"上頁",
                                     "sNext":"下頁",
                                     "sLast":"尾頁"}
                }
        } );
        }
      }
	//submit csv
 	function submitCsv(){

		$.ajax({
            contentType : 'application/json; charset=utf-8',
            type: "POST",
            url:'${pageContext.request.contextPath}/memberSystem/member_mutiple_add',
            dataType : 'json',
            data : JSON.stringify(csvdata),
            success : function(callback){
                //callback會為一個map物件
               //裡面有errorMsg,success,failure,failureEmail
                alert("新增成功數量："+callback.success+"\n新增失敗數量："+callback.failure+"\n新增失敗名單(email)：\n"+callback.failureEmail)
            },
            error : function(){
                console.log(callback);
            }
        });

		
		}
	</script>

</body>
</html>