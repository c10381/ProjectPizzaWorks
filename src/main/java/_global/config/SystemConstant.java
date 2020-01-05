package _global.config;

public class SystemConstant {
	public static final int SQL_SERVER = 0;
	public static final int MYSQL = 1;
	public static int DB_TYPE = SQL_SERVER;
	public String getType() {
		String type = "";
		if (DB_TYPE == MYSQL) {
			type = "M";
		} else if (DB_TYPE == SQL_SERVER) {
			type = "S";
		}
		return type;
	} 
}
