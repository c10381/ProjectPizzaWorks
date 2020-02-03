package backendSystem.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class aopController {
	
	
	@Before("execution(* redirectController.*(..))")
	public void before(JoinPoint joinPoint) {
		System.out.println("AAAAAAAAAAAA");
	}
}
