package messageSystem.websocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompCommand;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import com.sun.security.auth.UserPrincipal;

//資料來源：
//https://medium.com/@lmlakai1024/springboot%E9%85%8D%E5%90%88thymeleaf%E5%AF%A6%E7%8F%BEwebsocket%E7%9A%84%E7%B0%A1%E6%98%93%E8%81%8A%E5%A4%A9%E5%AE%A4-442f51fa641a

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
	
	//進階版
	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic", "/user", "/subscribe");
		config.setUserDestinationPrefix("/user");
		config.setApplicationDestinationPrefixes("/app");
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/chatroom").withSockJS();
	}
	
    /**
     * 頻道內的攔截訊息
     * 匿名類別
     * 
     * 在建立連線階段時將 server 端自己產生的 sessionId 填入這個 session 的 User 之中。當然這個 sessionId 也可以用自己其他的方式產生
     * 
     */
    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
                StompHeaderAccessor accessor =
                        MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);

                if (StompCommand.CONNECT.equals(accessor.getCommand())) {
//                    String user = accessor.getNativeHeader("user").get(0);
                    accessor.setUser(new UserPrincipal(accessor.getSessionId()));
                }

                return message;
            }
        });
    }
	

}