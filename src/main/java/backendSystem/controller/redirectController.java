package backendSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import _model.MembersBean;

@Controller
public class redirectController {

	// 轉址(Index，之後會有MemberBean)
	@RequestMapping("/backendSystem/adminIndex")
	public String LoginSuccessful() {
		return "backendSystem/backendIndex";
	}

	// 轉址(navbar)
	@GetMapping(value = "/backendSystem/navbar")
	public String navbar() {
		return "backendSystem/navbar";
	}

	// 轉址(sidebar,判斷權限)
	@GetMapping(value = "/backendSystem/sidebar")
	public String sidebarSelect() {
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
