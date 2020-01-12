package memberSystem.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value="/member/add/{VCode}")
	public String validationCode(@PathVariable("VCode") String VCode,Model model) {
		Boolean confirmvalidationCode=service.confirmvalidationCode(VCode);
		if(confirmvalidationCode) {
			return "validationCodeSuccess";
		}
		
		return "validationCodeFail";
	}
}
