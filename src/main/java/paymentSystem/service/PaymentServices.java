package paymentSystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import _model.SalesOrderBean;
import shopSystem.dao.ShopDao;

@Service
@Transactional
public class PaymentServices {
	
	ShopDao dao;
	
	private static final String CLIENT_ID = "AerXyJ9NF_HpEbkF0nhEicgbXmAbGout6KiAKU_BnvxwMR9F8Yx2WpgaInuFI-GqjXbBTOlxrCAt4Xl5";
    private static final String CLIENT_SECRET = "EHj6MslMjqDx5DU3PfDc-u6G9_xPYGyciFPXQkmm14Z9f7Ep3YeO2TDS95JBc1HTtyewMVj_ZjP7c3jV";
    private static final String MODE = "sandbox";
        
    @Autowired
	public void setDao(ShopDao dao) {
		this.dao = dao;
	}
        
    public String authorizePayment(SalesOrderBean orderDetail)        
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
        return getApprovalLink(approvedPayment);
 
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
    	APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
    	return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);     
        Payment payment = new Payment().setId(paymentId);    
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);    
        return payment.execute(apiContext, paymentExecution);
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
        redirectUrls.setCancelUrl("http://localhost:8080/ProjectPizzaWorks/PaypalTest/Cancel");
        redirectUrls.setReturnUrl("http://localhost:8080/ProjectPizzaWorks/PaypalTest/testReview_Payment");        
        return redirectUrls;       
    }
     
    private List<Transaction> getTransactionInformation(SalesOrderBean orderDetail) {
    	Details details = new Details();
        details.setShipping("0");
        details.setSubtotal(String.valueOf(orderDetail.getTotalSales()));
        details.setTax("0");
     
        Amount amount = new Amount();
        amount.setCurrency("TWD");
        amount.setTotal(String.valueOf(orderDetail.getTotalSales()));
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("PizzaBite餐點");
         
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
         
        Item item = new Item();
        item.setCurrency("TWD");
        item.setName("PizzaBite餐點");
        item.setPrice(String.valueOf(orderDetail.getTotalSales()));
        item.setTax("0");
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

