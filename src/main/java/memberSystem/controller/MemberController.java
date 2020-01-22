package memberSystem.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.MembersBean;
import memberSystem.service.CustomerService;
import memberSystem.service.MemberService;

@Controller
@SessionAttributes("Mem_LoginOK")
public class MemberController {

	private CustomerService Custservice;
	private MemberService memService;

	@Autowired
	public void setService(CustomerService Custservice) {
		this.Custservice = Custservice;
	}

	@Autowired
	public void setService(MemberService memService) {
		this.memService = memService;
	}

	// ==登入區==
	// 驗證密碼
	// 驗證成功進入後端頁面
	// 驗證失敗重新導入此頁面,並顯示錯誤訊息
	@PostMapping("/backendSystem/")
	public String Login(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpServletResponse response) {
		System.out.println(email);
		System.out.println(password);

		if (email == null || password == null) {
			model.addAttribute("errorMessage", "帳號或密碼欄不能為空");
			return "backendSystem/coworkerLogin";
		}
		MembersBean bean = Custservice.login(email, password);
		
		if (bean==null||bean.getPrivilegeId() == 1) {
			model.addAttribute("errorMessage", "此帳號不存在，請重新輸入！");
			return "backendSystem/coworkerLogin";
		} else if (bean.getActiveStatus() == 1) {
			// 這裡要member強迫更改密碼，導向變更密碼畫面，並重新登入
			model.addAttribute("email",bean.getEmail());
			return "memberSystem/coworkerChangePWPage";
		} else if (bean.getActiveStatus() == 2) {
			// 這裡要等待Admin更改回原始密碼
			model.addAttribute("errorMessage", "請靜待系統管理者允許變更密碼,或聯繫系統管理員");
			return "backendSystem/coworkerLogin";
		} else if (bean.getActiveStatus() == 3) {
			model.addAttribute("Mem_LoginOK", bean);
			return "backendSystem/backendIndex";

		} else {
			model.addAttribute("errorMessage", "此帳號不存在，請進行註冊或重新輸入！");
			return "backendSystem/coworkerLogin";
		}

	}
	// ==/登入區/==

	// ==註冊區==
	// 轉址，因為前端有用到Spring的<form:form>，需要加MembersBean
	// 一個為單一註冊
	// 另一個為吃CSV註冊，在Client上解析後回傳JsonArray
	@GetMapping(value = "/memberSystem/memberRegister")
	public String goRegisterPage(Model model) {
		model.addAttribute("oneRegister", new MembersBean());
		return "memberSystem/Member_register";
	}

	// 新增單一員工，用Ajax
	// 要先確認User為系統管理者(PrivilegeId==7)
	// Service return
	// 0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功、3:權限不足無法進行此操作
	@PostMapping(value = "/memberSystem/member_add")
	public @ResponseBody Integer addCustomer(@ModelAttribute("Mem_LoginOK") MembersBean Admin,
			@RequestBody MembersBean mem, Model model) {
		if (Admin.getPrivilegeId() != 7) {
			return 3;
		}
		return memService.addMember(mem);
	}

	// 新增複數員工，用Ajax
	// 要先確認User為系統管理者(PrivilegeId==7)
	@PostMapping(value = "/memberSystem/member_mutiple_add")
	public @ResponseBody Map<String, String> addMutipleCustomer(@ModelAttribute("Mem_LoginOK") MembersBean Admin,
			@RequestBody List<MembersBean> MemberList, Model model) {
		if (Admin.getPrivilegeId() != 7) {
			Map<String, String> map = new HashMap<>();
			map.put("errorMsg", "權限不足無法進行此操作");
			return map;
		}
		return memService.addMutipleMember(MemberList);
	}

	// ==/註冊區/==

	// ==忘記密碼區==
	// 送出更改密碼請求
	@GetMapping(value = "memberSystem/coworkforgetPWrequest")
	public @ResponseBody String coworkforgetPWrequest(@RequestParam(value = "email") String email) {
		if(memService.memberFPWrequest(email)) {
			return "ok";
		}else{
			return "Error";
		}	
	}
	// ==/忘記密碼區/==
	
	// ==變更密碼區==
	//User變更密碼(要傳入String,變更完後重新登入)
	@PostMapping(value = "memberSystem/coworkerchangePW")
	public String coworkerchangePW(@RequestParam(value = "email") String email,@RequestParam(value = "password") String newPW,@RequestParam(value = "comfirmPassword") String comfirmPassword,Model model) {
		if(!newPW.equals(comfirmPassword)) {
			model.addAttribute("errorMessage","確認密碼不相符");
			return "memberSystem/coworkerChangePWPage";
		}
		MembersBean mem=memService.coworkerUpdPwd(email, newPW);
		if(mem==null) {
			model.addAttribute("errorMessage","密碼與原先密碼相同");
			return "memberSystem/coworkerChangePWPage";
		}
		model.addAttribute("Mem_LoginOK",mem);
		return "backendSystem/coworkerLogin";
	}
	
	// ==/變更密碼區/==

	// ==拿ValidationRequest==
	
	@GetMapping(value = "memberSystem/searchCoworkerStatus")
	public String coworkerchangePW(Model model) {
		model.addAttribute("List", memService.SearchValidationRequestBeans(1,3));
		return "memberSystem/coworkerCPWReq";
	}
	
	// ==/變更密碼區/==
	
}
