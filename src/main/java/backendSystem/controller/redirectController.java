package backendSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("Mem_LoginOK")
public class redirectController {
//這裡放要被控管的轉址

	// 所有員工資料
	@GetMapping(value = "/memberSystem/allMember")
	public String AllMember(Model model) {
		return "memberSystem/allMember";
	}

	// 所有顧客資料
	@GetMapping(value = "/memberSystem/allCustomer")
	public String AllCustomer(Model model) {
		return "memberSystem/allCustomer";
	}

	// 客服系統
	@GetMapping(value = "/customerService")
	public String getChat(Model model) {
		return "messageSystem/customerService";
	}

}
