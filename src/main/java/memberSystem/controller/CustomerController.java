package memberSystem.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import _model.MembersBean;
import memberSystem.service.CustomerService;

@Controller
public class CustomerController {
	
	private CustomerService service;
	
	@Autowired
	public void setService(CustomerService service) {
		this.service = service;
	}
	
	  
	@RequestMapping(value="/member/add", method=RequestMethod.POST)
	public String addCustomer(@ModelAttribute("MembersBean") MembersBean mem,HttpServletRequest request) {	
		service.addCustomer(request,mem);
		return "addCustomer";
	}
	//新會員驗證信(所以此Request一開始不會拿到MemberBean)
	//最後會拿到Bean
	//view部分尚未建立
	@RequestMapping(value="/member/add/{VCode}")
	public String validationCode(@PathVariable("VCode") String VCode,Model model) {
		MembersBean mem=service.confirmvalidationCode(VCode);
		if(mem!=null) {
			model.addAttribute("MembersBean",mem);
			return "memberSystem/ConfirmEmailSuccess";
		}
		return "memberSystem/ConfirmEmailFail";
	}
	@RequestMapping(value="/memberSystem/ForgetPW")
	public String forgetPWPageRequest() {
		return "memberSystem/ForgetPWPage";
	}
	//Customer忘記密碼
	//用AJAX回傳字串，要在回傳物件前加@ResponseBody
	@PostMapping(value="/memberSystem/forgetPW")
	public @ResponseBody String forgetPWRequest(@RequestParam(value="email") String email,Model model,HttpServletRequest request) {

		if(service.userRequestChangePW(request,email)) {
			return "OK!";
		};
		return "此Email尚未申請會員，請先註冊";
	}
	//Customer點擊忘記密碼連結
	//要撈出MemberBean
	//導向修改密碼介面
	@RequestMapping(value="/memberSystem/forgetPW/{VCode}")
	public String forgetPWvalidationCode(@PathVariable("VCode") String VCode,Model model) {
		MembersBean mem=service.confirmvalidationCode(VCode);
		if(mem!=null) {
			model.addAttribute("MembersBean",mem);
			return "/memberSystem/validationCodeSuccess";
		}
		return "/memberSystem/validationCodeFail";
	}
	
}
