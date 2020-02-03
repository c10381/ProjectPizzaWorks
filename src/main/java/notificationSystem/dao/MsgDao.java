package notificationSystem.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import _model.SalesOrderBean;
//import _model.SalesOrderDetailBean;

public interface MsgDao {
	
	public void setFactory(SessionFactory factory);
	
	public List<SalesOrderBean> get_unchecked_Orders();
	
//	public List<SalesOrderDetailBean> getOrder(); 
	
}
