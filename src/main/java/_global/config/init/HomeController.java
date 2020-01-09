package _global.config.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public String home(){
		return "index";
	}
	
	@RequestMapping("/pageNoFound")
	public String pageNoFound(){
		return "pageNoFound";
	}
}
