<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<div>
		<c:out value="${requestScope.message }" />
	</div>
</body>
</html>