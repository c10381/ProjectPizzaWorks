//1. 當點擊對話框按鈕會開啟連線，此時會監測客服人員是否在線上
//2. 當客服不在線上時，會自動出現資訊欄對話框(?)(目前以導向聯絡我們的page)，請他留下email與內容Content，
//   此時對話欄將會無法送出對話
//3. 當客服在線上時，即可進行對話，當產生對話時會將資訊與對話分別保留在localStorage內的"CSR_history"＆"CSR_
//Dialogue"內



$(function () {
//    var INDEX = 0;
    
    $("#chat-submit").click(function (e) {
        e.preventDefault();
        // 取得送出內容
        var msg = $("#chat-input").val();
        // 當沒內容不送出
        if (msg.trim() == '') {
            return false;
        }
        // 將對話帶入，呼叫產生對話html
        
        sendMessage(msg);
        generate_message(msg, 'self');
        
        var buttons = [
            {
                name: 'Existing User',
                value: 'existing'
            },
            {
                name: 'New User',
                value: 'new'
            }
        ];
    })

    // 開關聊天
    $("#chat-circle").click(function () {
    	connect() ;
        $("#chat-circle").toggle('scale');
        $(".chat-box").toggle('scale');
    })
    // 開關聊天
    $(".chat-box-toggle").click(function () {
        $("#chat-circle").toggle('scale');
        $(".chat-box").toggle('scale');
    })

})


//這兩個是全域變數(function內共用)
var stompClient = null;

//判斷User用
var userName = fromLastName+fromFirstName;

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
    	generate_message(msg, 'self');

//        userName = ;
//    	
//    	
    }

    stompClient.connect({ user: userName }, function(frame) {
        console.log('Connected: ' + frame);
        // 廣播
        stompClient.subscribe('/topic/messages', function(messageOutput) {
            //會送線上名單，送到showOnline作處理
            showOnline(JSON.parse(messageOutput.body));
        });

        //送一次request，取得全部在線名單
        $.post(contextPath + "/messageSystem/getOnline");

        // 私人
        stompClient.subscribe('/user/subscribe', function(messageOutput) {
            //判斷是不是customerService使用的(前台一般都是true)
        	console.log(messageOutput.body);
            var messageGet = JSON.parse(messageOutput.body);
            if (messageGet.customerService == true) {
//            	showCustomerMessageOutput(messageGet);
            	console.log(messageGet.text);
            	var msg = messageGet.message.text;
        	    generate_message(msg, 'other');
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
//會在這裡判斷customer是不是上線
function showOnline(messageOutput){
	//console.log(messageOutput);
	coworkerOnlineList=messageOutput.coworkerOnlineList;
	
	for(let i=0;i<coworkerOnlineList.length;i++){
		if(coworkerOnlineList[i]=="service@pizza.com"){
			//客服上線能幹嘛


			
			break;
		}else{
			//客服沒上線能幹嘛


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
   console.log(text);

    //已經寫好的controller路徑
    if (text != '') {
        //要判斷是訪客還是已註冊會員，送出不同訊息
     //stompClient.send("/app/customerchat/" + "service@pizza.com", {}, JSON.stringify({ 'from': userName, 'text': text }));
       
     stompClient.send("/app/customerchat/" + "service@pizza.com", {}, JSON.stringify({ 'from': userName, 'text': text ,'fromFirstName': fromFirstName,'fromLastName': fromLastName,}));
        

        //這裡塞放在網頁上，"自己送出的訊息"
     

    }
    //這裡放把輸入框清空的功能
 	
}

//客服人員送過來會交給這裡處理
function showCustomerMessageOutput(messageOutput) {
	//messageOutput.message.from：String，Email從那邊來的(前台應該都是從service@pizza.com來)
    //messageOutput.message.fromFirstName：String，來者名字
    //messageOutput.message.fromLastName：String，來者姓
    //messageOutput.message.fromName：String，來者全名(如果沒有名字就會是"訪客")

	//messageOutput.message.text：String，過來的內容
	
    //messageOutput.dateStr：String，時間格式為"Thu Feb 06 11:36:34 CST 2020"的
	//messageOutput.customerService：Boolean，是不是會員系統發送(客服系統的值都是true)


	//這裡是做如果自己的對話框沒開啟，會跳出對話框(給你參考用)
	var response = document.getElementById(messageOutput.message.from+'chatbox');
	if(response==undefined){
		for(var i=0;coworkerOnlineList.length;i++){
			if(messageOutput.message.from==coworkerOnlineList[i].Email){
				openchatmessagebox(messageOutput.message.from,coworkerOnlineList[i].Name);
				break;
			}
		}
	}
    
    //處理對話(給你參考用)
    var p = document.createElement('p');
    p.appendChild(document.createTextNode(messageOutput.message.text)); 
    var div=document.createElement('div');
    div.setAttribute("class","comeMessage"); 
    div.appendChild(p);
    
    response=document.getElementById(messageOutput.message.from+'chatbox');
    response.appendChild(div);

    response.scrollTop = response.scrollHeight;
}

// 用於產生對話筐
function generate_message(msg, type) {
//    INDEX++;
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
