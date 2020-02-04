package messageSystem.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import messageSystem.websocket.MsgTemplate;
import messageSystem.websocket.WebSocketSessions;

@Controller
public class ChatController {
//本方法利用WebSocket送訊息
    @Autowired
    private WebSocketSessions sessions;
    @Autowired
    private MsgTemplate template;

    @MessageMapping("/chat")
    @SendTo(MsgTemplate.BROADCAST_DESTINATION)
    public OutputMessage send(final Message message) throws Exception {
        final String time = new Date().toString();
        return new OutputMessage(time, message);
    }
    
    //後台聊天室使用
    @MessageMapping("/coworkerchat/{chatID}")
    public OutputMessage toCoworker(@DestinationVariable String chatID, Message message) throws Exception {
    	OutputMessage outputMessage = new OutputMessage(new Date().toString(), message);
        template.sendMsgToCoworker(chatID, outputMessage);
        return outputMessage;
    }

}
