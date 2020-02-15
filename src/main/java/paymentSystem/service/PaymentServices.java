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

import _model.MembersBean;
import _model.ProductBean;
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
        
    public String authorizePayment(SalesOrderBean orderDetail, MembersBean mem)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation(mem);
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
    
    
    private Payer getPayerInformation(MembersBean mem) {
    	Payer payer = new Payer();    	
        payer.setPaymentMethod("paypal");
         
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(mem.getFirstName())
                 .setLastName(mem.getLastName())
                 .setEmail(mem.getLastName());
//                 .setCountryCode("TW")
//                 .setPhone("0912345678");
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
        
        
        for(int i=0;i<orderDetail.getSalesOrderDetails().size();i++) {
        	Item item = new Item();
        	item.setTax("0");
            item.setCurrency("TWD");
            
            ProductBean pb = dao.getProductById(orderDetail.getSalesOrderDetails().get(i).getProductId());
            int quantity = orderDetail.getSalesOrderDetails().get(i).getQuantity();
            int unitprice = (int) orderDetail.getSalesOrderDetails().get(i).getUnitPrice();
            item.setName(pb.getProductName() + "*" + String.valueOf(quantity) + ":");
            item.setPrice(String.valueOf(unitprice));            
            item.setQuantity(String.valueOf(quantity));         
            items.add(item);
            
            if(orderDetail.getSalesOrderDetails().get(i).getCrustTypeId()==2) {
            	Item crust = new Item();
            	crust.setTax("0");
            	crust.setCurrency("TWD");
            	crust.setName("芝心餅皮" + "*" + String.valueOf(quantity) + ":");
            	crust.setPrice("60");
            	crust.setQuantity(String.valueOf(quantity));
            	items.add(crust);
            }
            
            if(orderDetail.getSalesOrderDetails().get(i).getDoubleCheese()==1) {
            	Item cheese = new Item();
            	cheese.setTax("0");
            	cheese.setCurrency("TWD");
            	cheese.setName("雙倍起司" + "*" + String.valueOf(quantity) + ":");
            	cheese.setPrice("25");
            	cheese.setQuantity(String.valueOf(quantity));
            	items.add(cheese);
            }            
        }
        
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

