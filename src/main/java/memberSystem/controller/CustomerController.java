package memberSystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import _model.MembersBean;
import memberSystem.service.CustomerService;

@Controller
@SessionAttributes("CLoginOK")
public class CustomerController {

	private CustomerService service;

	@Autowired
	public void setService(CustomerService service) {
		this.service = service;
	}

	//註冊轉址
	@GetMapping(value = "/memberSystem/register")
	public String register(Model model) {
		//return jsp 名稱
		return "memberSystem/register";
	}

	// 登入轉址
	@RequestMapping(value = "/memberSystem/login")
	public String login(Model model) {
		return "memberSystem/login";
	}

	// 會員資料更新轉址
	@RequestMapping(value = "/memberSystem/infoUpdate")
	public String infoUpdate(Model model) {

		MembersBean mem = (MembersBean) model.getAttribute("CLoginOK");
		if (mem == null) {
			model.addAttribute("email_errMsg","請進行登入！");
			return "memberSystem/login";
		}else {
			model.addAttribute("MembersBean", new MembersBean());
			return "memberSystem/infoUpdate";
		}		
	}
	
	//前端註冊信箱檢查按鈕判定
	@RequestMapping(value = "/memberSystem/emailChecker", method=RequestMethod.POST)
	@ResponseBody
	public boolean emailChecker(@RequestParam("email")String email) {		
		boolean emailChecker=false;
		if(!service.emailExists(email)) {
			return emailChecker;
		}else {
			emailChecker = true;
			return emailChecker;
		}		
	}
		
	//將註冊的信箱及密碼傳到下個頁面
	@RequestMapping(value = "/memberSystem/register_form", method = RequestMethod.POST)
	public String register_form(@RequestParam(value = "email") String email, 
						   @RequestParam(value = "password") String password, Model model) {		
			MembersBean mem = new MembersBean();
			mem.setEmail(email);
			mem.setPassword(password);
			model.addAttribute("MembersBean",mem);
			return "memberSystem/register_form";
	}
	
	//將頁面導入註冊成功畫面
	@RequestMapping(value = "/memberSystem/submitForm", method = RequestMethod.POST)
	public String submitForm(@ModelAttribute("MembersBean") MembersBean mem, HttpServletRequest request) {
		service.addCustomer(request, mem);
		return "memberSystem/register_complete";
	}
	
	//登入審核
	@RequestMapping(value = "/memberSystem/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@ModelAttribute("MembersBean") MembersBean mem, Model model, HttpSession session) {

		MembersBean bean = service.login(mem.getEmail(), mem.getPassword());
		if (bean != null) {
		//帳密輸入正確	
		//由bean是否為null判斷使用者輸入的帳號密碼是否有效	
			if (bean.getPrivilegeId() == 1 && bean.getActiveStatus() == 3) {
				// 會員權限為顧客且狀態是active，會將頁面導入登入成功後的畫面並在session塞會員的資料，且會將該session的錯誤訊息清空
				session.setAttribute("CLoginOK", bean);
				return "redirect:/";				
			}
			if (bean.getPrivilegeId() == 1 && bean.getActiveStatus() == 1) {
				// 會員權限為顧客但狀態是inactive，會將頁面重新導進登入畫面並以errMsg告知使用者到信箱收驗證信以啟動會員
				model.addAttribute("email_errMsg","請先開通會員!");
				return "memberSystem/login";				
			} else {
				// 會員權限為後台管理者，會將頁面重新導入至登入畫面，並以errMsg告知使用者帳號或密碼錯誤並重新輸入
				model.addAttribute("email_errMsg","帳號或密碼錯誤!");
				return "memberSystem/login";
			}			
		} else {
		//帳號 或 密碼 輸入不正確	
			if(service.emailExists(mem.getEmail())){
				//用帳號是否存在DB來判斷是否有註冊過，若有，則告知使用者密碼錯誤
				model.addAttribute("email_errMsg","");
				model.addAttribute("pwd_errMsg", "密碼錯誤");
			}else {
				// 用帳號是否存在DB來判斷是否有註冊過，若無，則告知使用者輸入的帳號根本沒註冊過
				model.addAttribute("email_errMsg","無此帳號");
				model.addAttribute("pwd_errMsg","");
			}			
			return "memberSystem/login";
		}
	}

	//會員資料更新
	@RequestMapping(value = "/memberSystem/doupdate")
	public String doUpdate(@ModelAttribute("MembersBean") MembersBean mem, Model model) {
		
		MembersBean mem1 = (MembersBean) model.getAttribute("CLoginOK");
		if (mem1 == null) {
			model.addAttribute("email_errMsg", "請先進行登入！");
			return "memberSystem/login";
		}
		mem1.setCellphone(mem.getCellphone());
		mem1.setAddress(mem.getAddress());
		if (service.updateInfo(mem1)) {
			return "memberSystem/updateSuccess";
		} else {
			return "memberSystem/updateFail";
		}
	}

	// 修改密碼轉址
	@RequestMapping(value = "/memberSystem/updPwd")
	public String updPwd(Model model) {
		MembersBean mem = (MembersBean) model.getAttribute("CLoginOK");
		if (mem == null) {
			return "memberSystem/login";
		}
		return "memberSystem/updPwd";
	}
	
	//前端修改密碼的舊密碼判定
	@RequestMapping(value = "/memberSystem/oldPwdChecker", method=RequestMethod.POST)
	@ResponseBody
	public boolean oldPwdChecker(@RequestParam("oldPwd")String pwd, Model model) {		
		MembersBean mem = (MembersBean) model.getAttribute("CLoginOK");
		boolean pwdChecker=false;
		if(service.pwdChecker(mem.getEmail(), pwd)) {
			pwdChecker = true;
			return pwdChecker;
		}else {			
			return pwdChecker;
		}		
	}

	// 修改密碼
	@RequestMapping(value = "/memberSystem/doUpdPwd")
	public String doUpdPwd(HttpSession session, @RequestParam(value = "oldPwd") String oldPwd,
			@RequestParam(value = "newPwd") String newPwd, Model model) {
		MembersBean mem = (MembersBean) model.getAttribute("CLoginOK");
		if (mem == null) {
			model.addAttribute("email_errMsg","請先進行登入！");
			return "memberSystem/login";
		}

		if (service.updPwd(mem.getEmail(), oldPwd, newPwd)) {
			MembersBean Members = service.getCustomer(mem.getEmail());
			if (Members == null) {
				return "memberSystem/updateFail";
			}
			session.setAttribute("CLoginOK", Members);
			return "memberSystem/updateSuccess";
		} else {
			return "memberSystem/updateFail";
		}
	}

	// 新會員驗證信(所以此Request一開始不會拿到MemberBean)
	// 最後會拿到Bean
	@RequestMapping(value = "memberSystem/submitForm/{VCode}")
	public String validationCode(@PathVariable("VCode") String VCode, Model model) {
		MembersBean mem = service.confirmvalidationCode(VCode);
		if (mem != null) {
			model.addAttribute("MembersBean", mem);
			return "memberSystem/ConfirmEmailSuccess";
		}
		return "memberSystem/ConfirmEmailFail";
	}

	// 忘記密碼的重設密碼轉址
	@RequestMapping(value = "memberSystem/resetPwd")
	public String resetPwd() {
		return "memberSystem/resetPwd";
	}

	// 忘記密碼的重設密碼動作
	@RequestMapping(value = "memberSystem/doResetPwd")
	public String doResetPwd(@RequestParam(value = "email") String email,
			@RequestParam(value = "newPwd") String newPwd) {
		if (service.resetPwd(email, newPwd)) {
			return "memberSystem/login";
		} else {
			return "memberSystem/resetFail";
		}
	}
	//忘記密碼頁面，但是他不動耶
	@GetMapping(value = "/memberSystem/forgetpwd")
	public String forgetPWPageRequest() {
		return "memberSystem/forgetPWPage";
	}

	// Customer導入忘記密碼
	// 用AJAX回傳字串，要在回傳物件前加@ResponseBody	
	@PostMapping(value = "/memberSystem/forgetPW")
	public @ResponseBody boolean forgetPWRequest(@RequestParam(value = "email") String email, Model model,
			HttpServletRequest request) {
		boolean status = false;
		if (service.userRequestChangePW(request, email)) {
			status = true;
			return status;
		}
		return status;
	}

	// Customer點擊忘記密碼連結
	// 要撈出MemberBean
	// 導向修改密碼介面
	@RequestMapping(value = "/memberSystem/forgetPW/{VCode}")
	public String forgetPWvalidationCode(@PathVariable("VCode") String VCode, Model model) {
		MembersBean mem = service.confirmvalidationCode(VCode);
		if (mem != null) {
			model.addAttribute("email", mem.getEmail());
			return "memberSystem/resetPwd";
		}
		return "memberSystem/validationCodeFail";
	}	
}
