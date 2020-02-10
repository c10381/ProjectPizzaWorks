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
		Context="<div>" + 
				"    <div style='padding:0;margin:0 auto;font-size:14px;font-family:arial'>" + 
				"        <table border='0' cellpadding='0' cellspacing='0' width='100%' align='center'" + 
				"            style=\"margin:0 auto;padding:0;max-width:612px;background: black;\">" + 
				"            <tbody>" + 
				"                <tr>" + 
				"                    <!-- Header -->" + 
				"                    <td align='center' valign='top'>" + 
				"                        <table border='0' cellpadding='0' cellspacing='0' style='margin:0;padding:0;width:100%;background:#121619'>" + 
				"                            <tbody>" + 
				"                                <tr>" + 
				"                                    <td style='width:30%;padding:0 20px'>" + 
				"                                        <!-- 放Header的圖片 -->" + 
				"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='pizza bite'>" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 會員名稱 及 問候語 -->" + 
				"                    <td style='padding:30px 0 20px 20px;color: #D1B96D;'><span id='memberName'>"+mem.getFirstName()+"</span>您好：</td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 信件的下半部文字內容 -->" + 
				"                    <td style='padding:0 20px 20px;color: #D1B96D;'>感謝您在Pizza" + 
				"                        Bite上申請了新的帳號！<br>開始訂購美味的Pizza前，我們需要確認是您本人申請此帳號，<br>請點擊下方按鈕以驗證此信箱</td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <td style='padding:0'>" + 
				"                        <!-- 驗證連結按鈕後的table -->" + 
				"                        <table border='0' cellpadding='0' width='100%' cellspacing='0'" + 
				"                            style='margin:0;padding:0;max-width:612px;border:1px solidcolor:#5f5f5f'>" + 
				"                            <tbody>" + 
				"                                <tr >" + 
				"                                    <td style='text-align:center;vertical-align:top;font-size:0;padding:15px 0'>" + 
				"                                        <div style='width:100%;vertical-align:top'>" + 
				"                                            <table width='50%' align='center' style='text-align:center;margin:0 auto'>" + 
				"                                                <tbody>" + 
				"                                                    <tr>" + 
				"                                                        <!-- 驗證連結按鈕 (修改href) -->" + 
				"                                                        <td align='center' style='background:#D1B96D;padding:13px 0'>" + 
				"                                                            <!-- -->" + 
				"                                                            <a href=\'"+request.getRequestURL()+"/"+CustomerConfirmURL+"\'" + 
				"                                                                style='text-decoration:none;color:#fff;font-size:20px;font-weight:bold;display:block;text-align:center'" + 
				"                                                                target='_blank'><span" + 
				"                                                                    id='button_validation'>驗證電子郵件地址</span></strong></a>" + 
				"                                                        </td>" + 
				"                                                    </tr>" + 
				"                                                </tbody>" + 
				"                                            </table>" + 
				"                                        </div>" + 
				"                                        <!-- 按鈕下方文字 -->" + 
				"                                        <div" + 
				"                                            style='width:100%;vertical-align:middle;padding-top:10px;text-align:center'>" + 
				"                                            <table width='100%' align='center'>" + 
				"                                                <tbody>" + 
				"                                                    <tr>" + 
				"                                                        <td style='font-size:13px;vertical-align:middle;color:#fff;'" + 
				"                                                            align='center'>連結將在 24 小時後失效。如果按鈕已過期，請重新申請帳號" + 
				"                                                        </td>" + 
				"                                                    </tr>" + 
				"                                                </tbody>" + 
				"                                            </table>" + 
				"                                        </div>" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 信件的下半部文字內容 -->" + 
				"                    <td style='padding:20px 20px 0;color: #D1B96D;'>" + 
				"                        我們收到請求，要求使用您的電子郵件地址建立Pizza Bite帳戶。<br>若您並未提出此要求，請忽略此信件。" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                     <!-- 信件結尾語 -->" + 
				"                    <td style='padding:16px 20px 25px;color: #D1B96D;'>謝謝您！<br>Pizza Bite 祝您順心" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 最下排(footer) -->" + 
				"                    <td>" + 
				"                        <table border='0' cellpadding='0' cellspacing='0'" + 
				"                            style='margin:0;padding:0;width:100%;background:#121619'>" + 
				"                            <tbody>" + 
				"                                <tr>" + 
				"                                    <!-- 最下排的圖 -->" + 
				"                                    <td style='width:25%;padding-bottom:10px'>" + 
				"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='Pizza Bite logo'></td>" + 
				"                                    <!-- Copyright? -->" + 
				"                                    <td valign='bottom' style='width:50%;font-size:12px;padding-bottom:10px;color: #D1B96D;'>Copyright @ 2020，Pizza Bite" + 
				"                                            保留所有權利。" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"            </tbody>" + 
				"        </table>" + 
				"    </div>" + 
				"</div>";
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
		
		Context="<div>" + 
				"    <div style='padding:0;margin:0 auto;font-size:14px;font-family:arial'>" + 
				"        <table border='0' cellpadding='0' cellspacing='0' width='100%' align='center'" + 
				"            style=\"margin:0 auto;padding:0;max-width:612px;background: black;\">" + 
				"            <tbody>" + 
				"                <tr>" + 
				"                    <!-- Header -->" + 
				"                    <td align='center' valign='top'>" + 
				"                        <table border='0' cellpadding='0' cellspacing='0' style='margin:0;padding:0;width:100%;background:#121619'>" + 
				"                            <tbody>" + 
				"                                <tr>" + 
				"                                    <td style='width:30%;padding:0 20px'>" + 
				"                                        <!-- 放Header的圖片 -->" + 
				"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='pizza bite'>" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 會員名稱 及 問候語 -->" + 
				"                    <td style='padding:30px 0 20px 20px;color: #D1B96D;'><span id='memberName'>"+mem.getFirstName()+"</span>您好：</td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 信件的下半部文字內容 -->" + 
				"                    <td style='padding:0 20px 20px;color: #D1B96D;'>忘記密碼了嗎？" + 
				"                        <br>開始訂購美味的Pizza前，我們需要確認您的電子信箱，<br>請點擊下方按鈕以驗證此信箱</td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <td style='padding:0'>" + 
				"                        <!-- 驗證連結按鈕後的table -->" + 
				"                        <table border='0' cellpadding='0' width='100%' cellspacing='0'" + 
				"                            style='margin:0;padding:0;max-width:612px;border:1px solidcolor:#5f5f5f'>" + 
				"                            <tbody>" + 
				"                                <tr >" + 
				"                                    <td style='text-align:center;vertical-align:top;font-size:0;padding:15px 0'>" + 
				"                                        <div style='width:100%;vertical-align:top'>" + 
				"                                            <table width='50%' align='center' style='text-align:center;margin:0 auto'>" + 
				"                                                <tbody>" + 
				"                                                    <tr>" + 
				"                                                        <!-- 驗證連結按鈕 (修改href) -->" + 
				"                                                        <td align='center' style='background:#D1B96D;padding:13px 0'>" + 
				"                                                            <!-- -->" + 
				"                                                            <a href=\'"+request.getRequestURL()+"/"+CustomerConfirmURL+"\'" + 
				"                                                                style='text-decoration:none;color:#fff;font-size:20px;font-weight:bold;display:block;text-align:center'" + 
				"                                                                target='_blank'><span" + 
				"                                                                    id='button_validation'>驗證電子郵件地址</span></strong></a>" + 
				"                                                        </td>" + 
				"                                                    </tr>" + 
				"                                                </tbody>" + 
				"                                            </table>" + 
				"                                        </div>" + 
				"                                        <!-- 按鈕下方文字 -->" + 
				"                                        <div" + 
				"                                            style='width:100%;vertical-align:middle;padding-top:10px;text-align:center'>" + 
				"                                            <table width='100%' align='center'>" + 
				"                                                <tbody>" + 
				"                                                    <tr>" + 
				"                                                        <td style='font-size:13px;vertical-align:middle;color:#fff;'" + 
				"                                                            align='center'>連結將在 24 小時後失效。如果按鈕已過期，請重新申請" + 
				"                                                        </td>" + 
				"                                                    </tr>" + 
				"                                                </tbody>" + 
				"                                            </table>" + 
				"                                        </div>" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 信件的下半部文字內容 -->" + 
				"                    <td style='padding:20px 20px 0;color: #D1B96D;'>" + 
				"                        我們收到請求，要求使用您的電子郵件地址確認Pizza Bite帳戶。<br>若您並未提出此要求，請忽略此信件。" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                     <!-- 信件結尾語 -->" + 
				"                    <td style='padding:16px 20px 25px;color: #D1B96D;'>謝謝您！<br>Pizza Bite 祝您順心" + 
				"                    </td>" + 
				"                </tr>" + 
				"                <tr>" + 
				"                    <!-- 最下排(footer) -->" + 
				"                    <td>" + 
				"                        <table border='0' cellpadding='0' cellspacing='0'" + 
				"                            style='margin:0;padding:0;width:100%;background:#121619'>" + 
				"                            <tbody>" + 
				"                                <tr>" + 
				"                                    <!-- 最下排的圖 -->" + 
				"                                    <td style='width:25%;padding-bottom:10px'>" + 
				"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='Pizza Bite logo'></td>" + 
				"                                    <!-- Copyright? -->" + 
				"                                    <td valign='bottom' style='width:50%;font-size:12px;padding-bottom:10px;color: #D1B96D;'>Copyright @ 2020，Pizza Bite" + 
				"                                            保留所有權利。" + 
				"                                    </td>" + 
				"                                </tr>" + 
				"                            </tbody>" + 
				"                        </table>" + 
				"                    </td>" + 
				"                </tr>" + 
				"            </tbody>" + 
				"        </table>" + 
				"    </div>" + 
				"</div>";
		
		return Context;
	}
	
	//促銷信(要修啊～～)
		public String ToCustomerSales(HttpServletRequest request,String Context) {

			Context="<div>" + 
					"    <div style='padding:0;margin:0 auto;font-size:14px;font-family:arial'>" + 
					"        <table border='0' cellpadding='0' cellspacing='0' width='100%' align='center'" + 
					"            style=\"margin:0 auto;padding:0;max-width:612px;background: black;\">" + 
					"            <tbody>" + 
					"                <tr>" + 
					"                    <!-- Header -->" + 
					"                    <td align='center' valign='top'>" + 
					"                        <table border='0' cellpadding='0' cellspacing='0' style='margin:0;padding:0;width:100%;background:#121619'>" + 
					"                            <tbody>" + 
					"                                <tr>" + 
					"                                    <td style='width:30%;padding:0 20px'>" + 
					"                                        <!-- 放Header的圖片 -->" + 
					"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='pizza bite'>" + 
					"                                    </td>" + 
					"                                </tr>" + 
					"                            </tbody>" + 
					"                        </table>" + 
					"                    </td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                    <!-- 會員名稱 及 問候語 -->" + 
					"                    <td style='padding:30px 0 20px 20px;color: #D1B96D;'><span id='memberName'></span>您好：</td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                    <!-- 信件的下半部文字內容 -->" + 
					"                    <td style='padding:0 20px 20px;color: #D1B96D;'>在辛勤的工作後，" + 
					"                        <br>是不是想吃片熱騰騰的Pizza呢？<br>Pizza Bite在此誠心跟您推薦以下新口味：</td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                    <td style='padding:0'>" + 
					"                        <!-- 驗證連結按鈕後的table -->" + 
					"                        <table border='0' cellpadding='0' width='100%' cellspacing='0'" + 
					"                            style='margin:0;padding:0;max-width:612px;border:1px solidcolor:#5f5f5f'>" + 
					"                            <tbody>" + 
					"                                <tr >" + 
					"                                    <td style='text-align:center;vertical-align:top;font-size:0;padding:15px 0'>" + 
					"                                        <div style='width:100%;vertical-align:top'>" + 
					"                                            <table width='50%' align='center' style='text-align:center;margin:0 auto'>" + 
					"                                                <tbody>" + 
					"                                                    <tr>" + 
					"                                                        <!-- 驗證連結按鈕 (修改href) -->" + 
					"                                                        <td align='center' style='background:#D1B96D;padding:13px 0'>" + 
					"                                                            <!-- -->" + 
																				Context+
					"                                                        </td>" + 
					"                                                    </tr>" + 
					"                                                </tbody>" + 
					"                                            </table>" + 
					"                                        </div>" + 
					"                                    </td>" + 
					"                                </tr>" + 
					"                            </tbody>" + 
					"                        </table>" + 
					"                    </td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                    <!-- 信件的下半部文字內容 -->" + 
					"                    <td style='padding:20px 20px 0;color: #D1B96D;'>" + 
					"                        期待您與Pizza的再次相會，<br>我們隨時等待您的訂購！" + 
					"                    </td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                     <!-- 信件結尾語 -->" + 
					"                    <td style='padding:16px 20px 25px;color: #D1B96D;'>謝謝您！<br>Pizza Bite 祝您順心" + 
					"                    </td>" + 
					"                </tr>" + 
					"                <tr>" + 
					"                    <!-- 最下排(footer) -->" + 
					"                    <td>" + 
					"                        <table border='0' cellpadding='0' cellspacing='0'" + 
					"                            style='margin:0;padding:0;width:100%;background:#121619'>" + 
					"                            <tbody>" + 
					"                                <tr>" + 
					"                                    <!-- 最下排的圖 -->" + 
					"                                    <td style='width:25%;padding-bottom:10px'>" + 
					"                                        <img src='https://i.imgur.com/bqbn9w7.png' alt='Pizza Bite logo'></td>" + 
					"                                    <!-- Copyright? -->" + 
					"                                    <td valign='bottom' style='width:50%;font-size:12px;padding-bottom:10px;color: #D1B96D;'>Copyright @ 2020，Pizza Bite" + 
					"                                            保留所有權利。" + 
					"                                    </td>" + 
					"                                </tr>" + 
					"                            </tbody>" + 
					"                        </table>" + 
					"                    </td>" + 
					"                </tr>" + 
					"            </tbody>" + 
					"        </table>" + 
					"    </div>" + 
					"</div>";
			
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
