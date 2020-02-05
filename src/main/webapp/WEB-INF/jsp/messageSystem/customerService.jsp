<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat WebSocket</title>
    <script src="${pageContext.request.contextPath}/js/messageSystem/sockjs-0.3.4.js"></script>
    <script src="${pageContext.request.contextPath}/js/messageSystem/stomp.js"></script>
    <script>
            disconnect();
            var stompClient = null;
            var userName = null;
            var sessionId = null;
			//用在最後的增加訊息
            var response = document.getElementById('response');
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            
            var customerEmail="${CLoginOK.email}";
			var memberEmail="${Mem_LoginOK.email}";
			
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
                document.getElementById('connect').disabled = connected;
                document.getElementById('disconnect').disabled = !connected;
                document.getElementById('conversationDiv').style.visibility
                  = connected ? 'visible' : 'hidden';
                document.getElementById('response').innerHTML = '';

                //document.getElementById('from').disabled = connected;
            }

            function connect() {
                var socket = new SockJS('${pageContext.request.contextPath}/chatroom');
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

            function disconnect() {
                if(stompClient != null) {
                    stompClient.disconnect();
                }
                setConnected(false);
                userName = null;
                console.log("Disconnected");
            }
			//顧客寄送訊息
            function sendMessage() {
                var text = document.getElementById('text').value;
                if(text != ''){
                    /* stompClient.send("/app/chat", {}, JSON.stringify({'from':userName, 'text':text}));
                    document.getElementById('text').value = ''; */
                    stompClient.send("/app/coworkerchat/"+"service@pizza.com", {}, JSON.stringify({'from':userName, 'text':text}));
                    document.getElementById('text').value = '';
                  //土砲暫時的回應(沒時間XD)
					p.appendChild(document.createTextNode(userName +": "+ text));
					p.appendChild(document.createElement('br'));
                    response.append(p);
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
			function showOnline(messageOutput){
				console.log(messageOutput)	
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

    </script>
</head>
<body>
<div>
    <!-- <div>
        <input type="text" id="from" placeholder="Choose a nickname"/>
    </div> -->
    <br/>
    <div>
        <button id="connect" onclick="connect();">Connect</button>
        <button id="disconnect" disabled="disabled" onclick="disconnect();">Disconnect</button>
    </div>
    <br/>
    <div id="conversationDiv">
        <input type="text" id="text" placeholder="Write a message..."/>
        <c:choose>
        	<c:when test="${Mem_LoginOK.privilegeId==6}">
        		<button id="sendMessage" onclick="sendtoCustomer();">Send</button>
        		<p>我是客服人員</p>
        	</c:when>
        	<c:otherwise>
        		<button id="sendMessage" onclick="sendMessage();">Send</button>
        	</c:otherwise>
        </c:choose>
        <input type='hidden' id='customerfrom' value=""></input>
    </div>
    <div id = "scroll" style="height:600px;width:500px;border:1px;font:16px/26px Georgia, Garamond, Serif;overflow:scroll;">
        <p id="response"></p>
    </div>
</div>

</body>
</html>