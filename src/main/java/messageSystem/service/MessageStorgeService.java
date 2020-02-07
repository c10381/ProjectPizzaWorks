package messageSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import _model.MessageBean;
import messageSystem.dao.MessageStorgeDao;

public interface MessageStorgeService {

	boolean insertMessage(MessageBean messageBean);

	List<?> getMessage(String formEmail, String toEmail);

}