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

  $(".chatmessage_header").click(function() {
    $(".chatmessage_content").slideToggle("slow");
  });

  $(".chatclose").click(function() {
    $(".chatmessage_box").hide();
  });

  $(".chatuser").click(function() {
    $(".chatmessage_box").show();
    $(".chatmessage_content").show();
    $(".chatinput_box").show();
  });

  $(".chatenter").click(function() {
    var msg = $(".chatmessage_input").val();
    if (msg != "") {
      $(".chatnew_messages").append("<p>" + msg + "</p>");
      $(".chatmessage_input").val("");
    }
  });
});



//================ WebSocket =====================

var stompClient = null;
var userName = null;
var sessionId = null;
//用在最後的增加訊息
var response = document.getElementById('response');
var p = document.createElement('p');
p.style.wordWrap = 'break-word';

if(customerEmail!=""){
	console.log("顧客身分:"+customerEmail);
	userName = customerEmail;
}else if(memberEmail!=""){
	console.log("員工身分:"+memberEmail);
	userName = memberEmail;
}else{
	console.log("???????????")
}

function setConnected(connected) {
//    document.getElementById('connect').disabled = connected;
//    document.getElementById('disconnect').disabled = !connected;
//    document.getElementById('conversationDiv').style.visibility
//      = connected ? 'visible' : 'hidden';
//    document.getElementById('response').innerHTML = '';

    //document.getElementById('from').disabled = connected;
}

function connect() {
    var socket = new SockJS(contextPath+'/chatroom');
    stompClient = Stomp.over(socket);
	
    stompClient.connect({user:userName}, function(frame) {
        setConnected(true);
        console.log('Connected: ' + frame);

        // 廣播
        stompClient.subscribe('/topic/messages', function(messageOutput) {
        	showOnline(JSON.parse(messageOutput.body));
        });
        
        // 私人
        stompClient.subscribe('/user/subscribe', function(messageOutput) {
        showMessageOutput(JSON.parse(messageOutput.body));
        });

    });
}

//關閉連線
function disconnect() {
    if(stompClient != null) {
        stompClient.disconnect();
    }
    setConnected(false);
    userName = null;
    console.log("Disconnected");
}
//顧客寄送訊息
function sendMessage(To) {
    var text = document.getElementById('text').value;
    if(text != ''){
        /* stompClient.send("/app/chat", {}, JSON.stringify({'from':userName, 'text':text}));
        document.getElementById('text').value = ''; */
//        stompClient.send("/app/coworkerchat/"+To, {}, JSON.stringify({'from':userName, 'text':text}));
//        document.getElementById('text').value = '';
      //土砲暫時的回應(沒時間XD)
//		p.appendChild(document.createTextNode(userName +": "+ text));
//		p.appendChild(document.createElement('br'));
//        response.append(p);
    }
}
//客服人員
function sendtoCustomer() {
    var text = document.getElementById('text').value;
    if(text != ''){
        //去抓來的地方是誰
        var CustomerId=$("#customerfrom").val();
        /* stompClient.send("/app/chat", {}, JSON.stringify({'from':userName, 'text':text}));
        document.getElementById('text').value = ''; */
        stompClient.send("/app/customerService/"+CustomerId, {}, JSON.stringify({'from':userName, 'text':text}));
        document.getElementById('text').value = '';
		//土砲暫時的回應(沒時間XD)
		p.appendChild(document.createTextNode(userName +": "+ text));
		p.appendChild(document.createElement('br'));
        response.append(p);
    }
}

//一登入就送會員List，要處理的地方
function showOnline(messageOutput){
	console.log(messageOutput);
}
function showMessageOutput(messageOutput) {
    //response與p是廣域變數,
    //var response = document.getElementById('response');
    //var p = document.createElement('p');
    
                    
    /* p.appendChild(document.createTextNode(messageOutput.message.from + " (" + messageOutput.dateStr + ")" + ": "
      + messageOutput.message.text)); */
    p.appendChild(document.createTextNode(messageOutput.message.from +": "
      + messageOutput.message.text));
    p.appendChild(document.createElement('br'));
    response.appendChild(p);
    $("#customerfrom").val(messageOutput.message.from);

    var elem = document.getElementById('scroll');
    elem.scrollTop = elem.scrollHeight;
}
