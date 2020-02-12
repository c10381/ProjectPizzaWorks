package _model;

public class OrderDetailBean {
	private String productName;
    private float subtotal;
    private float shipping;
    private float tax;
    private float total;
    
    public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}

	public void setShipping(float shipping) {
		this.shipping = shipping;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public OrderDetailBean (){    	
    }
 
    public OrderDetailBean (String productName, String subtotal, String shipping, String tax, String total) {
        this.productName = productName;
        this.subtotal = Float.parseFloat(subtotal);
        this.shipping = Float.parseFloat(shipping);
        this.tax = Float.parseFloat(tax);
        this.total = Float.parseFloat(total);
    }
 
    public String getProductName() {
        return productName;
    }
 
    public String getSubtotal() {
        return String.format("%.2f", subtotal);
    }
 
    public String getShipping() {
        return String.format("%.2f", shipping);
    }
 
    public String getTax() {
        return String.format("%.2f", tax);
    }
     
    public String getTotal() {
        return String.format("%.2f", total);
    }  
    
	@Override
	public String toString() {
		return "OrderDetailBean [productName=" + productName + ", subtotal=" + subtotal + ", shipping=" + shipping
				+ ", tax=" + tax + ", total=" + total + "]";
	}
    
}
