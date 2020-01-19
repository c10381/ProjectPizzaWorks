package memberSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	//轉址，因為前端有用到Spring的<form:form>，需要加MembersBean
	//一個為單一註冊
	//另一個為吃CSV註冊，在Client上解析後回傳JsonArray
	@GetMapping(value="/memberSystem/memberRegister")
	public String goRegisterPage(Model model) {
		model.addAttribute("oneRegister", new MembersBean());
		return "memberSystem/Member_register";
	}
	//用Ajax來處理這件事
	//要先確認User為系統管理者(PrivilegeId==7)
	//Service return
	//0:新增帳號失敗(可能為dao問題)、1:帳號已存在、2:新增成功、3:權限不足無法進行此操作
	@PostMapping(value = "/memberSystem/member_add")
	public @ResponseBody Integer addCustomer(@ModelAttribute("Mem_LoginOK")MembersBean Admin,@RequestBody MembersBean mem,Model model) {
		if(Admin.getPrivilegeId()!=7) {
			return 3;
		}
		return memService.addMember(mem);
	}
	
	
	
}
