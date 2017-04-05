package web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import logic.LoginLogic;

import common.SalesBusinessException;
import common.SalesSystemException;

import entity.Employee;

public class LoginAction {

	public String excute( HttpServletRequest request ) {
		String page = "/AddCustomer.jsp";
		Employee employee = null;
		String empNo = request.getParameter( "EMP_NO" );
		String password = request.getParameter( "PASSWORD" );

		System.out.println("empNo -> " + empNo);
		HttpSession session = request.getSession();

		try {
			LoginLogic logic = new LoginLogic();
			employee = logic.login( empNo, password );

			session.setAttribute( "employee", employee );
			page = "/Menu.jsp";
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
