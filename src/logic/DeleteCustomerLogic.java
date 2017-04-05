package logic;

import java.sql.Connection;
import java.sql.SQLException;

import manager.ConnectionManager;

import common.SalesBusinessException;
import common.SalesSystemException;

import dao.CustomerDAO;

public class DeleteCustomerLogic {

	public int deleteCustomer( String custCode ) throws SalesBusinessException, SalesSystemException {
		Connection con = null;
		int count = 0;

		try {
			con = ConnectionManager.getConnection();

			CustomerDAO customerDAO = new CustomerDAO( con );
			count = customerDAO.deleteCustomer( custCode );

			System.out.println("DeleteCustomerLogic.count != null ");

			if( count == 0 ) {
				throw new SalesBusinessException( "得意先を追加することができませんでした。" );
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
		return count;
	}
}