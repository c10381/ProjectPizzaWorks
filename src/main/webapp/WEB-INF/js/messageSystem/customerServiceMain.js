//=====畫面相關=====
//隱藏側邊選單scroll
$(".inbox_CustomerService").on("mouseenter mouseleave", function (event) { //挷定滑鼠進入及離開事件
  if (event.type == "mouseenter") {
    $(this).css({"overflow-y": "scroll"}); //滑鼠進入
  } else {
    $(this).scrollTop(0).css({"overflow-y": "hidden"}); //滑鼠離開
  }
});
//選取聊天視窗
function changeCustomerPage(obj) {
	var id=obj.getAttribute("id");
	// 變更按鈕
	var userArrayList = document.getElementsByClassName("CustomerService_list");
	console.log("userArrayList:" + userArrayList);
	for (let i = 0; i < userArrayList.length; i++) {
		if(userArrayList[i].getAttribute("class")=='CustomerService_list new_MessageInCustomer'){
			continue;
		}
		userArrayList[i].setAttribute("class", "CustomerService_list");
	}
	obj.setAttribute("class", "CustomerService_list active_CustomerService");

	// 變換聊天室內容
	var userArrayBlock = document.getElementsByClassName("msg_history");
	for (let i = 0; i < userArrayBlock.length; i++) {
		userArrayBlock[i].style.display = "none";
		if (userArrayBlock[i].id == "cs_"+id) {
			userArrayBlock[i].style.display = "block";
		}
	}
}

// 出現聊天視窗
// 顧客送訊息來才會出現
function openCSbox(Email, Name , content) {
	var customerMessageSideBox=document.getElementById(Email+"Box");
	if (customerMessageSideBox == undefined) {
		//側邊欄(id=Email+"Box")
		$(".inbox_CustomerService").append(
				"<div class='CustomerService_list new_MessageInCustomer'  id=\'"+Email+"Box\'  onclick='changeCustomerPage(this)'>"+
					"<div class='CustomerService_people'>"+
						"<div class='CustomerService_ib'>"+
							"<h5>"+Name+"</h5>"+
							"<p id=\'"+Email+"Content\'>"+content+"</p>"+
						"</div>"+
					"</div>"+
				"</div>");
		//會話框(id="cs_"+Email+"Box")，插在(.type_msg)前面
		$("<div class='msg_history' id='cs_"+Email+"Box' style='display:none;position:relative'> "+
				"<button class='btn btn-primary' style='position:absolute; right:0;top:0;' onclick='buttonOfCustomerReport(\""+Email+"\")'>"+
					"<i class='far fa-envelope' ></i> 結案</button>"+
						"</div>").insertBefore(".type_msg");
		
	} else {
		//換掉content
		document.getElementById(Email+"Content").innerHTML=content;
		//標示未讀
		if(customerMessageSideBox.getAttribute("class")!="CustomerService_list active_CustomerService"){
			customerMessageSideBox.setAttribute("class", "CustomerService_list new_MessageInCustomer");
		}
		
	}
}
// 收到顧客訊息
function getCustomerMessage(messageOutput) {
	//判斷有沒有開過視窗
	openCSbox(messageOutput.message.from, messageOutput.message.fromName,messageOutput.message.text);

	var pCS = document.createElement('p');
	pCS.appendChild(document.createTextNode(messageOutput.message.text));
	var divCSI = document.createElement('div');
	divCSI.setAttribute("class", "received_withd_msg");
	divCSI.appendChild(pCS);
	
	var divCS = document.createElement('div');
	divCS.setAttribute("class", "incoming_msg");
	divCS.appendChild(divCSI);
	
	var responseCS = document.getElementById("cs_" + messageOutput.message.from
			+ "Box");
	//console.log(responseCS);
	responseCS.appendChild(divCS);

	responseCS.scrollTop = responseCS.scrollHeight;
}
// 發出訊息(需要包進this)
function sendToCustomerMessage(obj) {
	var textToCustomer = $(obj).parent().children(".write_msg")
			.val();
	console.log(textToCustomer);

	//取得要寄出的人，有做字串處理
	var To = document.getElementsByClassName("active_CustomerService")[0].id.slice(0, -3);
	// console.log(To);
	if (textToCustomer != '') {
		stompClient.send("/app/customerchat/" + To, {}, JSON
				.stringify({
					'from' : userName,
					'text' : textToCustomer
				}));
		//扔上去顯示
		var pCS = document.createElement('p');
		pCS.appendChild(document.createTextNode(textToCustomer));
		var divCSI = document.createElement('div');
		divCSI.setAttribute("class", "sent_msg");
		divCSI.appendChild(pCS);
		
		var divCS = document.createElement('div');
		divCS.setAttribute("class", "outgoing_msg");
		divCS.appendChild(divCSI);
		
		var responseCS = document.getElementById("cs_" + To+ "Box");
//		console.log(responseCS);
		responseCS.appendChild(divCS);

		responseCS.scrollTop = responseCS.scrollHeight;
	}
	$(obj).parent().children(".write_msg").val("");
}

// 按下enter會送出
function CsputEnter(obj) {
	var textToCustomer = $(obj).val();

	if (event.keyCode == 13 && textToCustomer != '\n') {
		
		sendToCustomerMessage(obj);
	}
	// 如果只有按下enter會清掉
	if (textToCustomer == '\n') {
		$(obj).val("");
	}
}

// =====WebSocket=====
//與聊天系統共用connect()與disconnect()
