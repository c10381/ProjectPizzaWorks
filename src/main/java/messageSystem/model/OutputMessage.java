package messageSystem.model;

public class OutputMessage {
    private String dateStr;
    private Message message;
    private Boolean customerService;
    
    public OutputMessage(String dateStr, Message message,Boolean customerService) {
        this.dateStr = dateStr;
        this.message = message;
        this.customerService=customerService;
    }

    public Boolean getCustomerService() {
		return customerService;
	}

	public void setCustomerService(Boolean customerService) {
		this.customerService = customerService;
	}

	public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }
}
