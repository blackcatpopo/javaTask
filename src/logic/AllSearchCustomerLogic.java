package logic;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import manager.ConnectionManager;

import common.SalesBusinessException;
import common.SalesSystemException;

import dao.CustomerDAO;
import entity.Customer;

public class AllSearchCustomerLogic {

	public ArrayList<Customer> searchCustomer() throws SalesBusinessException, SalesSystemException {
		Connection con = null;
		ArrayList<Customer> customer = new ArrayList<Customer>();

		try {
			con = ConnectionManager.getConnection();

			CustomerDAO customerDAO = new CustomerDAO( con );
			customer = customerDAO.findAllCustomer();

			if( customer == null ) {
				throw new SalesBusinessException( "該当する得意先コードはありません。" );
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
		return customer;
	}
}
