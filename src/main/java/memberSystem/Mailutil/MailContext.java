package memberSystem.Mailutil;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MailContext {
	@Bean
	public String ConfirmationMailContext(String CustomerConfirmURL){
		String Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，會員您好</h3><br><p>您的確認連結如下：</p><p>www.google.com/"+CustomerConfirmURL+"</p></body></html>";
		return Context;
	}
}
