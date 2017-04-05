<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�̔��x���V�X�e��</title>
<script type="text/javascript">
	function ClearFormAll() {
		document.getElementsByName("RADIO_TYPE").checked = false;
		document.inform.CUST_CODE.value=null;
		document.inform.CUST_NAME.value=null;
		document.inform.CUST_TELNO.value=null;
		document.inform.CUST_POSTAL.value=null;
		document.inform.CUST_ADDRESS.value=null;
	}

	function TextDisable() {
		radiotype = document.inform.RADIO_TYPE.value; //���W�I�{�^����value�l
		name = document.inform.CUST_NAME.value;
		telno = document.inform.CUST_TELNO.value;
		postal = document.inform.CUST_POSTAL.value;
		address = document.inform.CUST_ADDRESS.value;
		if (radiotype == 1) {
			document.inform.CUST_NAME.disabled = false;
			document.inform.CUST_TELNO.disabled = false;
			document.inform.CUST_POSTAL.disabled = false;
			document.inform.CUST_ADDRESS.disabled = false;
			return true;
		} else if (radiotype == 2
				&& (name == "" || telno == "" || postal == "" || address == "")) {
			document.inform.CUST_NAME.disabled = true;
			document.inform.CUST_TELNO.disabled = true;
			document.inform.CUST_POSTAL.disabled = true;
			document.inform.CUST_ADDRESS.disabled = true;
			return true;
		} else if (radiotype == 2 && name != "" && telno != "" && postal != ""
				&& address != "") {
			document.inform.CUST_NAME.disabled = false;
			document.inform.CUST_TELNO.disabled = false;
			document.inform.CUST_POSTAL.disabled = false;
			document.inform.CUST_ADDRESS.disabled = false;
			return true;
		} else if (radiotype == 3) {
			document.inform.CUST_NAME.disabled = true;
			document.inform.CUST_TELNO.disabled = true;
			document.inform.CUST_POSTAL.disabled = true;
			document.inform.CUST_ADDRESS.disabled = true;
			return true;
		}
	}
	function PushSearchButton() {
		custCode = document.inform.CUST_CODE.value; //���Ӑ�R�[�h
		if (custCode == "") {
			alert("���Ӑ�R�[�h�������͂ł�");
			return false;
		}
		document.inform.BUTTON_ID.value = 'UC000_01_03';
		document.inform.submit();
	}
	function PushUpdateButton() {
		custCode = document.inform.CUST_CODE.value; //���Ӑ�R�[�h
		radiotype = document.inform.RADIO_TYPE.value; //���W�I�{�^����value�l
		if (custCode == "") {
			alert("���Ӑ�R�[�h�������͂ł�");
			return false;
		}
		if (radiotype == 0) {
			//�o�^/�ύX/�폜���ɖ��I�����
			alert("�o�^/�ύX/�폜�̂����ꂩ��I�����Ă�������");
			return false;
		}
		if (radiotype == "1") {
			document.inform.BUTTON_ID.value = 'UC000_01_04';
		} else if (radiotype == "2") {
			document.inform.BUTTON_ID.value = 'UC000_01_05';
		} else if (radiotype == "3") {
			flg = confirm("�폜���Ă���낵���ł����H");
			if (flg == true) {
				document.inform.BUTTON_ID.value = 'UC000_01_06';
			} else {
				return false;
			}
		}
		document.inform.submit();
	}
</script>
</head>
<body>
	<%
		System.out.println( "(AddCustomer.jsp)" );
		//sessionScope��null�Ȃ烍�O�C����ʂփ��_�C���N�g
		if ( session.getAttribute( "employee" ) == null || "".equals( session.getAttribute( "employee" ) ) ) {
			String name = (String) session.getAttribute( "employee" );
			System.out.println( "  sessionScope = " + name );
			response.sendRedirect( "/jsys/Login.html" );
		}
	%>
	<div style="text-align: right;">
		�悤����
		<c:out value="${sessionScope.employee.empName }" />
		����B <a href="/jsys/Logout.jsp">���O�A�E�g</a>
	</div>
	<%
		//���W�I�{�^����value�l���擾���Anull�Ȃ�1������ēo�^���W����checked�Ȃ�悤��
		int radio = 0;
		String name = "";
		String str = (String) request.getAttribute( "radio" );
		System.out.println( "  str = " + str );
		if ( "".equals( str ) || str == null ) {
			str = "1";
		} else {
			radio = Integer.parseInt( str );
		}
	%>
	<div style="text-align: center;">
		<h2>���Ӑ� �o�^�b�ύX�b�폜</h2>
	</div>
	<div style="text-align: center; color: red;">
		<c:out value="${requestScope.message}" />
	</div>
	<form action="/jsys/jsys" method="post" name="inform">
		<input type="hidden" name="BUTTON_ID" value="">
		<div style="text-align: center;">
			<label>
				�o�^
				<input type="radio" name="RADIO_TYPE" value="1"
					onclick="return TextDisable()"
				>
			</label>
			|
			<label>
				�ύX
				<input type="radio" name="RADIO_TYPE" value="2"
					<%if ( radio == 2 ) {
				out.print( " checked" );
			}%>
					onclick="return TextDisable()"
				>
			</label>
			|
			<label>
				�폜
				<input type="radio" name="RADIO_TYPE" value="3"
					<%if ( radio == 3 ) {
				out.print( " checked " );
			}%>
					onclick="return TextDisable()"
				>
			</label>
			<br />
			<table style="margin-left: auto; margin-right: auto;">
				<tr>
					<td nowrap>���Ӑ�R�[�h</td>
					<td nowrap>
						<input type="text" name="CUST_CODE"
							value="${requestScope.customer.custCode }" maxlength="6"
							size="10"
						/>
					</td>
					<td>
						<input type="button" value="����"
							onclick="return PushSearchButton()"
						>
					</td>
				</tr>
				<tr>
					<td nowrap>���Ӑ於</td>
					<td nowrap>
						<input type="text" name="CUST_NAME"
							value="${requestScope.customer.custName }" maxlength="6"
							size="10"
							<%
							if ( request.getAttribute( "customer" ) !=  null && radio == 2) {
								out.println();
							}else if(radio == 3 ) {
								out.println("disabled");
							} else {}
							%>
						/>
					</td>
				</tr>
				<tr>
					<td nowrap>�d�b�ԍ�</td>
					<td nowrap>
						<input type="text" name="CUST_TELNO"
							value="${requestScope.customer.telNo }" maxlength="12" size="10"
							<%
							if ( request.getAttribute( "customer" ) !=  null && radio == 2) {
								out.println("");
							}else if(radio == 3 ) {
								out.println("disabled");
							} else {}
							%>
						>
					</td>
				</tr>
				<tr>
					<td nowrap>�X�֔ԍ�</td>
					<td nowrap>
						<input type="text" name="CUST_POSTAL"
							value="${requestScope.customer.postalCode }" maxlength="8"
							size="10" pattern="\d{3}-\d{4}"
							title="�X�֔ԍ��́A3���̐����A�n�C�t���i-�j�A4���̐����̏��ŋL�����Ă��������B"
							<%
							if ( request.getAttribute( "customer" ) !=  null && radio == 2) {
								out.println("");
							}else if(radio == 3 ) {
								out.println("disabled");
							} else {}
							%>
						>
					</td>
				</tr>
				<tr>
					<td nowrap>�Z��</td>
					<td nowrap>
						<input type="text" name="CUST_ADDRESS"
							value="${requestScope.customer.address }" maxlength="40"
							size="10"
							<%
							if ( request.getAttribute( "customer" ) !=  null && radio == 2) {
								out.println("");
							}else if(radio == 3 ) {
								out.println("disabled");
							} else {}
							%>
						>
					</td>
				</tr>
			</table>
			<p>
				<input type="button" value="���s" onClick="return PushUpdateButton()">
				<input type="button" value="�N���A" onClick="ClearFormAll()">
			</p>
			<input type="button" value="���j���[��ʂɖ߂�"
				onclick="this.form.BUTTON_ID.value='UC999_01'; this.form.submit();"
			>
		</div>
	</form>
</body>
</html>


