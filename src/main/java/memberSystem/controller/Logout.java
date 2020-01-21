package memberSystem.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.support.SessionStatus;

//純粹的Logout檔案，不能加@SessionAttributes("Mem_LoginOK")
//不然Session不會被清掉喔～
@Controller
public class Logout {
	
	//Logout,clean Spring session & HttpSession
	@GetMapping(value = {"/logout"})
	public String logout(HttpServletRequest request, SessionStatus session){
	    session.setComplete();
	    request.getSession().invalidate();
	    return "backendSystem/coworkerLogin";
	}
	
}
