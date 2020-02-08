package _global.config.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	//404 Page
//	@RequestMapping("/*/*")
	public String pageNoFound2(){
		return "_global/PageNoFound";
	}
	
	//轉址到後台登入畫面
	@GetMapping("/admin")
	public String directSalesManageIndex() {
		return "backendSystem/coworkerLogin";
	}
	//如果直接輸入後台網址，則跳轉到後台登入畫面
	@GetMapping(value="/backendSystem")
	public String turnintoIndex() {				
			return "backendSystem/coworkerLogin";
	}
	
	@RequestMapping(value="/customer_register")
	public String register() {				
		return "memberSystem/register";
	}
}
