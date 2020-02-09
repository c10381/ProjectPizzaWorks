package messageSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import _model.MessageBean;
import messageSystem.dao.MessageStorgeDao;
import messageSystem.service.MessageStorgeService;

@Service
public class MessageStorgeServiceImpl implements MessageStorgeService {
	
	@Autowired
	private MessageStorgeDao dao;
	
	@Override
	@Transactional
	public boolean insertMessage(MessageBean messageBean) {		
		//dao.insertMessage(messageBean);
		return dao.insertMessage(messageBean);
	}
	@Override
	@Transactional
	public List<?> getMessage(String formEmail,String toEmail) {
		return dao.getMessage(formEmail, toEmail);
	}
}
