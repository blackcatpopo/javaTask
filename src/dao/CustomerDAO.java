package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Customer;


public class CustomerDAO {

	private Connection con;

	public CustomerDAO( Connection con ) {
		this.con = con;
	}

	public Connection getCon() {
		return con;
	}

	public void setCon( Connection con ) {
		this.con = con;
	}

	public int addCustomer( String custCode, String custName, String custTelNo, String custPostal, String custAddress) throws SQLException {
		String sql = "INSERT INTO customer values( ?, ?, ?, ?, ? )";
		PreparedStatement stmt = null;
		ResultSet res = null;
		int count = 0;

		try {
			stmt = con.prepareStatement( sql );
			stmt.setString( 1, custCode );
			stmt.setString( 2, custName );
			stmt.setString( 3, custTelNo );
			stmt.setString( 4, custPostal );
			stmt.setString( 5, custAddress );

			count = stmt.executeUpdate();
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
		return count;
	}

	public int updateCustomer( String custCode, String custName, String custTelNo, String custPostal, String custAddress) throws SQLException {
		String sql = "pdate customer set customer_code = ?, customer_name = ?, customer_telno = ?, customer_postalcode = ?, customer_address = ? where customer_code = ?";
		PreparedStatement stmt = null;
		ResultSet res = null;
		int count = 0;

		try {
			stmt = con.prepareStatement( sql );
			stmt.setString( 1, custCode );
			stmt.setString( 2, custName );
			stmt.setString( 3, custTelNo );
			stmt.setString( 4, custPostal );
			stmt.setString( 5, custAddress );
			stmt.setString( 6, custCode );

			count = stmt.executeUpdate();
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
		return count;
	}
	public ArrayList<Customer> findAllCustomer() throws SQLException {
		String sql = "SELECT * FROM customer";
		PreparedStatement stmt = null;
		ResultSet res = null;
		ArrayList<Customer> customer = new ArrayList<Customer>();

		try {
			stmt = con.prepareStatement( sql );
			res = stmt.executeQuery();

			while( res.next() ) {
				customer.add( new Customer(
						res.getString( "customer_code" ),
						res.getString( "customer_name" ),
						res.getString( "customer_telno" ),
						res.getString( "customer_postalcode" ),
						res.getString( "customer_address" )) );
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
		return customer;
	}
	public Customer findCustomer( String custCode ) throws SQLException {
		String sql = "SELECT * FROM customer where customer_code = ?";
		PreparedStatement stmt = null;
		ResultSet res = null;
		Customer customer = null;

		try {
			stmt = con.prepareStatement( sql );
			stmt.setString( 1, custCode );
			res = stmt.executeQuery();

			while( res.next() ) {
				customer = new Customer(
						res.getString( "customer_code" ),
						res.getString( "customer_name" ),
						res.getString( "customer_telno" ),
						res.getString( "customer_postalcode" ),
						res.getString( "customer_address" ));
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
		return customer;
	}

	public int deleteCustomer( String custCode ) {
		String sql = "DELETE FROM customer where customer_code = ?";
		PreparedStatement stmt = null;
		int count = 0;

		try {
			stmt = con.prepareStatement( sql );
			stmt.setString( 1, custCode );
			count = stmt.executeUpdate();

		} catch( SQLException e ) {
			e.printStackTrace();
		} finally {
			try {
				if( stmt != null ) {
					stmt.close();
				}
			} catch( SQLException e ) {
				e.printStackTrace();
			}
		}
		return count;
	}
}
