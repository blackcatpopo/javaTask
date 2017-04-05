<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if ( session.getAttribute( "employee" ) == null || "".equals( session.getAttribute( "employee" ) ) ) {
			String name = (String) session.getAttribute( "employee" );
			System.out.println( "sessionscopeが空だった" );
			response.sendRedirect( "/jsys/Login.html" );
		}
	%>
	<div
		style="text-align: center; margin-right: auto; margin-left: auto; color: red;">
		<p>
			<c:out value="${requestScope.message }" />
		</p>
	</div>

	<form action="/jsys/jsys" method="post">
		<div style="text-align: center;">
			<input type="hidden" name="BUTTON_ID" value="">
			<p>
				<input type="button" value="前画面へ戻る" onclick="history.back()">
			</p>
		</div>
	</form>
</body>
</html>