package backendSystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _model.MembersBean;
import backendSystem.exception.NotLoginException;

@Aspect
@Component
public class aopController {

	@Autowired
	private HttpSession session;
	@Autowired
	private HttpServletRequest request;
	//測試AOP是否作用，目前放在messageSystem、stockSystem、purchaseSystem、StatisticalAnalysis都是正常執行
//	@Around("execution(* redirectController.*(..)) or execution(* ProjectPizzaWorks.messageSystem..*.*(..)) or execution(* ProjectPizzaWorks.stockSystem..*.*(..)) or execution(* ProjectPizzaWorks.purchaseSystem..*.*(..)) or execution(* ProjectPizzaWorks.StatisticalAnalysis..*.*(..))")
	@Around("execution(* redirectController.*(..))")
	public Object before(ProceedingJoinPoint pjp)throws Throwable{
//		System.out.println("AAAAAAAAAAAA");
//		request.getSession().invalidate();
		try {
			MembersBean mem = (MembersBean) session.getAttribute("Mem_LoginOK");
			System.out.println(mem.getEmail() + "有經過AOP，已確認登入");
			return pjp.proceed();
		} catch (Exception e) {
			throw new NotLoginException();
		}
		
	}
}
