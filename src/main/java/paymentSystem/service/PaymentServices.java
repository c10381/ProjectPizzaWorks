package paymentSystem.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

import _model.ProductBean;
import _model.SalesOrderBean;
import shopSystem.dao.ShopDao;

@Service
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
        payerInfo.setFirstName("育承")
                 .setLastName("蔡")
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
    	
    	//因為不會有運費及稅，所以這兩個可以直接設成0
    	Details details = new Details();
    	details.setShipping("0");        
        details.setTax("0");
        
        //幣值設為TWD
        Amount amount = new Amount();
        amount.setCurrency("TWD");
        
        //每筆項目明細
        Transaction transaction = new Transaction();
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        Item item = new Item();
        item.setTax("0");        
        item.setCurrency("TWD");
        List<Transaction> listTransaction = new ArrayList<>();
        
    	for(int i =0; i<orderDetail.getSalesOrderDetails().size();i++) {
    		int quantity = orderDetail.getSalesOrderDetails().get(i).getQuantity();
    		double unitPrice = orderDetail.getSalesOrderDetails().get(i).getUnitPrice();
    		double subTotal = quantity * unitPrice;
    		
    		//餅皮ID是2就該品項小計 + 60
    		if(orderDetail.getSalesOrderDetails().get(i).getCrustTypeId()==2) {
    			subTotal += 60;
    		}
    		
    		//雙層起司是1就該品項小計 + 25
    		if(orderDetail.getSalesOrderDetails().get(i).getDoubleCheese()==1) {
    			subTotal += 25;
    		}  		
    		details.setSubtotal(String.valueOf(subTotal));    		
    		amount.setTotal(String.valueOf(orderDetail.getTotalSales()));
            amount.setDetails(details);
            transaction.setAmount(amount);
            
            ProductBean pb = (ProductBean)dao.getProductById(orderDetail.getSalesOrderDetails().get(i).getProductId());
            transaction.setDescription(pb.getProductName());
            item.setName(pb.getProductName());
            item.setQuantity(String.valueOf(quantity));
            
            //把item加進items，再把items塞進itemList，最後把itemList丟進transaction
            items.add(item);
            itemList.setItems(items);
            transaction.setItemList(itemList);
            item.setPrice(String.valueOf(subTotal));
            
            //把總共幾筆交易丟進list Transaction
            listTransaction.add(transaction); 
    	}      
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

