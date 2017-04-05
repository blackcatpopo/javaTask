<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>販売支援システム|ログアウト</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<div style="text-align: center;">ログアウトしました。</div>
	<a href="Login.html">ログインへ</a>
</body>
</html>