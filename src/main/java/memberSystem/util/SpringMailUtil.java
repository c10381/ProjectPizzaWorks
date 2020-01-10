package memberSystem.util;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class SpringMailUtil {
	
	private JavaMailSenderImpl mailSender;

//	public JavaMailSender getMailSender() {
//		return mailSender;
//	}
	@Autowired
	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public boolean sendMail(String from, String to, String subject, String msg) {
		boolean state=false;
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(from);
			helper.setTo(to);
			helper.setSubject(subject);
			helper.setText(msg,true);//啟用HTML Tag

		} catch (MessagingException e) {
			System.out.println(e.getStackTrace());
			return state;
		}
		mailSender.send(message);
		state=true;
		return state;
	}
	
	//要弄一個Condfig
//	@Configuration
//	public class SpringMailConfig{
//		@Bean
//		public JavaMailSenderImpl mailSender() {
//			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//			mailSender.setHost("smtp.office365.com");	//使用outlook
			//mailSender.setHost("smtp.gmail.com");	//使用gmail
//			mailSender.setPort(587);
//
//			mailSender.setUsername("EMAIL");
//			mailSender.setPassword("Password");
//
//			Properties props = mailSender.getJavaMailProperties();
//			props.put("mail.transport.protocol", "smtp");
//			props.put("mail.smtp.auth", "true");
//			props.put("mail.smtp.starttls.enable", "true");
//			props.put("mail.debug", "true");
//
//			return mailSender;
//		}
//	}
	//Running
//	public static void main(String[] args) {
//		ApplicationContext context= new AnnotationConfigApplicationContext(SpringMailConfig.class);
//		SpringMailUtil ms = (SpringMailUtil)context.getBean("mailSend",SpringMailUtil.class);
//		ms.sendMail("From","To" , "Subtitle", "Context");
//	}
}
