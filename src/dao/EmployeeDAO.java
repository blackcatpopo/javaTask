package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Employee;


public class EmployeeDAO {

	private Connection con;

	public EmployeeDAO( Connection con ) {
		this.con = con;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon( Connection con ) {
		this.con = con;
	}

	public Employee  login( String empNo, String password ) throws SQLException {
		String sql = "SELECT employee_name FROM employee where employee_no = ? AND password = ?";
		PreparedStatement stmt = null;
		ResultSet res = null;
		Employee employee = new Employee();

		try {
			stmt = con.prepareStatement( sql );
			stmt.setString( 1, empNo );
			stmt.setString( 2, password );

			res = stmt.executeQuery();

			if( res.next() ) {
				employee =  new Employee( res.getString( "employee_name" ));
			}
		} catch( SQLException e ) {
			e.printStackTrace();
			throw e;
		} finally {
			if( res != null ) {
				res.close();
			}
			if( stmt != null ) {
				stmt.close();
			}
		}
		return employee;
	}
}