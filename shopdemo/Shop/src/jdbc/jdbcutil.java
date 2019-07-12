package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcutil {
	private static String url="jdbc:mysql://localhost/shop?useUnicode=true&characterEncoding=gbk";
	private static String userName="root";
	private static String password="root";
	private static String driveName="com.mysql.jdbc.Driver";
	static {
		try {
			Class.forName(driveName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(url, userName, password);
	}
	public static void close(ResultSet rs,Statement s,Connection c) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(s!=null) {
				s.close();
			}
			if(c!=null) {
				c.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}