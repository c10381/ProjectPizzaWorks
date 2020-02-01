package backendSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.MembersBean;
import backendSystem.notificationService.msgService;

@Controller
@SessionAttributes("Mem_LoginOK")
public class redirectController {

	private msgService service;

	// 轉址(Login page)
	@RequestMapping("/backendSystem/coworkerLogin")
	public String LoginPage(Model model) {
		return "backendSystem/coworkerLogin";
	}

	// 轉址(navbar)
	@PostMapping(value = "/backendSystem/navbar")
	public String navbar(Model model) {
		return "backendSystem/navbar";
	}

	// 轉址(sidebar,判斷權限)
	@PostMapping(value = "/backendSystem/sidebar")
	public String sidebarSelect(@ModelAttribute("Mem_LoginOK") MembersBean mem, Model model) {

		switch (mem.getPrivilegeId()) {
		case 2:
			return "backendSystem/sideBar/sideBar_webAdmin";
		case 3:
			return "backendSystem/sideBar/sideBar_salesManger";
		case 4:
			return "backendSystem/sideBar/sideBar_purchaseManger";
		case 5:
			return "backendSystem/sideBar/sideBar_stockManger";
		case 6:
			return "backendSystem/sideBar/sideBar_customerService";
		case 7:
			return "backendSystem/sideBar/sideBar_admin";
		default:
			return "backendSystem/coworkerLogin";
		}
	}

	// 轉址(Login 忘記密碼請求)
	@GetMapping(value = "/memberSystem/coworkerfPW")
	public String coworkerForgetPW(Model model) {
		return "memberSystem/coworkerforgetPWPage";
	}

	// 轉址(忘記密碼)
	@GetMapping(value = "/memberSystem/memberPW")
	public String memberPW(Model model) {
		return "memberSystem/MemberPWPage";
	}

	// 所有員工資料
	@GetMapping(value = "/memberSystem/allMember")
	public String AllMember(Model model) {
		return "memberSystem/allMember";
	}

	// 所有顧客資料
	@GetMapping(value = "/memberSystem/allCustomer")
	public String AllCustomer(Model model) {
		return "memberSystem/allCustomer";
	}

	// 客服系統
	@GetMapping(value = "/customerService")
	public String getChat(Model model) {
		return "messageSystem/customerService";
	}

}
