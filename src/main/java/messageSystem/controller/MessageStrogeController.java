package messageSystem.controller;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _model.MessageBean;
import messageSystem.service.MessageStorgeService;
@Controller
public class MessageStrogeController {
	
	private MessageStorgeService service;
	
	@Autowired
	public void setService(MessageStorgeService service) {
		this.service = service;
	}
	public MessageStrogeController() {
		// TODO Auto-generated constructor stub
	}
	
	
	@GetMapping(value = "/messageSystem/saveMessage")
	public @ResponseBody Boolean saveMessage(MessageBean messageBean) throws InterruptedException {
		return service.insertMessage(messageBean);
//		service.insertMessage(new MessageBean("admin@gmail.com","service@gmail.com","嗨嗨嗨",String.valueOf(new Timestamp(new Date().getTime())),0));
//		service.insertMessage(new MessageBean("service@gmail.com","admin@gmail.com","嗨，怎麼了？",String.valueOf(new Timestamp(new Date().getTime())),0));
//		service.insertMessage(new MessageBean("admin@gmail.com","service@gmail.com","想問你今天下午有什麼事情呢？",String.valueOf(new Timestamp(new Date().getTime())),0));
//		Thread.sleep(5 * 1000);
//		service.insertMessage(new MessageBean("admin@gmail.com","webadmin@gmail.com","網頁端請更新內容",String.valueOf(new Timestamp(new Date().getTime())),0));
//		service.insertMessage(new MessageBean("webadmin@gmail.com","admin@gmail.com","收到了！謝謝",String.valueOf(new Timestamp(new Date().getTime())),0));		
//		Thread.sleep(3 * 1000);
//		service.insertMessage(new MessageBean("service@gmail.com","admin@gmail.com","沒有事情，怎麼了嗎？",String.valueOf(new Timestamp(new Date().getTime())),0));
//		service.insertMessage(new MessageBean("admin@gmail.com","service@gmail.com","想請你注意一下顧客狀況",String.valueOf(new Timestamp(new Date().getTime())),0));
//		Thread.sleep(1 * 1000);
//		service.insertMessage(new MessageBean("admin@gmail.com","webadmin@gmail.com","做完請回報喔！",String.valueOf(new Timestamp(new Date().getTime())),0));
//		Thread.sleep(7 * 1000);
//		service.insertMessage(new MessageBean("service@gmail.com","admin@gmail.com","收到！",String.valueOf(new Timestamp(new Date().getTime())),0));
//		service.insertMessage(new MessageBean("admin@gmail.com","service@gmail.com","最近顧客有提到客服太常不再線上",String.valueOf(new Timestamp(new Date().getTime())),0));
		
//		return true;
	}
	
	@GetMapping(value = "/messageSystem/getMessage",produces="text/html;charset=UTF-8;")
	public @ResponseBody String getMessage(@RequestParam("from")String from,@RequestParam("to")String to) {
		return new Gson().toJson(service.getMessage(from,to));
	}
	
	
	
	
}
