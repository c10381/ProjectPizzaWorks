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
	<div id="tabs" style="width: 70%;margin:auto;">
		<ul>
			<li><a href="#registerOneMember">單一員工註冊</a></li>
			<li><a href="#registerManyMember">上傳CSV</a></li>
		</ul>



		<div id="registerOneMember" style="width: 50%;margin:auto;">
				<div class='card-header card-primary'>
					<h1 style="text-align: center">會員資料填寫</h1>
				</div>
			<hr width='3'>
			<section class='container'>
				<form:form modelAttribute="oneRegister"
					class='form-horizontal'>
					<fieldset>
						<div class="col-xs-4">
						<label>帳號(Email) ：</label>
						<form:input id='email' path='email' type='text'
							required='required' placeholder="Enter email" class="form-control" /><br>
						</div>
						<div>
						<label>密碼 ：</label>
						<form:input id='password' path='password' type='password'
							required='required' value="P@ssw0rd" readonly="true"  class="form-control" />
						</div>
						
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
						<div>
						<label>性別 ：</label>
						<form:select id="gender" path="gender">
							<form:option value="0" label="請選擇"></form:option>
							<form:option value="1" label="男"></form:option>
							<form:option value="2" label="女"></form:option>
						</form:select>
						
						<br> <label>姓 ：</label>
						<form:input id='lastName' path='lastName' type='text'
							required='required' placeholder="請輸入姓"  class="form-control" />
						<label>名字 ：</label>
						<form:input id='firstName' path='firstName' type='text'
							required='required' placeholder="請輸入名字"  class="form-control" />
						</div>
						
						<div>
						<br> <label>生日 ：</label>
						<form:input id='birthDate' class="form-control" path='birthDate' type="date" placeholder="Enter email"/>
						</div>
						<div>
						<label>地址 ：</label>
						<form:input id="address" path="address" type="text"
							required='required' placeholder="請輸入地址" class="form-control" />
						</div>
						<div >
						<label>連絡電話 ：</label>
						<form:input id="cellphone" path="cellphone" type="text"
							required='required' placeholder="請輸入聯絡方式" class="form-control"/>
						</div>
						<form:hidden path="activeStatus" value="1" />

						<div>
						<br> <input id='btnAdd' type="submit" value="送出" /> <input
							id='btnReset' type="reset" value="重填" />
						</div>
					</fieldset>
				</form:form>
			</section>

		</div>
		<!-- /registerOneMember -->
		<div id="registerManyMember">
			<div style="width:100%;margin:5px;">
				<input type="file" id="files" name="files[]" multiple />
			</div>
			<br>
			<div style="margin-bottom:30px">
				
				<table id="CsvTable" class="display" style="width:100%;text-align:center;"></table>
				<div id="mutliSubmitButton" class="float-right" style="margin:5px;height:20px"></div>
			</div>
		</div>
		<!-- /registerManyMember -->
	</div>
	<!-- /tag -->
	<script>
	var datatable;
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
		            		swal("新增帳號失敗", "請通知系統管理員，errorCode=0", "error");
				        }else if(callback==1){
				        	swal("新增帳號失敗", "帳號已存在", "error");
				        }else if(callback==2){
					        //確認成功要把填入資料清掉，但還沒完成
					        $("#email").val("");
					        $("#privilegeId").val("");
					        $("#lastName").val("");
					        $("#firstName").val("");
					        $("#gender").val("");
					        $("#birthDate").val("");
					        $("#address").val("");
					        $("#cellphone").val("");
					        swal("新增成功", data.email+"已新增", "success");
				        	//alert(data.email+"已建立成功");
						}else if(callback==3){
							swal("新增失敗", "權限不足無法進行此操作", "error");
						}
		            },
		            error : function(e){
		            	swal("新增失敗", "請聯繫系統管理員，錯誤代碼："+e, "error");
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
          datatable=$('#CsvTable').DataTable( {
        	    data: csvdata,
        	    searching: false,
                bSort: false,  //禁止排序
                paging: false,   //禁止分页
                info: false,   //去掉底部文字
        	    columns: [
        	        { data: 'lastName',
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input type='text' id='lastName' class='form-control align-items-center' style='width:50px;text-align:center;' value="+data+"></input>";
        	        		return str;
        	        	},
        	        	width: "2%",
            	    },
        	        { data: 'firstName',
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input type='text' id='firstName' class='form-control align-items-center' style='width:85px;text-align:center;' value="+data+"></input>";
        	        		return str;
        	        	},
        	        	width: "4%",
        	        },
        	        { data: 'email',
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input type='text' id='email' class='form-control' style='text-align:center;' value="+data+"></input>";
        	        		return str;
        	        	},
        	        	width: "10%",
        	        },
        	        { data: 'address',
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input type='text' id='address' class='form-control' style='text-align:center;' value="+data+"></input>";
        	        		return str;
        	        	},
        	        	width: "10%",
        	        },
        	        { data : "gender",
						render : function(data, type, row, meta){
							let str="";
							str="<select id='gender' class='custom-select' style='text-align:center;'>";
							if(data==1){
								str+="<option value='1' selected>男</option>";
								str+="<option value='2'>女</option>";
							}else if(data==2){
								str+="<option value='1'>男</option>";
								str+="<option value='2' selected>女</option>";
							}

							str+="</select>";
							return str;
						},
						width: "5%",
					},
        	        { data: 'cellphone' ,
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input type='text' id='cellphone' class='form-control' style='text-align:center;width:' value="+data+"></input>";
        	        		return str;
        	        	},
        	        	width: "8%",
        	        },
        	        { data: 'privilegeId',
						render : function(data, type, row, meta){
							let str="";
							str="<select id='privilegeId' class='custom-select' style='text-align:center;' >";
							if(data==2){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3' selected>銷貨人員</option>";
								str+="<option value='4'>進貨人員</option>";
								str+="<option value='5'>存貨人員</option>";
								str+="<option value='6'>客服人員</option>";
								str+="<option value='7'>管理者</option>";
							}else if(data==3){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3'>銷貨人員</option>";
								str+="<option value='4' selected>進貨人員</option>";
								str+="<option value='5'>存貨人員</option>";
								str+="<option value='6'>客服人員</option>";
								str+="<option value='7'>管理者</option>";
							}else if(data==4){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3'>銷貨人員</option>";
								str+="<option value='4'>進貨人員</option>";
								str+="<option value='5' selected>存貨人員</option>";
								str+="<option value='6'>客服人員</option>";
								str+="<option value='7'>管理者</option>";
							}else if(data==5){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3'>銷貨人員</option>";
								str+="<option value='4'>進貨人員</option>";
								str+="<option value='5'>存貨人員</option>";
								str+="<option value='6' selected>客服人員</option>";
								str+="<option value='7'>管理者</option>";
							}else if(data==6){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3'>銷貨人員</option>";
								str+="<option value='4'>進貨人員</option>";
								str+="<option value='5'>存貨人員</option>";
								str+="<option value='6'>客服人員</option>";
								str+="<option value='7' selected>管理者</option>";
							}else if(data==7){
								str+="<option value='2'>網站管理員</option>";
								str+="<option value='3'>銷貨人員</option>";
								str+="<option value='4'>進貨人員</option>";
								str+="<option value='5'>存貨人員</option>";
								str+="<option value='6'>客服人員</option>";
								str+="<option value='7' selected>管理者</option>";
							}
							str+="</select>";
							return str;
						},
						width: "10%",
					},
        	        { data: 'birthDate' ,
        	        	render : function(data, type, row, meta){
        	        		let str="";
        	        		str="<input id='birthDate' value="+data+" type='text' class='form-control' data-inputmask-alias='datetime' data-inputmask-inputformat='yyyy/mm/dd' im-insert='false'style='text-align:center;' >";
        	        		return str;
        	        	},
        	        	width: "10%",
        	        },
        	    ],
				//中文化相關
        	    oLanguage:{"sProcessing":"處理中...",
                "sLengthMenu":"顯示 _MENU_ 項結果",
                "sZeroRecords":"查無結果",
                "sInfo":"顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                "sInfoEmpty":"顯示第 0 至 0 項結果，共 0 項",
                "sInfoFiltered":"(從 _MAX_ 項結果過濾)",
                "sSearch":"搜尋:",
                "oPaginate":{"sFirst":"首頁",
                                     "sPrevious":"上頁",
                                     "sNext":"下頁",
                                     "sLast":"尾頁"}
                }
        } );
          $("#mutliSubmitButton").append("<button class='btn btn-outline-primary btn-lg'onclick='submitCsv()'>送出註冊清單</button>");
        }
      }
      //table.columns.adjust().draw();
	//submit csv
 	function submitCsv(){
		var table=document.getElementById("CsvTable");
		var Array=[];
		var Bean;
		for(let i=1;i<table.rows.length;i++){
			Bean={
					"lastName":table.rows[i].cells[0].children[0].value,
					"firstName":table.rows[i].cells[1].children[0].value,
					"email":table.rows[i].cells[2].children[0].value,
					"address":table.rows[i].cells[3].children[0].value,
					"gender":table.rows[i].cells[4].children[0].value,
					"cellphone":table.rows[i].cells[5].children[0].value,
					"privilegeId":table.rows[i].cells[6].children[0].value,
					"birthDate":table.rows[i].cells[7].children[0].value,
					}
			Array.push(Bean);
		}
 		console.log(Array);

		
		$.ajax({
            contentType : 'application/json; charset=utf-8',
            type: "POST",
            url:'${pageContext.request.contextPath}/memberSystem/member_mutiple_add',
            dataType : 'json',
            data : JSON.stringify(Array),
            success : function(callback){
                //callback會為一個map物件
               //裡面有errorMsg,success,failure,failureEmail
                swal({
                	title:"新增成功",
                	content:function(){
                    	let str="";
                    	str+="新增成功數量："+callback.success;
                    	if(callback.failure!=0){
                        	str+="\n新增失敗數量："+callback.failure;
                    		str+="\n新增失敗名單(email)：\n"+callback.failureEmail;
                        	}
                    	return str;
                    },
                    icon:"success"
                    });
            },
            error : function(e){
                console.log(e);
            }
        });

		}
	</script>

</body>
</html>