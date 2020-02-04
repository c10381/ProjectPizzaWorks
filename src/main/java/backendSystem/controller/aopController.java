package backendSystem.controller;

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

	@Around("execution(* redirectController.*(..))")
	public Object before(ProceedingJoinPoint pjp)throws Throwable{
		//System.out.println("AAAAAAAAAAAA");
		//request.getSession().invalidate();
		try {
//			pjp.proceed();
			MembersBean mem = (MembersBean) session.getAttribute("Mem_LoginOK");
			System.out.println(mem.getEmail() + "已確認登入");
			return pjp.proceed();
		} catch (Exception e) {
			throw new NotLoginException();
		}
	}
}
