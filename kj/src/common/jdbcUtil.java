package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class jdbcUtil {

	public static Connection connect() throws SQLException{
	
	String url = "jdbc:oracle:thin:@192.168.0.65:1521:xe";
	Connection conn = DriverManager.getConnection(url, "kj", "1234");
	return conn;
	}
}