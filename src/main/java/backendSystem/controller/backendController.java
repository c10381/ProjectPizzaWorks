package backendSystem.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.MembersBean;
import memberSystem.service.CustomerService;


@Controller
@SessionAttributes("Mem_LoginOK")
public class backendController {
	
	private CustomerService customerservice;

	@Autowired
	public void setService(CustomerService customerservice) {
		this.customerservice = customerservice;
	}

	// 驗證密碼
	// 驗證成功進入後端頁面
	// 驗證失敗重新導入此頁面,並顯示錯誤訊息
	@PostMapping("/backendSystem/loginCheck")
	public String Login(@RequestParam("email") String email,@RequestParam("password") String password, Model model, HttpServletResponse response) {
		System.out.println(email);
		System.out.println(password);
		
		if(email==null||password==null) {
			return "backendSystem/coworkerLogin";
		}
		MembersBean bean =customerservice.login(email,password);
		if (bean!=null) {
			if(bean.getPrivilegeId() ==1) {
				model.addAttribute("errorMessage","此帳號不存在，請重新輸入！");
				return "backendSystem/coworkerLogin";
			}if(bean.getActiveStatus() !=3) {
				model.addAttribute("errorMessage","帳號尚未通過驗證，請於信箱透過驗證信進行驗證！");
				return "backendSystem/coworkerLogin";
			}else {
			model.addAttribute("Mem_LoginOK",bean);			
			return "backendSystem/backendIndex";
			}
		}else {
			model.addAttribute("errorMessage","此帳號不存在，請進行註冊或重新輸入！");
			return "backendSystem/coworkerLogin";
		}
		
		
	}
}
