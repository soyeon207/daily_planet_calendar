package daily_plannet;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
public DBConnect() {}
	
	public Connection getConnection() {
		String url = "jdbc:mysql://10.96.123.171:3306/daily_planet?useUnicode=yes&amp;characterEncoding=utf8&amp;useSSL=false&amp;serverTimezone=UTC";
		String id = "daily_planet";
		String pass = "mirim12345!";
		
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pass);
			System.out.println("디비 연결 성공 !");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}


}
