$(document).ready(function() {
	connect();
	$(".chat_header :not(.btn)").click(function() {
		$(".chat_content").slideToggle("slow");
	});

	//關掉連線
	$(".chat_header .btn").click(function() {
		if($(".chat_header .btn").html()=="離線"){
			$(".chat_header .btn").html("上線");
			disconnect();
		}else if($(".chat_header .btn").html()=="上線"){
			$(".chat_header .btn").html("離線");
			connect();
		}
		
	});

//  $(".chatmessage_header").click(function() {
//    $(".chatmessage_content").slideToggle("slow");
//  });
//
//  $(".chatclose").on("click",function() {
//    $(".chatmessage_box").hide();
//  });

//  $(".chatuser").click(function() {
//	  
//    $(".chatmessage_box").show();
//    $(".chatmessage_content").show();
//    $(".chatinput_box").show();
//  });

//  $(".chatenter").click(function() {
//    var msg = $(".chatmessage_input").val();
//    if (msg != "") {
//      $(".chatnew_messages").append("<p>" + msg + "</p>");
//      $(".chatmessage_input").val("");
//    }
//  });
});
//====== 頁面相關 ======

//點開指定人的視窗
function openchatmessagebox(Email,Name){
	if(document.getElementById("to"+Email+"Message")==undefined){
		$("#chatroom").append("<div class='chatmessage_box'>"+
				"<div class='chatmessage_header' onclick='hideMessageBox(this)'>"+
				"<h3 class='chatusername'>"+Name+"</h3>"+
				"<i class='fas fa-times chatclose'></i>"+
				"</div>"+
				"<hr />"+
				"<div class='chatmessage_content'>"+
				"<div class='chatmessages' id='"+Email+"chatbox'>"+
				
				"<div class='chatnew_messages myMessage'></div>"+
				"</div>"+
				"<div class='chatinput_box'>"+
				"<textarea class='chatmessage_input' placeholder='Type a message...' id='to"+Email+"Message' onkeyup='putEnter(\""+Email+"\",this)'></textarea>"+
//          "<i class='fas fa-location-arrow chatenter' onclick='sendMessage(\""+Email+"\")'></i>"+
				"<i class='fas fa-location-arrow chatenter' onclick='sendMessage(\""+Email+"\",this)'></i>"+
				"</div>"+
				"</div>"+
		"</div>");
	}else{
		document.getElementById(Email+"chatbox").parentElement.style.display="block";
	}
}
//縮小視窗
function hideMessageBox(obj){
	$(".chatmessage_header .chatclose").click(function() {
		$(obj).parents(".chatmessage_box").remove();
	});
	
		$(obj).siblings(".chatmessage_content").slideToggle("slow");
	
}
//按下enter會送出
function putEnter(email,obj){
	 var text = $(obj).val();
	if(event.keyCode==13 && text!='\n'){
		sendMessage(email,obj);
	}
	//如果只有按下enter會清掉
	if(text=='\n'){
		$(obj).val("");
	}
}


//================ WebSocket =====================

var stompClient = null;
var userName = null;

var coworkerOnlineList=null;
var coworkerOfflineList=null;

//if(customerEmail!=""){
//	console.log("顧客身分:"+customerEmail);
//	userName = customerEmail;
//}else if(memberEmail!=""){
//	console.log("員工身分:"+memberEmail);
//	userName = memberEmail;
//}else{
//	console.log("???????????")
//}


function connect() {
    var socket = new SockJS(contextPath+'/chatroom');
    stompClient = Stomp.over(socket);
    
    if(memberEmail!=""){
    	console.log("員工身分:"+memberEmail);
    	userName = memberEmail;
    }else{
    	//這裡可能會有BUG!!!!!如果member沒有資料會強制導向登入畫面
    	window.location.replace(contextPath+"/logout");
    	console.log("???????????")
    }
    
    stompClient.connect({user:userName}, function(frame) {
        //setConnected(true);
    	//下面是看websocket訊息用的
        console.log('Connected: ' + frame);
        // 廣播
        stompClient.subscribe('/topic/messages', function(messageOutput) {
        	showOnline(JSON.parse(messageOutput.body));
        });
        //要求送一次request，取得全部在線名單
        $.post(contextPath+"/messageSystem/getOnline");
        
        // 私人
        stompClient.subscribe('/user/subscribe', function(messageOutput) {
        	var messageGet=JSON.parse(messageOutput.body);
        	if(messageGet.customerService==true){
        		getCustomerMessage(messageGet);
        	}else{
        		showCoworkerMessageOutput(messageGet);        		
        	}
        });

    });
    
    
}

//關閉連線
function disconnect() {
	$(".chat_content").empty();
	$.post(contextPath+"/messageSystem/getOnline");
    if(stompClient != null) {
        stompClient.disconnect();
    }
    userName = null;
    console.log("Disconnected");
}
//顧客寄送訊息(obj是送this過來)
function sendMessage(To , obj) {
    console.log("Send to:"+To);
    var text = $(obj).parent().children(".chatmessage_input").val();
    console.log(text);
    
    if(text != ''){
        stompClient.send("/app/coworkerchat/"+To, {}, JSON.stringify({'from':userName, 'text':text}));
        $(obj).parent().parent().children(".chatmessages").append("<div class='myMessage'><p>"+text+"</p></div>");
    }
    $(obj).parent().children(".chatmessage_input").val("");
}
//一登入就送會員List
//如果改寫controller要改寫的地方
function showOnline(messageOutput){
	//console.log(messageOutput);
	$(".chat_content").empty();
	coworkerOnlineList=messageOutput.coworkerOnlineList;
	coworkerOfflineList=messageOutput.coworkerOfflineList;
	
	for(let i=0;i<coworkerOnlineList.length;i++){
		$(".chat_content").append("<div class='chatuser' onclick='openchatmessagebox(\""+coworkerOnlineList[i].Email+"\",\""+coworkerOnlineList[i].Name+"\")'><h5 class='chatusername'>"+coworkerOnlineList[i].Name+"</h5><i class='fas fa-circle online'></i></div>");
	}
	$(".chat_content").append("<br><hr><br>");
	for(let i=0;i<coworkerOfflineList.length;i++){
		$(".chat_content").append("<div class='chatuser' id='"+coworkerOfflineList[i].Email+"'><h5 class='chatusername offline'>"+coworkerOfflineList[i].Name+"</h5></div>");
	}
}
//員工互相傳送的東西
function showCoworkerMessageOutput(messageOutput) {
	var response = document.getElementById(messageOutput.message.from+'chatbox');
	if(response==undefined){
		//如果改寫controller要改寫的地方
		for(var i=0;coworkerOnlineList.length;i++){
			if(messageOutput.message.from==coworkerOnlineList[i].Email){
				openchatmessagebox(messageOutput.message.from,coworkerOnlineList[i].Name);
				break;
			}
		}
	}
    
    
    var p = document.createElement('p');
    p.appendChild(document.createTextNode(messageOutput.message.text)); 
    var div=document.createElement('div');
    div.setAttribute("class","comeMessage"); 
    div.appendChild(p);
    
    response=document.getElementById(messageOutput.message.from+'chatbox');
    response.appendChild(div);

    response.scrollTop = response.scrollHeight;
}



//客服人員
//function sendtoCustomer() {
//    var text = document.getElementById('text').value;
//    if(text != ''){
//        //去抓來的地方是誰
//        var CustomerId=$("#customerfrom").val();
//        /* stompClient.send("/app/chat", {}, JSON.stringify({'from':userName, 'text':text}));
//        document.getElementById('text').value = ''; */
//        stompClient.send("/app/customerService/"+CustomerId, {}, JSON.stringify({'from':userName, 'text':text}));
//        document.getElementById('text').value = '';
//		//土砲暫時的回應(沒時間XD)
//		p.appendChild(document.createTextNode(userName +": "+ text));
//		p.appendChild(document.createElement('br'));
//        response.append(p);
//    }
//}





