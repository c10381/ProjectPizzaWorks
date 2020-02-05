package messageSystem.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectEvent;

import _model.MembersBean;
import memberSystem.service.CustomerService;
import messageSystem.controller.SystemController;


/**
 * 連線事件監聽
 */
@Component
public class STOMPConnectEventListener implements ApplicationListener<SessionConnectEvent> {
    @Autowired
    private WebSocketSessions sessions;
    @Autowired
    private CustomerService customerService;
    
    @Override
    public void onApplicationEvent(SessionConnectEvent event) {
        StompHeaderAccessor accessor = StompHeaderAccessor.wrap(event.getMessage());
        String user = accessor.getNativeHeader("user").get(0);
        String sessionId = accessor.getSessionId();
        //抓MembersBean判斷權限，藉此放入WebSocketSessions.java的不同List
        MembersBean mem=customerService.getCustomer(user);
        System.out.println(user);
        if(mem.getPrivilegeId()==2||mem.getPrivilegeId()==3||mem.getPrivilegeId()==4||mem.getPrivilegeId()==5||mem.getPrivilegeId()==6||mem.getPrivilegeId()==7) {
        	sessions.registerCoworkerSessionId(user, sessionId);
        	System.out.print("Coworker login, Coworker:{"+user+"}, sessionId:{"+sessionId+"}, ");
        	System.out.println(sessions.toString());
        	
        }else{
        	sessions.registerCustomerSessionId(user, sessionId);
        	System.out.print("Customer login, Customer:{"+user+"}, sessionId:{"+sessionId+"}, ");
        	System.out.println(sessions.toString());        	
        }
    }

}
