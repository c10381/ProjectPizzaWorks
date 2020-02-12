package paymentSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		model.addAttribute("orderDetailBean", new OrderDetailBean());
		return"PaypalTest/testCheckout";
	}
	
	@RequestMapping(value = "/PaypalTest/testAuthorize_Payment")
	public String testAuthorize_Payment (Model model) {
		return"PaypalTest/testAuthorize_Payment";
	}	
	
	@PostMapping(value = "/PaypalTest/paypalCheckout")
	public String paypalCheckout(Model model,
			@RequestParam("productName")String productName, @RequestParam("subtotal")String subtotal,
			@RequestParam("tax")String tax, @RequestParam("shipping")String shipping,  @RequestParam("total")String total){
		OrderDetailBean orderDetail = new OrderDetailBean();
		orderDetail.setProductName(productName);
		orderDetail.setSubtotal(subtotal);
		orderDetail.setShipping(shipping);
		orderDetail.setTax(tax);
		orderDetail.setTotal(total);

        try {           
            String approvalLink = service.authorizePayment(orderDetail);
            System.out.println(approvalLink);            
            return "redirect: " + approvalLink;
//            response.sendRedirect(approvalLink);
             
        } catch (PayPalRESTException ex) {
            model.addAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            return"PaypalTest/paypalError";
        }
    }
	
	
}
