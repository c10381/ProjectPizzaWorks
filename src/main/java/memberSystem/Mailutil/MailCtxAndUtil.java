package memberSystem.Mailutil;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;


//@Configuration
public class MailCtxAndUtil {
	String Context="";
//	@Bean
	//新會員註冊的確認信
	public String ConfirmationMailContext(HttpServletRequest request,String CustomerConfirmURL){
		Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，會員您好</h3><br><p>您的確認連結如下：</p><p>"
				+request.getRequestURL()+"/"+CustomerConfirmURL+"</p></body></html>";
		//controller的路徑要設定為"@RequestMapping(value="/member/add/{VCode}")",method的參數要為(@PathVariable("VCode") String VCode,Model model)
		return Context;
	}
	//
	public String ConfirmationMailContextForTest(String CustomerConfirmURL){
		Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，會員您好</h3><br><p>您的確認連結如下：</p><p>"
				+"http://localhost:8080/member/add/"+CustomerConfirmURL+"</p></body></html>";
		
		return Context;
	}
	//前台會員忘記密碼
	public String CustomerForgetPW(String CustomerConfirmURL) {
		Context="";
		
		return Context;
	}
	//亂數產生8位數網址列
	public String RandomvalidationCode() {
		String[] charArray= {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
		"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
		"1","2","3","4","5","6","7","8","9","0"};
		for(int i=0;i<8;i++) {
			Context += charArray[Math.abs(ThreadLocalRandom.current().nextInt(charArray.length-1))];
		}
		return Context;
	}
}
