package messageSystem.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import _model.MembersBean;
import memberSystem.service.MemberService;
import messageSystem.websocket.MsgTemplate;
import messageSystem.websocket.WebSocketSessions;

@RestController
@EnableScheduling
//這個方法是使用Request方式寄送訊息，從Client端送出方式並非WebSocket	
public class SystemController {

    @Autowired
    private MsgTemplate template;
    @Autowired
    private WebSocketSessions session;
    @Autowired
    private MemberService memService;
    
    private List<MembersBean> listmb;
    private List<Map<String,String>> allCoworkerList;
    private List<Map<String,String>> allCustomerList;
    
    
    @PostMapping("/broadcast")
    public OutputMessage broadcast(@RequestBody Message message) {
        OutputMessage outputMessage = new OutputMessage(new Date().toString(), message);
        template.broadcast(outputMessage);
        return outputMessage;
    }
    //給員工現在登入帳號(有使用排程自動更新)
    @Scheduled(fixedRate = 5000)
    @PostMapping("/messageSystem/getOnline")
    public void getOnline() {
    	Map<String,List<Map<String,String>>> map= new HashMap<String,List<Map<String,String>>>();
    	
    	Map<String,String> memMap=new HashMap<String,String>();
    	List<Map<String,String>> coworkerOnlineList=new ArrayList<>();
    	List<Map<String,String>> coworkerOfflineList=new ArrayList<>();
        List<Map<String,String>> customerOnlineList=new ArrayList<>();
        List<Map<String,String>> customerOfflineList=new ArrayList<>();
    	ArrayList<String> AllCoworker=session.getAllCoworker();
    	ArrayList<String> AllCustomer=session.getAllCustomer();
    	//System.out.println("這是定時廣播，WebSocket用的(30s),目前登入員工為："+AllCoworker.toString()+"目前登入顧客為："+AllCustomer.toString());
    	
    	if(listmb==null) {
    		listmb=memService.getAllMembers(1,2,3,4,5,6,7);
    		for(MembersBean mem:listmb) {
    			memMap=new HashMap<String,String>();
    			memMap.put(mem.getEmail(), mem.getLastName()+mem.getFirstName());
    			if(mem.getPrivilegeId()!=1) {
    				allCoworkerList.add(memMap);
    			}else {
    				allCustomerList.add(memMap);
    			}
    		}
    //		System.out.println("我有進去拿"+listmb.toString());
    	}
    	for(String onlineCoworker:AllCoworker) {
    		//這裡是員工區(上線/離線名單)
    		for(MembersBean mem:listmb) {
				if(onlineCoworker.equals(mem.getEmail())) {
					memMap=new HashMap<String,String>();
					String fullName=mem.getLastName()+mem.getFirstName();
					memMap.put("Email",onlineCoworker);
					memMap.put("Name", fullName);
					coworkerOnlineList.add(memMap);
					break;
				}
			}
			
		}
//    	System.out.println(AllCoworker.toString());
//    	System.out.println(coworkerOnlineList.toString());
//    	System.out.println(coworkerOfflineList.toString());
    	map.put("coworkerOnlineList", coworkerOnlineList);
    	map.put("coworkerOfflineList", coworkerOfflineList);
    	map.put("customerOnlineList", customerOnlineList);
    	map.put("customerOfflineList", customerOfflineList);
    	
    	template.broadcast(map);
    	return ;
    }

    @PostMapping("/send/{user}")
    public OutputMessage broadcast(@PathVariable("user") String user, @RequestBody Message message) {
    	System.out.println(message.toString()+" to "+user);
        OutputMessage outputMessage = new OutputMessage(new Date().toString(), message);
        template.sendMsgToCoworker(user, outputMessage);
        return outputMessage;
    }

}
