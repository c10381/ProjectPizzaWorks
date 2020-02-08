package backendSystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
//@SessionAttributes("Mem_LoginOK")
public class redirectController {
//這裡放要被控管的轉址

	// 所有員工資料
	@GetMapping(value = "/memberSystem/allMember")
	public String AllMember() {
		return "memberSystem/allMember";
	}

	// 所有顧客資料
	@GetMapping(value = "/memberSystem/allCustomer")
	public String AllCustomer() {
		return "memberSystem/allCustomer";
	}

	// 客服系統
	@GetMapping(value = "/customerService")
	public String getChat() {
		return "messageSystem/customerService";
	}

}
