package manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private static final String URL = "jdbc:mysql://localhost:3306/jsysDB";
	private static final String USER = "mysql";
	private static final String PASSWORD = "mysql";

	public ConnectionManager() {
	}

	public static synchronized Connection getConnection() throws SQLException {
		Connection con = null;
		try {
			con = DriverManager.getConnection( URL, USER, PASSWORD );
		} catch( SQLException e ) {
			e.printStackTrace();
			throw e;
		}
		return con;
	}
}