package paymentSystem.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import _model.OrderDetailBean;

@Service
public class PaymentServices {
	private static final String CLIENT_ID = "AerXyJ9NF_HpEbkF0nhEicgbXmAbGout6KiAKU_BnvxwMR9F8Yx2WpgaInuFI-GqjXbBTOlxrCAt4Xl5";
    private static final String CLIENT_SECRET = "EHj6MslMjqDx5DU3PfDc-u6G9_xPYGyciFPXQkmm14Z9f7Ep3YeO2TDS95JBc1HTtyewMVj_ZjP7c3jV";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetailBean orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        
        Payment approvedPayment = requestPayment.create(apiContext);
        System.out.println("reach -before return-");
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation() {
    	Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
         
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Leon")
                 .setLastName("Tsai")
                 .setEmail("iiiedujava@gmail.com");       
        payer.setPayerInfo(payerInfo);
         
        return payer;       
    }
     
    private RedirectUrls getRedirectURLs() {
    	RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/PaypalTest/cancel.html");
        redirectUrls.setReturnUrl("/PaypalTest/review_payment");        
        return redirectUrls;       
    }
     
    private List<Transaction> getTransactionInformation(OrderDetailBean orderDetail) {
    	Details details = new Details();
        details.setShipping(orderDetail.getShipping());
        details.setSubtotal(orderDetail.getSubtotal());
        details.setTax(orderDetail.getTax());
     
        Amount amount = new Amount();
        amount.setCurrency("USD");
        System.out.println("orderDetail.getTotal:"+orderDetail.getTotal());
        amount.setTotal(orderDetail.getTotal());
        amount.setDetails(details);
        
        System.out.println("amount:" + amount.getTotal());
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());
         
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
         
        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getProductName());
        item.setPrice(orderDetail.getSubtotal());
        item.setTax(orderDetail.getTax());
        item.setQuantity("1");
         
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
     
        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);  
         
        return listTransaction;
        
    }
     
    private String getApprovalLink(Payment approvedPayment) {
    	List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
         
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }      
        System.out.println("approvalLink:"+approvalLink);
        return approvalLink;
        
    }
}

