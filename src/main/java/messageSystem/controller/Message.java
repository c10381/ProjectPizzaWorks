package messageSystem.controller;

public class Message {
    private String from;
    private String text;
    private String fromFirstName;
    private String fromLastName;

    public String getFromFirstName() {
		return fromFirstName;
	}

	public void setFromFirstName(String fromFirstName) {
		this.fromFirstName = fromFirstName;
	}

	public String getFromLastName() {
		return fromLastName;
	}

	public void setFromLastName(String fromLastName) {
		this.fromLastName = fromLastName;
	}
	public String getFromName() {
		if(fromLastName==null) {
			return "訪客";
		}else{
			return fromLastName+fromFirstName;			
		}
	}

	public String getFrom() {
		return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "Message{" +
                "from='" + from + '\'' +
                ", text='" + text + '\'' +
                '}';
    }
}
