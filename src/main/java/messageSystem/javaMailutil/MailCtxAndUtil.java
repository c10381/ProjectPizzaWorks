package messageSystem.javaMailutil;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;

import _model.MembersBean;


public class MailCtxAndUtil {
	public String UserName= SpringMailConfig.MAILUsername;
	String Context="";

	//新會員註冊的確認信
	//待改
	public String ConfirmationMailContext(HttpServletRequest request,MembersBean mem,String CustomerConfirmURL){
		Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，"+mem.getLastName()+mem.getFirstName()+"您好</h3><br><p>感謝您在"+"Pizza"+"上申請了新的帳號，開始訂購美味的Pizza前，我們需要確認是您本人申請此帳號，</p><br>"
						+ "<p>請點擊下方連結以驗證此信箱</p><br><p>"
				+request.getRequestURL()+"/"+CustomerConfirmURL+"</p><br>"
				+ "<p>若不是您本人申請，請忽視本信件</p></body></html>";
		//controller的路徑要設定為"@RequestMapping(value="/member/add/{VCode}")",method的參數要為(@PathVariable("VCode") String VCode,Model model)
		return Context;
	}
	//測試用
	public String ConfirmationMailContextForTest(String CustomerConfirmURL){
		Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，會員您好</h3><br><p>您的確認連結如下：</p><p>"
				+"http://localhost:8080/member/add/"+CustomerConfirmURL+"</p></body></html>";
		
		return Context;
	}
	//前台會員忘記密碼
	public String CustomerForgetPW(HttpServletRequest request,MembersBean mem,String CustomerConfirmURL) {
		Context="<html><head><meta charset='utf-8'></head>"
				+ "<body><h3>嗨，"+mem.getFirstName()+"您好</h3><br><p>忘記密碼了嗎？為此我們需要確認您的電子信箱，請點擊以下方連結以驗證您的信箱：</p><p><br>"
				+request.getRequestURL()+"/"+CustomerConfirmURL+"</p></body></html>";
		
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
