package logic;

import java.sql.Connection;
import java.sql.SQLException;

import manager.ConnectionManager;

import common.SalesBusinessException;
import common.SalesSystemException;

import dao.EmployeeDAO;
import entity.Employee;

public class LoginLogic {

	public Employee login( String empNo, String password ) throws SalesBusinessException, SalesSystemException {
		Employee employee;
		Connection con = null;

		try {
			con = ConnectionManager.getConnection();

			EmployeeDAO employeeDAO = new EmployeeDAO( con );
			employee = employeeDAO.login( empNo, password );

			if( employee == null ) {
				throw new SalesBusinessException( "ログインできませんでした。" );
			}
		} catch( SQLException e ){
			e.printStackTrace();
			throw new SalesSystemException("システムエラーが発生しました。\nシステム管理者に連絡してください。" );
		} finally {
			try {
				if( con != null ) {
					con.close();
				}
			} catch ( SQLException e ) {
				e.printStackTrace();
				throw new SalesSystemException( "システムエラーが発生しました。\nシステム管理者に連絡してください。" );
			}
		}
		return employee;
	}
}
