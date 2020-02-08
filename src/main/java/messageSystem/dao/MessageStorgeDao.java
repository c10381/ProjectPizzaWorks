package messageSystem.dao;

import java.util.List;

import _model.MessageBean;

public interface MessageStorgeDao {


	boolean insertMessage(MessageBean messageBean);

	List<?> getMessage(String formEmail, String toEmail);

}