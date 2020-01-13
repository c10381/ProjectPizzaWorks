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
@RequestMapping(value = "/memberSystem")
public class CustomerController {

	private CustomerService service;

	@Autowired
	public void setService(CustomerService service) {
		this.service = service;
	}
<<<<<<< Updated upstream
//<<<<<<< Updated upstream
	
	  
	@RequestMapping(value="/member/add", method=RequestMethod.POST)
	public String addCustomer(@ModelAttribute("MembersBean") MembersBean mem,HttpServletRequest request) {	
		service.addCustomer(request,mem);
		return "addCustomer";
=======

	// 轉址,未來找地方放?
	@RequestMapping(value = "/customer_register")
	public String register(Model model) {
		MembersBean mem = new MembersBean();
		model.addAttribute("MembersBean", mem);
		return "memberSystem/register";
	}

	@RequestMapping(value = "/customer_register", method = RequestMethod.POST)
	public String register_2(@ModelAttribute("MembersBean") MembersBean mem, Model model) {
		if (!service.emailExists(mem.getEmail())) {
			model.addAttribute("MembersBean", mem);
			return "memberSystem/register2";
		} else {
			String existError = "此信箱已註冊，請進行登入或以其他信箱註冊";
			model.addAttribute("existError", existError);
			return "redirect: /customer_register";
		}
	}

	@RequestMapping(value = "/reg_form")
	public String addCustomer(@ModelAttribute("MembersBean") MembersBean mem, Model model) {
		if (!service.emailExists(mem.getEmail())) {
			model.addAttribute("MembersBean", mem);
			return "/reg_complete";
		} else {
			return "redirect:register";
		}
>>>>>>> Stashed changes
	}

//轉址,未來找地方放?
	@RequestMapping(value = "/customer_register")
	public String register(Model model) {
		MembersBean mem = new MembersBean();
		model.addAttribute("MembersBean", mem);
		return "memberSystem/register";
	}

	@RequestMapping(value = "/customer_register2", method = RequestMethod.POST)
	public String register_2(@ModelAttribute("MembersBean") MembersBean mem, Model model) {
		if (!service.emailExists(mem.getEmail())) {
			model.addAttribute("MembersBean", mem);
			return "memberSystem/register2";
		} else {
			String existError = "此信箱已註冊，請進行登入或以其他信箱註冊";
			model.addAttribute("existError", existError);
			return "redirect: /customer_register";
		}
	}

	//新會員驗證信(所以此Request一開始不會拿到MemberBean)
	//view部分尚未建立
	@RequestMapping(value="/member/add/{VCode}")
	public String validationCode(@PathVariable("VCode") String VCode,Model model) {
		Boolean confirmvalidationCode=service.confirmvalidationCode(VCode);
		if(confirmvalidationCode) {
			return "memberSystem/ConfirmEmailSuccess";
		}
		return "memberSystem/ConfirmEmailCodeFail";
	}
	@RequestMapping(value="/memberSystem/ForgetPW")
	public String forgetPWPageRequest() {
		
		return "memberSystem/ForgetPWPage";
	}
	//Customer忘記密碼
	//用AJAX回傳字串，要在回傳物件前加@ResponseBody
	@PostMapping(value="/memberSystem/forgetPW")
	public @ResponseBody String forgetPWRequest(@RequestParam(value="email") String email,Model model,HttpServletRequest request) {

		service.userRequestChangePW(request,email);
		return "OK!";
	}
	//Customer點擊忘記密碼連結
	//要撈出MemberBean
	//導向修改密碼介面
	@RequestMapping(value="/member/forgetPW/{VCode}")
	public String forgetPWvalidationCode(@PathVariable("VCode") String VCode,Model model) {
		
		if(true) {
			return "validationCodeSuccess";
		}
		return "validationCodeFail";
	}
	
}
