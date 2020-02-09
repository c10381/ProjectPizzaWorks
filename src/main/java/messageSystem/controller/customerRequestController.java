package messageSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.customerRequestBean;
import messageSystem.javaMailutil.SpringMailConfig;
import messageSystem.javaMailutil.SpringMailUtil;
import messageSystem.service.customerRequestService;

@Controller
public class customerRequestController {

	customerRequestService service;

	@Autowired
	public void setService(customerRequestService service) {
		this.service = service;
	}
	//操作Spring Mail區
	ApplicationContext context= new AnnotationConfigApplicationContext(SpringMailConfig.class);
	SpringMailUtil mailUtil = (SpringMailUtil)context.getBean("mailSend",SpringMailUtil.class);

	// 轉址至信箱系統
	@GetMapping("/messageSystem/MailSystem")
	public String toMailSystem() {
		return "messageSystem/MailSystem";
	}

	// 寄出信件(一般是促銷信)
	@PostMapping("messageSystem/SendMail")
	public @ResponseBody Boolean sendMail(@RequestParam("to") String to,
			@RequestParam("subject") String subject, @RequestParam("content") String content) {
		System.out.println(to+" "+subject+" "+content);
		return mailUtil.sendMail(SpringMailConfig.MAILUsername, to, subject, content);
	}

	// 存入DB 要從前端傳回email跟content
	// 要使用Ajax，回傳為一個Boolean
	@PostMapping("/messageSystem/insertoffline")
	public @ResponseBody Boolean insertcustomerRequest(@RequestParam("email") String email,
			@RequestParam("content") String content) {
		customerRequestBean crb = new customerRequestBean();
		crb.setMemberEmail(email);
		crb.setQueryContent(content);

		return service.insertcustomerRequest(crb);
	}

	// 用PK顯示單筆Query
	@GetMapping("/messageSystem/queryoffline")
	public String singleCustomerRequest(Model model) {
		customerRequestBean crb = service.getcustomerRequestByQueryId(1);
		model.addAttribute("crb", crb);
		return "c/testcustomerRequest";
	}

	// 顯示全部regardless of reply status
	@GetMapping("/messageSystem/queryAlloffline")
	public String allcustomerRequest(Model model) {
		List<customerRequestBean> list = service.getAllQuery();
		model.addAttribute("list", list);
		return "c/testcustomerRequest";
	}

	// get all queries that have not been replied
	@GetMapping("/messageSystem/queryUnrepliedoffline")
	public String allUnrepliedcustomerRequest(Model model) {
		List<customerRequestBean> list = service.getAllcustomerRequestByReplyStatus(0);
		model.addAttribute("list", list);
		return "c/testcustomerRequest";
	}

	// 客服回應
	// 塞JavaMail
	@PostMapping("/messageSystem/replyAlloffline")
	public String replycustomerRequest(@RequestParam("empID") String empID, @RequestParam("to") String to,
			@RequestParam("content") String content, @RequestParam("queryID") String queryID) {
//		AnnotationConfigApplicationContext cntxt = new AnnotationConfigApplicationContext();
//		cntxt.register(RootAppConfig.class);
//		cntxt.refresh();
//		MailService emailService = cntxt.getBean(MailService.class);
//		cntxt.close();
		System.out.println("SENDING EMAIL==================");
//		String from = "susanbayloi124578@gmail.com";
//		String to = hob.getMail();
//		String subject = "76影城包廳繳款通知信";
//		String content = "親愛的"+ "genie" +"先生/小姐您好:"+"\n"+"\n"
//				+ "感謝您申請76影城包廳服務"+"\n"
//				+ "經過我們的評估，您的包廳申請已經通過"+"\n"
//				+ "包廳金額共:" + 1000 + "元"+"\n"
//				+ "請盡速將相關金額匯款至以下銀行帳戶:"+"\n"
//				+ "銀行：兆豐銀行南台北分行(銀行代碼017)"+"\n"
//				+ "帳號：３９２０６１０５８８８６８６"+"\n"
//				+ "戶名:76影城"+"\n"
//				+ "轉帳後請email回覆'轉帳帳號末5碼'，以利確認，謝謝"+"\n"+"\n"
//				+ "祝　闔家平安";
//		emailService.sendMailSimple(from, to, subject, content);
		customerRequestBean crb = new customerRequestBean();
		crb.setCoworkerID(Integer.parseInt(empID));
		crb.setReplyContent(content);
		crb.setMemberEmail(to);
		crb.setQueryId(Integer.parseInt(queryID));
		service.replycustomerRequest(crb);
		return "c/testcustomerRequest";
	}

}
