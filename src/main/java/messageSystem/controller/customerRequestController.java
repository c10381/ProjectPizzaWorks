package messageSystem.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import _model.MembersBean;
import _model.customerRequestBean;
import memberSystem.service.MemberService;
import messageSystem.javaMailutil.MailCtxAndUtil;
import messageSystem.javaMailutil.SpringMailConfig;
import messageSystem.javaMailutil.SpringMailUtil;
import messageSystem.service.customerRequestService;

@Controller
public class customerRequestController {

	customerRequestService service;
	MemberService mservice;

	@Autowired
	public void setService(customerRequestService service) {
		this.service = service;
	}

	@Autowired
	public void setMservice(MemberService mservice) {
		this.mservice = mservice;
	}

	// 操作Spring Mail區
	ApplicationContext context = new AnnotationConfigApplicationContext(SpringMailConfig.class);
	SpringMailUtil mailUtil = (SpringMailUtil) context.getBean("mailSend", SpringMailUtil.class);

	// 轉址至信箱系統
	@GetMapping("/messageSystem/MailSystem")
	public String toMailSystem() {
		return "messageSystem/MailSystem";
	}

	// 轉址至客訴回應系統
	@GetMapping("/messageSystem/CustomerRespondSystem")
	public String CustomerRespondSystem() {
		return "messageSystem/CustomerRespond";
	}
	// 轉址至客服回報單系統
	@GetMapping("/messageSystem/CustomerReport")
	public String CustomerReportSystem(@RequestParam("email") String email,Model model) {
		model.addAttribute("CustomerEmail", email);
		return "messageSystem/customerReport";
	}
	@GetMapping(value="/messageSystem/GetAllSalesOrder")
	public String getAllSalesOrder() {
		return "messageSystem/GetAllSalesOrder";
	}

	// 顧客存入DB 要從前端傳回email跟content
	// 要使用Ajax，回傳為一個Boolean
	@PostMapping("/messageSystem/insertoffline")
	public @ResponseBody Boolean insertcustomerRequest(@RequestParam("email") String email,
			@RequestParam("content") String content) {
		customerRequestBean crb = new customerRequestBean();
		crb.setMemberEmail(email);
		crb.setQueryContent(content.trim());
		crb.setReplyStatus(0);
		return service.insertcustomerRequest(crb);
	}
	// 存入DB(由客服回傳)從前端整顆Bean JSON
	// 要使用Ajax，回傳為一個Boolean
	@PostMapping("/messageSystem/insertcustomerReport")
	public @ResponseBody Boolean insertcustomerReport(@RequestBody customerRequestBean crb) {
		crb.setReplyStatus(1);
		crb.setReplyDate(String.valueOf(new Timestamp(new Date().getTime())));
		return service.insertcustomerRequest(crb);
	}

	// 用PK顯示單筆Query
	@GetMapping("/messageSystem/queryoffline")
	public String singleCustomerRequest(Model model) {
		customerRequestBean crb = service.getcustomerRequestByQueryId(1);
		model.addAttribute("crb", crb);
		return "c/testcustomerRequest";
	}

	// 顯示全部客訴清單(回應兩個List:customerRequest,memberList)
	@GetMapping(value = "/messageSystem/AllCustomerRequest", produces = "text/html;charset=UTF-8;")
	public @ResponseBody String allcustomerRequest() {
		List<customerRequestBean> list = service.getAllQuery();
		List<Map<String, String>> memberList = new ArrayList<>();
		// 拿全部Customer Name和Email
		for (MembersBean mem : mservice.getAllMembers(1,6,7)) {
			HashMap<String, String> map = new HashMap<>();
			map.put("fullName", mem.getLastName() + mem.getFirstName());
			map.put("Email", mem.getEmail());
			map.put("memberId", String.valueOf(mem.getMemberId()));
			memberList.add(map);
		}

		Map<String, List> ListMap = new HashMap<>();
		ListMap.put("customerRequest", list);
		ListMap.put("memberList", memberList);

		return new Gson().toJson(ListMap);
	}

	// get all queries that have not been replied
	@GetMapping("/messageSystem/queryUnrepliedoffline")
	public String allUnrepliedcustomerRequest(Model model) {
		List<customerRequestBean> list = service.getAllcustomerRequestByReplyStatus(0);
		model.addAttribute("list", list);
		return "c/testcustomerRequest";
	}

	// 查詢會員信箱(利用權限，只會傳出1.全名,2. Email)
	@GetMapping("/messageSystem/GetMemberEmail")
	public @ResponseBody String GetMemberEmail(@RequestParam("privilegeId") Integer privilegeId) {
		List<Map> list = new ArrayList<>();

		for (MembersBean mem : mservice.getAllMembers(privilegeId)) {
			HashMap<String, String> map = new HashMap<>();
			map.put("fullName", mem.getLastName() + mem.getFirstName());
			map.put("Email", mem.getEmail());
			list.add(map);
		}
		Gson gson = new Gson();
		return gson.toJson(list);
	}

	// 寄出信件(一般是促銷信，還要修)
	@PostMapping("/messageSystem/SendMail")
	public @ResponseBody Boolean sendMail(@RequestParam("to") String to, @RequestParam("subject") String subject,
			@RequestParam("Context") String Context) {
		System.out.println(to + " " + subject + " " + Context);
		return mailUtil.sendMail(SpringMailConfig.MAILUsername, to, subject,
				new MailCtxAndUtil().ToCustomerSales(Context));
	}

	// 客服回應
	// 塞JavaMail
	@PostMapping("/messageSystem/replyoffline")
	public @ResponseBody Boolean replycustomerRequest(@RequestParam("queryId") Integer queryId,@RequestParam("CustomerEmail") String CustomerEmail,
			@RequestParam("CustomerName") String CustomerName, @RequestParam("queryContent") String queryContent,
			@RequestParam("coworkerEmail") String coworkerEmail, @RequestParam("replyContent") String replyContent) {

		System.out.println("SENDING EMAIL==================");
		customerRequestBean crb = new customerRequestBean();
		if (mailUtil.sendMail(SpringMailConfig.MAILUsername, CustomerEmail, "Pizza Bit感謝您的回饋",
				new MailCtxAndUtil().AnswerCustomer(CustomerName, replyContent))) {
			for (MembersBean mem : mservice.getAllMembers(6, 7)) {
				if (mem.getEmail().equals(coworkerEmail)) {
					crb.setCoworkerID(mem.getMemberId());
					break;
				}
			}

			crb.setQueryId(queryId);
			crb.setReplyContent(replyContent);
			service.replycustomerRequest(crb);
			return true;
		}
		;
		return false;
	}
	@GetMapping(value="/messageSystem/getEmail",produces="text/html;charset=UTF-8;")
	public @ResponseBody String getMemberNameAndEmailByNameAndPrivileId(@RequestParam("name") String name,@RequestParam("privilege") Integer privilege) {
		Integer[] privilegeId= null;
		if(privilege==1) {
			privilegeId=new Integer[] {1};
		}else if(privilege==2) {
			privilegeId=new Integer[] {2,3,4,5,6,7};
		}
		List<MembersBean> list=service.getMemberNameAndEmailByNameAndPrivileId(name, privilegeId);
		Map<String,String> map=new HashMap<>();
		System.out.println(list.toString());
		if(list.isEmpty()) {
			return "0";
		}
		for (MembersBean mem : list) {
			map.put(mem.getLastName()+mem.getFirstName(), mem.getEmail());
		}
		Gson gson=new Gson();
		return gson.toJson(map);
	}
}
