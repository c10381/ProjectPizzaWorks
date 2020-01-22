package memberSystem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	// 轉址,未來找地方放? 註冊轉址
	@RequestMapping(value = "/memberSystem/customer_register", method = RequestMethod.GET)
	public String emailCheck(Model model) {
		
		if (model.getAttribute("errMsg") != null) {
			model.addAttribute("errMsg", "該信箱已註冊，請至登入畫面進行登入");
		}
		return "memberSystem/register";
	}

	// 登入轉址
	@RequestMapping(value = "/memberSystem/login", method = RequestMethod.GET)
	public String login(Model model) {
		MembersBean mem = new MembersBean();
		model.addAttribute("MembersBean", mem);
		// 登入失敗時，透過此方法取得失敗的值並將對應的訊息塞到下個畫面
		if (model.getAttribute("errMsg") != null) {
			if ((int) model.getAttribute("errMsg") == 1) {
				model.addAttribute("errMsg", "登入失敗：請至信箱透過驗證信啟動會員");
			} else if ((int) model.getAttribute("errMsg") == 2) {
				model.addAttribute("errMsg", "登入失敗：帳號或密碼錯誤請重新輸入");
			} else if ((int) model.getAttribute("errMsg") == 3) {
				model.addAttribute("errMsg", "登入失敗：帳號或密碼錯誤請重新輸入");
			}
		}
		return "memberSystem/login";
	}

	// 會員資料更新轉址
	@RequestMapping(value = "/memberSystem/infoUpdate")
	public String infoUpdate(Model model, HttpSession session) {
		
		MembersBean mem1 = (MembersBean) session.getAttribute("CLoginOK");
		if(mem1 == null) {
			return "memberSystem/login";
		}
		
		MembersBean mem = new MembersBean();
		model.addAttribute("MembersBean", mem);
		return "memberSystem/infoUpdate";
	}

	@RequestMapping(value = "/memberSystem/register", method = RequestMethod.POST)
	public String register(@RequestParam(value="email") String email,@RequestParam(value="password") String password ,Model model) {		
		if (!service.emailExists(email)) {
			MembersBean mem = new MembersBean();
			mem.setEmail(email);
			mem.setPassword(password);
			model.addAttribute("MembersBean", mem);
			return "memberSystem/register_form";
		} else {
			model.addAttribute("errMsg", "4");
			return "redirect: customer_register";
		}
	}

	@RequestMapping(value = "/memberSystem/customer_add", method = RequestMethod.POST)
	public String addCustomer(@ModelAttribute("MembersBean") MembersBean mem, HttpServletRequest request) {
		service.addCustomer(request, mem);
		return "memberSystem/register_complete";
	}

	@RequestMapping(value = "/memberSystem/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@ModelAttribute("MembersBean") MembersBean mem, Model model, HttpSession session) {

		MembersBean bean = service.login(mem.getEmail(), mem.getPassword());
		if (bean != null) {
			// 會員權限為顧客且狀態是active，會將頁面導入登入成功後的畫面並在session塞會員的資料，且會將該session的錯誤訊息清空
			if (bean.getPrivilegeId() == 1 && bean.getActiveStatus() == 3) {
				session.setAttribute("CLoginOK", bean);
				return "memberSystem/loginOK";
				// 會員權限為顧客但狀態是inactive，會將頁面重新導進登入畫面並以errMsg告知使用者到信箱收驗證信以啟動會員
			}
			if (bean.getPrivilegeId() == 1 && bean.getActiveStatus() == 1) {
				model.addAttribute("errMsg", 1);
				return "memberSystem/login";

				// 會員權限為後台管理者，會將頁面重新導入至登入畫面，並以errMsg告知使用者帳號或密碼錯誤並重新輸入
			} else {
				model.addAttribute("errMsg", 2);
				return "memberSystem/login";
			}

			// 因為bean取到空值表示根本不是會員，透過errMsg告知使用者進行註冊
		} else {
			model.addAttribute("errMsg", 3);
			return "memberSystem/login";
		}
	}

	//
	@RequestMapping(value = "/memberSystem/doupdate")
	public String doUpdate(@ModelAttribute("MembersBean") MembersBean mem, HttpSession session) {
					
		MembersBean mem1 = (MembersBean) session.getAttribute("CLoginOK");
		if(mem1 == null) {
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
	public String updPwd(Model model, HttpSession session) {
		MembersBean mem1 = (MembersBean) session.getAttribute("CLoginOK");
		if(mem1 == null) {
			return "memberSystem/login";
		}		
		return "memberSystem/updPwd";
	}

	// 修改密碼
	@RequestMapping(value = "/memberSystem/doUpdPwd")
	public String doUpdPwd(HttpSession session, @RequestParam(value = "oldPwd") String oldPwd,
			@RequestParam(value = "newPwd") String newPwd) {
		MembersBean mem = (MembersBean) session.getAttribute("CLoginOK");
		if(mem == null) {
			return "memberSystem/login";
		}
				
		if (service.updPwd(mem.getEmail(), oldPwd, newPwd)) {			
			session.setAttribute("CLoginOK", service.getCustomer(mem.getEmail()));
			return "memberSystem/updateSuccess";
		} else {
			return "memberSystem/updateFail";
		}
	}
	
	//檢視前台所有顧客
	@RequestMapping(value = "/memberSystem/allCustomer")
	public String getAllCustomers(Model model, HttpSession session) {
		MembersBean mem = (MembersBean) session.getAttribute("CLoginOK");
		if(mem == null) {
			return "memberSystem/login";
		}
		
		if(mem.getPrivilegeId()!=2) {
			return "index";
		}
		
		List<MembersBean> allCustomers = service.getAllCustomers();
		model.addAttribute("Customers", allCustomers);
		return "memberSystem/allCustomer";
	}

	// 新會員驗證信(所以此Request一開始不會拿到MemberBean)
	// 最後會拿到Bean
	@RequestMapping(value = "memberSystem/customer_add/{VCode}")
	public String validationCode(@PathVariable("VCode") String VCode, Model model) {
		MembersBean mem = service.confirmvalidationCode(VCode);
		if (mem != null) {
			model.addAttribute("MembersBean", mem);
			return "memberSystem/ConfirmEmailSuccess";
		}
		return "memberSystem/ConfirmEmailFail";
	}
	
	//忘記密碼的重設密碼轉址
	@RequestMapping(value = "memberSystem/resetPwd")
	public String resetPwd() {
		return "memberSystem/resetPwd";
	}
		
	//忘記密碼的重設密碼
	@RequestMapping(value = "memberSystem/doResetPwd")
	public String doResetPwd(@RequestParam(value = "email") String email, 
							@RequestParam(value = "newPwd") String newPwd) {
		if (service.resetPwd(email, newPwd)) {
			return "memberSystem/resetSuccess";
		} else {
			return "memberSystem/resetFail";
		}
	}

	@RequestMapping(value = "memberSystem/forgetpwd")
	public String forgetPWPageRequest() {
		return "memberSystem/forgetPWPage";
	}
	// Customer導入忘記密碼
	// 用AJAX回傳字串，要在回傳物件前加@ResponseBody
	@PostMapping(value = "/memberSystem/forgetPW")
	public @ResponseBody String forgetPWRequest(@RequestParam(value = "email") String email, Model model,
			HttpServletRequest request) {
		if (service.userRequestChangePW(request, email)) {
			return "OK!";
		}
		return "Failure";
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
