package messageSystem.websocket;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Component
public class WebSocketSessions {
	// 存放正在連線員工Email(用getAllCoworker()取得)
	private ConcurrentHashMap<String, String> sessionCoworker = new ConcurrentHashMap<>();
	// 存放正在連線顧客Email(用getAllCustomer()取得)
	private ConcurrentHashMap<String, String> sessionCustomer = new ConcurrentHashMap<>();

	@Override
	public String toString() {
		return "[WebSocketSessions] sessionCoworker: " + sessionCoworker.size()
				+ ",[WebSocketSessions] sessionCustomer: " + sessionCustomer.size();
	}

	// 註冊員工SessionId
	public synchronized void registerCoworkerSessionId(String coworker, String sessionId) {
		Assert.notNull(coworker, "user must not be null");
		Assert.notNull(sessionId, "sessionId must not be null");
		sessionCoworker.put(sessionId, coworker);
	}

	// 註冊顧客SessionId
	public synchronized void registerCustomerSessionId(String customer, String sessionId) {
		Assert.notNull(customer, "user must not be null");
		Assert.notNull(sessionId, "sessionId must not be null");
		sessionCustomer.put(sessionId, customer);
	}

	// 移除SessionId
	public synchronized void removeSessionId(String sessionId) {
		Assert.notNull(sessionId, "sessionId must not be null");
		if (sessionCoworker.containsKey(sessionId)) {
			sessionCoworker.remove(sessionId);
		}else if (sessionCustomer.containsKey(sessionId)) {
			sessionCustomer.remove(sessionId);
		}
	}

	// 取得所有員工Email
	public ArrayList<String> getAllCoworker() {
		return new ArrayList<>(sessionCoworker.values());
	}

	public ArrayList<String> getAllCoworkerSessionIds() {
		return new ArrayList<>(sessionCoworker.keySet());
	}

	// 取得所有顧客Email
	public ArrayList<String> getAllCustomer() {
		return new ArrayList<>(sessionCustomer.values());
	}

	public ArrayList<String> getAllCustomerSessionIds() {
		return new ArrayList<>(sessionCustomer.keySet());
	}

	/**
	 * 取得相同員工的所有sessionIds
	 */
	public ArrayList<String> getCoworkerSessionIds(String user) {
		ArrayList<String> coworkersessionIds = new ArrayList<>();
		for (Map.Entry<String, String> entry : sessionCoworker.entrySet()) {
			String userInMap = entry.getValue();
			if (userInMap.equals(user)) {
				coworkersessionIds.add(entry.getKey());
			}
		}
		return coworkersessionIds;
	}
	/**
	 * 取得相同顧客的所有sessionIds
	 */
	public ArrayList<String> getCustomerSessionIds(String user) {
		ArrayList<String> customersessionIds = new ArrayList<>();
		for (Map.Entry<String, String> entry : sessionCustomer.entrySet()) {
			String userInMap = entry.getValue();
			if (userInMap.equals(user)) {
				customersessionIds.add(entry.getKey());
			}
		}
		return customersessionIds;
	}
}
