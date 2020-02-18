package messageSystem.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import _model.MembersBean;
import memberSystem.service.MemberService;
import messageSystem.model.Message;
import messageSystem.model.OutputMessage;
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
	private List<Map<String, String>> allCoworkerList;
	private List<Map<String, String>> allCustomerList;

	@PostMapping("/broadcast")
	public OutputMessage broadcast(@RequestBody Message message) {
		OutputMessage outputMessage = new OutputMessage(new Date().toString(), message,false);
		template.broadcast(outputMessage);
		return outputMessage;
	}

	// 給員工現在登入帳號(有使用排程自動更新)
	@Scheduled(fixedRate = 5000)
	@PostMapping("/messageSystem/getOnline")
	public void getOnline() {
		Map<String, List<Map<String, String>>> map = new HashMap<String, List<Map<String, String>>>();

		Map<String, String> memMap = new HashMap<String, String>();
		List<Map<String, String>> coworkerOnlineList = new ArrayList<>();
		List<Map<String, String>> coworkerOfflineList = new ArrayList<>();

		ArrayList<String> AllCoworker = session.getAllCoworker();
		// System.out.println("這是定時廣播，WebSocket用的(30s),目前登入員工為："+AllCoworker.toString()+"目前登入顧客為："+AllCustomer.toString());

		if (listmb == null) {
			listmb = memService.getAllMembers(2, 3, 4, 5, 6, 7);
			for (MembersBean mem : listmb) {
				memMap = new HashMap<String, String>();
				memMap.put(mem.getEmail(), mem.getLastName() + mem.getFirstName());
			}
			// System.out.println("我有進去拿"+listmb.toString());
		}
		for (MembersBean mem : listmb) {
			boolean flag = false;
			// 這裡是員工區(上線/離線名單)
			for (String onlineCoworker : AllCoworker) {
				memMap = new HashMap<String, String>();
				String fullName = mem.getLastName() + mem.getFirstName();
				memMap.put("Email", mem.getEmail());
				memMap.put("Name", fullName);
				if (onlineCoworker.equals(mem.getEmail())) {
					flag = true;
					break;
				}
			}
			if (flag) {
				coworkerOnlineList.add(memMap);
			} else {
				coworkerOfflineList.add(memMap);
			}
		}

//		System.out.println(AllCoworker.toString());
//		System.out.println(coworkerOnlineList.toString());
//		System.out.println(coworkerOfflineList.toString());
		map.put("coworkerOnlineList", coworkerOnlineList);
		map.put("coworkerOfflineList", coworkerOfflineList);

		template.broadcast(map);
	}
	//目前未用,利用request送到指定的客戶
	@PostMapping("/send/{user}")
	public OutputMessage broadcast(@PathVariable("user") String user, @RequestBody Message message) {
		System.out.println(message.toString() + " to " + user);
		OutputMessage outputMessage = new OutputMessage(new Date().toString(), message,false);
		template.sendMsgToCoworker(user, outputMessage);
		return outputMessage;
	}

}
