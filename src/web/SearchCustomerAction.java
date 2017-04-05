package web;

import javax.servlet.http.HttpServletRequest;

import logic.SearchCustomerLogic;

import common.SalesBusinessException;
import common.SalesSystemException;

import entity.Customer;

public class SearchCustomerAction {

	public String excute( HttpServletRequest request ) {
		String page = "/AddCustomer.jsp";
		Customer customer = null;
		String custCode = request.getParameter( "SEARCH_CUST_CODE" );
		String radiotype = request.getParameter( "RADIO_TYPE" );
		try {
			SearchCustomerLogic logic = new SearchCustomerLogic();
			customer = logic.searchCustomer( custCode );

			request.setAttribute( "customer", customer );
			request.setAttribute( "radio", radiotype );

			page = "/AddCustomer.jsp";
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
