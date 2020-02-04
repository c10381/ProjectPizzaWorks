package messageSystem.controller;


import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import messageSystem.websocket.MsgTemplate;
import messageSystem.websocket.WebSocketSessions;

@RestController
//這個方法是使用Request方式寄送訊息，從Client端送出方式並非WebSocket	
public class SystemController {

    @Autowired
    private MsgTemplate template;
    @Autowired
    private  WebSocketSessions session;
    
    @PostMapping("/broadcast")
    public OutputMessage broadcast(@RequestBody Message message) {
        OutputMessage outputMessage = new OutputMessage(new Date().toString(), message);
        template.broadcast(outputMessage);
        return outputMessage;
    }
    //給員工現在登入帳號
    @PostMapping("/messageSystem/getOnline")
    public ArrayList<String> getOnline() {
    	ArrayList<String> AllCustomer=session.getAllCoworker();
    	System.out.println(AllCustomer.toString());
    	template.broadcast(AllCustomer);
    	return AllCustomer;
    }

    @PostMapping("/send/{user}")
    public OutputMessage broadcast(@PathVariable("user") String user, @RequestBody Message message) {
    	System.out.println(message.toString()+" to "+user);
        OutputMessage outputMessage = new OutputMessage(new Date().toString(), message);
        template.sendMsgToCoworker(user, outputMessage);
        return outputMessage;
    }

}
