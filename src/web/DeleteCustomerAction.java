package web;

import javax.servlet.http.HttpServletRequest;

import logic.DeleteCustomerLogic;

import common.SalesBusinessException;
import common.SalesSystemException;

public class DeleteCustomerAction {

	public String excute( HttpServletRequest request ) {
		String page = "/SeatchCustomerView.jsp";
		String custCode = request.getParameter( "CUST_CODE" );
		int count = 0;

		System.out.println("DeleteCustomerAction.cusCode は " + custCode );

		try {
			DeleteCustomerLogic logic = new DeleteCustomerLogic();
			count = logic.deleteCustomer( custCode );

			System.out.println("DeleteCustomerAction.count は " + count);
			if( count != 0 ) {
				System.out.println("DeleteCustomerAction.count != null ");
				request.setAttribute( "message", "1件削除しました。" );
				page = "/ResultView.jsp";
			}
		} catch( SalesBusinessException e ) {
			e.printStackTrace();
			request.setAttribute( "message", e.getMessage() );
			page = "/SalesErrorView.jsp";
		} catch ( SalesSystemException e ) {
			e.printStackTrace();
			request.setAttribute( "message", e.getMessage() );
			page = "/SalesErrorView.jsp";
		}
		return page;
	}
}
