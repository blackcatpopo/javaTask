package web;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/jsys")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("FrontController");
		String page = null;

		request.setCharacterEncoding( "utf-8" );

		String buttomID = request.getParameter( "BUTTON_ID" );

		switch ( buttomID ) {
		case "UC101" :
			System.out.println("ログイン時");
			LoginAction lAction = new LoginAction();
			page = lAction.excute( request );
			break;
		case "UC000_01_01" :
			System.out.println("全件一覧ボタンクリック時");
			AllSearchCustomerAction asAction = new AllSearchCustomerAction();
			page = asAction.excute( request );
			break;
		case "UC000_01_02" :
			System.out.println("得意先追加ボタンクリック時");
			page = "/AddCustomer.jsp";
			break;
		case "UC000_01_03" :
			System.out.println("登録/変更/削除画面で検索ボタンを押したとき");
			SearchCustomerAction sAction = new SearchCustomerAction();
			page = sAction.excute( request );
			break;
		case "UC000_01_04" :
			System.out.println("登録にラジオボタンが選択されている");
			AddCustomerAction aAction = new AddCustomerAction();
			page = aAction.excute( request );
			break;
		case "UC000_01_05" :
			System.out.println("変更にラジオボタンが選択されている");
			UpdateCustomerAction uAction = new UpdateCustomerAction();
			page = uAction.excute( request );
			break;
		case "UC000_01_06" :
			System.out.println("削除にラジオボタンが選択されている");
			DeleteCustomerAction dAction = new DeleteCustomerAction();
			page = dAction.excute( request );
			break;
		case "UC999_01" :
			System.out.println("Menuへボタン");
			page = "/Menu.jsp";
			break;
		case "UC999_02" :

		default :
			break;
		}
		System.out.println(page);
		RequestDispatcher rd = request.getRequestDispatcher( page );
		rd.forward( request, response );
	}
}
