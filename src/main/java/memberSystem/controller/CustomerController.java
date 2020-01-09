package memberSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	  
	@RequestMapping(method=RequestMethod.POST)
	public String addCustomer(MembersBean mem) {
		
		service.addCustomer(mem);
		
		return "addCustomer";
	}
	
	

}
