package web;

import javax.servlet.http.HttpServletRequest;

import logic.UpdateCustomerLogic;

import common.SalesBusinessException;
import common.SalesSystemException;

public class UpdateCustomerAction {

	public String excute( HttpServletRequest request ) {
		String page = "/ResultView.jsp";
		String custCode = request.getParameter( "CUST_CODE" );
		String custName = request.getParameter( "CUST_NAME" );
		String custTelNo = request.getParameter( "CUST_TELNO" );
		String custPostal = request.getParameter( "CUST_POSTAL" );
		String custAddress = request.getParameter( "CUST_ADDRESS" );
		int count = 0;

		try {
			UpdateCustomerLogic uLogic = new UpdateCustomerLogic();
			count = uLogic.updateCustomer( custCode, custName, custTelNo, custPostal, custAddress );

			if( count == 1 ) {
				request.setAttribute( "message", "得意先を変更しました。" );
				page = "/ResultView.jsp";
			} else {
				page = "SalesErrorView.jsp";
				request.setAttribute( "message", "得意先を変更できませんでした。" );
			}

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
