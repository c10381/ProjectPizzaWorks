package _global.config.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//index Page
	@RequestMapping("/")
	public String home(){
		return "shopSystem/index";
	}
	
	//404 Page
//	@RequestMapping("/*")
	public String pageNoFound(){
		return "_global/PageNoFound";
	}
	
	@RequestMapping("/admin")
	public String directSalesManageIndex() {
		return "backendSystem/coworkerLogin";
	}
	
	@RequestMapping(value="/customer_register")
	public String register() {				
			return "memberSystem/register";
	}

}
