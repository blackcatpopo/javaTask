package web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import logic.AllSearchCustomerLogic;

import common.SalesBusinessException;
import common.SalesSystemException;

import entity.Customer;

public class AllSearchCustomerAction {

	public String excute( HttpServletRequest request ) {
		String page = "/AllSeatchCustomerView.jsp";
		ArrayList<Customer> customer = new ArrayList<Customer>();

//		if( custCode != null && custCode.equals( "" )) {
//			request.setAttribute( "message", "得意先コードが未入力です。" );
//			return page;
//		}

		try {
			AllSearchCustomerLogic logic = new AllSearchCustomerLogic();
			customer = logic.searchCustomer();

			request.setAttribute( "customer", customer );

			page = "/AllSearchCustomerResultView.jsp";
		} catch( SalesBusinessException e ) {
			e.printStackTrace();
			request.setAttribute( "message", e.getMessage() );
		} catch ( SalesSystemException e ) {
			e.printStackTrace();
			request.setAttribute( "message", e.getMessage() );
			page = "/SalesErrorView.jsp";
		}
		return page;
	}
}
