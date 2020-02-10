//1. 當點擊對話框按鈕會開啟連線，此時會監測客服人員是否在線上
//2. 當客服不在線上時，會自動出現資訊欄對話框(?)(目前以導向聯絡我們的page)，請他留下email與內容Content，
//   此時對話欄將會無法送出對話
//3. 當客服在線上時，即可進行對話，當產生對話時會將資訊與對話分別保留在localStorage內的"CSR_history"＆"CSR_Dialogue"內

//let CSR_Record = {};
//這兩個是全域變數(function內共用)

var stompClient = null;
//判斷User用
var userName = fromLastName+fromFirstName;

$(function () {
	
	console.log(connectCheck())
		
	
	
	
	// 點擊傳送按鈕
    $("#chat-submit").click(function (e) {
        e.preventDefault();
        // 取得送出內容
        var msg = $("#chat-input").val();
        // 當沒內容不送出
        if (msg.trim() == '') {
            return false;
        }
        // 傳送對話到客服端
        sendMessage(msg);
    })

    // 開起聊天視窗，建立連線，載入過去對話紀錄
    $("#chat-circle").click(function () {
//    	update_message();
    	connect() ;
        $("#chat-circle").toggle('scale');
        $(".chat-box").toggle('scale');
    })
    // 關閉聊天視窗
    $(".chat-box-toggle").click(function () {
        $("#chat-circle").toggle('scale');
        $(".chat-box").toggle('scale');
    })

})


//連線(開啟websocket要呼叫他)
function connect() {
    var socket = new SockJS(contextPath + '/chatroom');
    stompClient = Stomp.over(socket);
    
    //在這裡判斷user
    if (customerEmail != "") {
        console.log("顧客身分:" + customerEmail);
        userName = customerEmail;
    } else {
        //請他輸入email或強迫他登入
    	//userName = ;
   	
    	
    }
    
    // 啟用連線時的處理
    stompClient.connect({ user: userName }, function(frame) {
	        console.log('Connected: ' + frame);
	
	    // 送一次request，取得全部在線名單
	    $.post(contextPath + "/messageSystem/getOnline");
	
	    // 廣播
	    stompClient.subscribe('/topic/messages', function(messageOutput) {
	    	//會送線上名單，送到showOnline作處理，用來判斷對方是否有在線上
	    	showOnline(JSON.parse(messageOutput.body));
	    });
	
	    // 對方端傳來訊息 顯示的
	    stompClient.subscribe('/user/subscribe', function(messageOutput) {
	        //判斷是不是customerService使用的(前台一般都是true)
//	    	console.log(messageOutput.body);
	        var messageGet = JSON.parse(messageOutput.body);
	        if (messageGet.customerService == true) {
	        	// 取得訊息本體產生出來
	        	var msg = messageGet.message.text;
	    	    generate_message(msg, 'other');
	    	    storage_message(msg, 'other');
	        }
	    });
    });
}

//關閉連線
function disconnect() {
    //斷線前送一次request，更新全部人的線上列表(可能前台不需要)
    $.post(contextPath + "/messageSystem/getOnline");
    if (stompClient != null) {
        stompClient.disconnect();
    }
    userName = null;
    console.log("Disconnected");
}


//一登入就送會員List
//會在這裡判斷客服是不是上線
function showOnline(messageOutput){
	let str_offline = "目前客服人員不在線上，您將無法傳送訊息。如有任何意見，煩請至以下連結" ;
	str_offline += "<a href='shop/contactUs'>Pizza Bite| Contact Us</a>" ;
	str_offline	+= "將您寶貴的意見提供給我們，我們將會盡快回覆您，謝謝。";
	console.log(messageOutput);
	coworkerOnlineList=messageOutput.coworkerOnlineList;
	
	for(let i=0;i<coworkerOnlineList.length;i++){
		if(coworkerOnlineList[i]=="service@pizza.com"){
			//客服上線能幹嘛
			break;
		}else{
			//客服沒上線時，無法對話			
			generate_message(str_offline, "other");
			$("#chat-input").prop("disabled",true);


			//如果客服在對話途中下線怎麼辦
			//要直接把連結斷開嗎？

		}
	}
	
}
//顧客寄送訊息(To是要送給誰，前台我先在裡面寫死為"service@pizza.com"，obj是送this過來)
//只會送出{'form':來自哪裡,'text':要送的內容}
function sendMessage(obj) {
    console.log("Send to:" + "service@pizza.com");
    //抓輸入框的內容
    var text = obj;
    //已經寫好的controller路徑
    if (text != '') {
        //要判斷是訪客還是已註冊會員，送出不同訊息
     //stompClient.send("/app/customerchat/" + "service@pizza.com", {}, JSON.stringify({ 'from': userName, 'text': text }));
     stompClient.send("/app/customerchat/" + "service@pizza.com", {}, JSON.stringify({ 'from': userName, 'text': text ,'fromFirstName': fromFirstName,'fromLastName': fromLastName,}));
    }
    
    // 將對話帶入，產生對話框
    generate_message(obj, 'self');
    storage_message(obj, 'self');
}



// 進入頁面用於判斷儲存的對話身份與時間內，當符合時間與身份的判斷則回傳可開啟連線。
function connectCheck(){
	// 在一天(24小時中都會保持連線
	let connectTime = 1;
	let record = {};
	let obj = JSON.parse(localStorage.getItem("csr_record"));
	
	obj.some(function(item){
		if(item.userName == customerEmail){
			record = item;
		}else{
			return false; 
		}
	})
	let timeCheck = (new Date()-Date.parse(record.modifiedTime))/3600000;
	console.log(timeCheck);
	// 當對話時間過長就不會再打開連線
	if(timeCheck > record.modifiedTime){
		return  false; 
	}else{
		return true;
	}
	return flag ; 
}



// 用於將儲存在本機端的對話，投放到對話上
//function update_message(){
//	if(obj==undefined||obj.length ==0){
//		
//	}else{
//		if(obj.userName!= userName){
//			return ;
//		}
//		obj.forEach(function(item, index, array){
//		let msg = item.text;
//		let type = item.type;
//		generate_message(msg, type);
//		});
//	}
//}

//儲存對話至對話紀錄中，並且儲存至本機端
function storage_message(msg, type){
	let csr_record = [];
	let obj ={};
	obj.userName = userName;
	obj.modifiedTime = new Date();
	let csr_history = csr_record.csr_history||[];
	csr_history.push({
		"type" : type, 
		"text": msg
	});
	obj.csr_history = csr_history;
	csr_record.push(obj);
	localStorage.setItem("csr_record",JSON.stringify(csr_record));
}

// 用於產生對話框
function generate_message(msg, type) {
//    INDEX++;
	// 對話框
    var str = "";
    str += "<div id='cm-msg-"  + "' class=\"chat-msg " + type + "\">";
    str += "          <span class=\"msg-avatar\">";
    str += "          <\/span>";
    str += "          <div class=\"cm-msg-text\">";
    str += msg;
    str += "          <\/div>";
    str += "        <\/div>";
    $(".chat-logs").append(str);
    $("#cm-msg-" ).hide().fadeIn(300);
    if (type == 'self') {
        $("#chat-input").val('');
    }
    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight }, 1000);
}
