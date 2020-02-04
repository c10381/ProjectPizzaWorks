package backendSystem.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class exceptionController {
	
	@ExceptionHandler(NotLoginException.class)
	public ModelAndView handleError() {
		    System.out.println("11111111111111111111111111111");
		    return new ModelAndView("backendSystem/LogoutRedirect"); 
	}

}
