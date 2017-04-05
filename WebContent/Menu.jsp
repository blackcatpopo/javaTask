<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>販売支援システム</title>

</head>
<body>
	<%
		if ( session.getAttribute( "employee" ) == null || "".equals( session.getAttribute( "employee" ) ) ) {
			String name = (String) session.getAttribute( "employee" );
			System.out.println( "sessionscopeが空だった" );
			response.sendRedirect( "/jsys/Login.html" );
		}
	%>
	<div style="text-align: right;">
		ようこそ
		<c:out value="${sessionScope.employee.empName }" />
		さん。 <a href="/jsys/Logout.jsp">ログアウト</a>
	</div>
	<form action="/jsys/jsys" method="post">
		<div style="text-align: center;">
			<b>得意先管理</b> <input type="hidden" name="BUTTON_ID" value="">
			<p>
				<b>得意先全件一覧</b> <input type="button" value="得意先全件一覧"
					onclick="this.form.BUTTON_ID.value='UC000_01_01'; this.form.submit()">

				<b>得意先|登録・変更・削除</b> <input type="button" value="登/変/削"
					onclick="this.form.BUTTON_ID.value='UC000_01_02'; this.form.submit()">
			</p>
			<p>
				<b>集計管理</b>
			</p>
		</div>
	</form>
</body>
</html>