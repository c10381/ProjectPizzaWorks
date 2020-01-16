package backendSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.MembersBean;

@Controller
@SessionAttributes("Mem_LoginOK")
public class redirectController {
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
//		if(mem.getPrivilegeId()==2) {
//			return "backendSystem/sideBar_webAdmin";
//		}else if(mem.getPrivilegeId()==3) {
//			return "backendSystem/sideBar_salesManger";
//		}else if(mem.getPrivilegeId()==4) {
//			return "backendSystem/sideBar_purchaseManger";
//		}else if(mem.getPrivilegeId()==5) {
//			return "backendSystem/sideBar_stockManger";
//		}else if(mem.getPrivilegeId()==6) {
//			return "backendSystem/sideBar_customerService";
//		}else if(mem.getPrivilegeId()==7) {
//			return "backendSystem/sideBar_admin";
//		}
		return "backendSystem/sideBar/sideBar_admin";
	}
}
