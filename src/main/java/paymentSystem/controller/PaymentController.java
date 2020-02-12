package paymentSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import _model.OrderDetailBean;

@Controller
//@SessionAttributes("CLoginOK")
public class PaymentController {
	
	private PaymentServices service;
	
	@Autowired
	public void setService(PaymentServices service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/PaypalTest/testCheckout")
	public String testPaypalCheckout(Model model) {
//		model.addAttribute("orderDetailBean", new OrderDetailBean());
		return"PaypalTest/testCheckout";
	}
	
	@RequestMapping(value = "/PaypalTest/testAuthorize_Payment")
	public String testAuthorize_Payment (Model model) {
		return"PaypalTest/testAuthorize_Payment";
	}
	
	@RequestMapping(value = "/PaypalTest/testReview_Payment")
	public String testReview_Payment(@RequestParam("paymentId") String paymentId,
			 @RequestParam("PayerID") String payerID, Model model) {
		try {           
            Payment payment = service.getPaymentDetails(paymentId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
             
            model.addAttribute("payer", payerInfo);
            model.addAttribute("transaction", transaction);
            model.addAttribute("shippingAddress", shippingAddress);
            model.addAttribute("paymentId",paymentId);
            model.addAttribute("PayerID",payerID);
            return"PaypalTest/testReview_Payment"; 
            //request.getRequestDispatcher(url).forward(request, response);
             
        } catch (PayPalRESTException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            //request.getRequestDispatcher("error.jsp").forward(request, response);
            return"PaypalTest/paypalError";           		
        }
	}
	
	@RequestMapping(value = "/PaypalTest/execute_Payment")
	public String testExecute_Payment(@RequestParam("paymentId") String paymentId, 
			  @RequestParam("PayerID") String payerID, Model model) {		
		try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerID);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            model.addAttribute("payer",payerInfo);
            model.addAttribute("transaction",transaction);
            return"PaypalTest/testReceipt";
            //request.setAttribute("payer", payerInfo);
            //request.setAttribute("transaction", transaction);           
            //request.getRequestDispatcher("receipt.jsp").forward(request, response);
             
        } catch (PayPalRESTException ex) {
        	model.addAttribute("errorMessage",ex.getMessage());
            //request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            return"PaypalTest/paypalError";
            //request.getRequestDispatcher("error.jsp").forward(request, response);
        }
	}
	
//	@RequestMapping(value = "/PaypalTest/execute_Payment")
//	public String execute_Payment(@RequestParam("paymentId") String paymentId, 
//								  @RequestParam("PayerID") String payerID, Model model) {
//		try {
//            PaymentServices paymentServices = new PaymentServices();
//            Payment payment = paymentServices.executePayment(paymentId, payerID);
//             
//            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
//            Transaction transaction = payment.getTransactions().get(0);
//            model.addAttribute("payer",payerInfo);
//            model.addAttribute("transaction",transaction);
//            return"PaypalTest/testReceipt";
//            //request.setAttribute("payer", payerInfo);
//            //request.setAttribute("transaction", transaction);           
//            //request.getRequestDispatcher("receipt.jsp").forward(request, response);
//             
//        } catch (PayPalRESTException ex) {
//        	model.addAttribute("errorMessage",ex.getMessage());
//            //request.setAttribute("errorMessage", ex.getMessage());
//            ex.printStackTrace();
//            return"PaypalTest/paypalError";
//            //request.getRequestDispatcher("error.jsp").forward(request, response);
//        }
//	}
	
	@PostMapping(value = "/PaypalTest/paypalCheckout")
	public String paypalCheckout(Model model,
			@RequestParam("productName")String productName, @RequestParam("subtotal")String subtotal,
			@RequestParam("tax")String tax, @RequestParam("shipping")String shipping,  @RequestParam("total")String total){
		OrderDetailBean orderDetail = new OrderDetailBean(productName,subtotal,shipping,tax,total);
        try {           
            String approvalLink = service.authorizePayment(orderDetail);
            System.out.println(approvalLink);            
            return "redirect: " + approvalLink;
//            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            model.addAttribute("errorMessage", "付款失敗，請聯絡客服人員！");
            ex.printStackTrace();
            return"PaypalTest/paypalError";
        }
    }
	
	
}
