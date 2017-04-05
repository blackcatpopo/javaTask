<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="entity.*"
	import="javax.servlet.http.HttpServletRequest" import="java.util.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�̔��x���V�X�e��</title>
</head>
<body>
	<%
		if ( session.getAttribute( "employee" ) == null || "".equals( session.getAttribute( "employee" ) ) ) {
			String name = (String) session.getAttribute( "employee" );
			System.out.println( "(AllSearchCustomerResultView)  sessionScope���󂾂���" );
			response.sendRedirect( "/jsys/Login.html" );
		}
	%>
	<div style="text-align: right;">
		�悤����
		<c:out value="${sessionScope.employee.empName }" />
		����B <a href="/jsys/Logout.jsp">���O�A�E�g</a>
	</div>
	<div style="text-align: center;">
		<h2>���Ӑ�ꗗ</h2>
		<form action="/jsys/jsys" method="post" name="inform">
			<input type="hidden" name="BUTTON_ID" value="">
			<input type="hidden" name="CUST_CODE" value="">
			<input type="hidden" name="RADIO_TYPE" value="">

			<table style="margin-left: auto; margin-right: auto; margin-bottom:30px;" border="1">
				<tr>
					<th nowrap style="width: auto;">���Ӑ�R�[�h</th>
					<th nowrap style="width: auto;">���Ӑ於</th>
					<th nowrap style="width: auto;">�d�b�ԍ�</th>
					<th nowrap style="width: auto;">�X�֔ԍ�</th>
					<th nowrap style="width: auto;">�Z��</th>
					<th nowrap style="width: auto;">�ύXor�폜</th>
				</tr>
				<c:forEach var="obj" items="${requestScope.allCustomer }"
					varStatus="status"
				>
					<tr>
						<td nowrap style="width: auto;">
							<c:out value="${obj.custCode }" />
						</td>
						<td nowrap style="width: auto;">
							<c:out value="${obj.custName }" />
						</td>
						<td nowrap style="width: auto;">
							<c:out value="${obj.telNo }" />
						</td>
						<td nowrap style="width: auto;">
							<c:out value="${obj.postalCode }" />
						</td>
						<td nowrap style="width: auto;">
							<c:out value="${obj.address }" />
						</td>
						<td nowrap style="width: auto;">
							<p>
								<input type="button" value="�ύX"
									onclick="this.form.BUTTON_ID.value='UC000_01_03'; this.form.CUST_CODE.value='${obj.custCode}'; this.form.RADIO_TYPE.value='2'; this.form.submit()"
								>
							</p>
							<p>
								<input type="button" value="�폜"
									onclick="this.form.BUTTON_ID.value='UC000_01_03'; this.form.CUST_CODE.value='${obj.custCode}'; this.form.RADIO_TYPE.value='3'; this.form.submit()"
								>
							</p>
					</tr>
				</c:forEach>
			</table>
			<input type="button" value="�O�̉�ʂɖ߂�" onclick="history.back()">
		</form>
	</div>
</body>
</html>

