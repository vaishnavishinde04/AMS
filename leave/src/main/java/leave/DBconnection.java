package leave;
import java.sql.*;
public class DBconnection {

	public static Connection getConnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ams?user=root&password=root");
		}catch(Exception e) {
			System.out.print(e);
		}
		return con;

	}

}
