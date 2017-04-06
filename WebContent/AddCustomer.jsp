<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>販売支援システム</title>
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
		var form = document.inform;
		radiotype = document.inform.RADIO_TYPE.value; //ラジオボタンのvalue値
		name = form.CUST_NAME.value;
		telno = form.CUST_TELNO.value;
		postal = form.CUST_POSTAL.value;
		address = form.CUST_ADDRESS.value;
		if (radiotype == 1) {
			form.CUST_NAME.disabled = false;
			form.CUST_TELNO.disabled = false;
			form.CUST_POSTAL.disabled = false;
			form.CUST_ADDRESS.disabled = false;
			return true;
		} else if (radiotype == 2
				&& (name == "" || telno == "" || postal == "" || address == "")) {
			form.CUST_NAME.disabled = true;
			form.CUST_TELNO.disabled = true;
			form.CUST_POSTAL.disabled = true;
			form.CUST_ADDRESS.disabled = true;
			return true;
		} else if (radiotype == 2 && name != "" && telno != "" && postal != ""
				&& address != "") {
			form.CUST_NAME.disabled = false;
			form.CUST_TELNO.disabled = false;
			form.CUST_POSTAL.disabled = false;
			form.CUST_ADDRESS.disabled = false;
			return true;
		} else if (radiotype == 3) {
			form.CUST_NAME.disabled = true;
			form.CUST_TELNO.disabled = true;
			form.CUST_POSTAL.disabled = true;
			form.CUST_ADDRESS.disabled = true;
			return true;
		}
	}
	function PushSearchButton() {
		custCode = document.inform.CUST_CODE.value; //得意先コード
		if (custCode == "") {
			alert("得意先コードが未入力です");
			return false;
		}
		document.inform.BUTTON_ID.value = 'UC000_01_03';
		document.inform.submit();
	}
	function PushUpdateButton() {
		custCode = document.inform.CUST_CODE.value; //得意先コード
		radiotype = document.inform.RADIO_TYPE.value; //ラジオボタンのvalue値
		if (custCode == "") {
			alert("得意先コードが未入力です");
			return false;
		}
		if (radiotype == 0) {
			//登録/変更/削除時に未選択状態
			alert("登録/変更/削除のいずれかを選択してください");
			return false;
		}
		if (radiotype == "1") {
			document.inform.BUTTON_ID.value = 'UC000_01_04';
		} else if (radiotype == "2") {
			document.inform.BUTTON_ID.value = 'UC000_01_05';
		} else if (radiotype == "3") {
			flg = confirm("削除してもよろしいですか？");
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
		//sessionScopeがnullならログイン画面へリダイレクト
		if ( session.getAttribute( "employee" ) == null || "".equals( session.getAttribute( "employee" ) ) ) {
			String name = (String) session.getAttribute( "employee" );
			System.out.println( "  sessionScope = " + name );
			response.sendRedirect( "/jsys/Login.html" );
		}
	%>
	<div style="text-align: right;">
		ようこそ
		<c:out value="${sessionScope.employee.empName }" />
		さん。 <a href="/jsys/Logout.jsp">ログアウト</a>
	</div>
	<%
		//ラジオボタンのvalue値を取得し、nullなら1をいれて登録が標準でcheckedなるように
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
		<h2>得意先 登録｜変更｜削除</h2>
	</div>
	<div style="text-align: center; color: red;">
		<c:out value="${requestScope.message}" />
	</div>
	<form action="/jsys/jsys" method="post" name="inform">
		<input type="hidden" name="BUTTON_ID" value="">
		<div style="text-align: center;">
			<label>
				登録
				<input type="radio" name="RADIO_TYPE" value="1"
					onclick="return TextDisable()"
				>
			</label>
			|
			<label>
				変更
				<input type="radio" name="RADIO_TYPE" value="2"
					<%if ( radio == 2 ) {
				out.print( " checked" );
			}%>
					onclick="return TextDisable()"
				>
			</label>
			|
			<label>
				削除
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
					<td nowrap>得意先コード</td>
					<td nowrap>
						<input type="text" name="CUST_CODE"
							value="${requestScope.customer.custCode }" maxlength="6"
							size="10"
						/>
					</td>
					<td>
						<input type="button" value="検索"
							onclick="return PushSearchButton()"
						>
					</td>
				</tr>
				<tr>
					<td nowrap>得意先名</td>
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
					<td nowrap>電話番号</td>
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
					<td nowrap>郵便番号</td>
					<td nowrap>
						<input type="text" name="CUST_POSTAL"
							value="${requestScope.customer.postalCode }" maxlength="8"
							size="10" pattern="\d{3}-\d{4}"
							title="郵便番号は、3桁の数字、ハイフン（-）、4桁の数字の順で記入してください。"
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
					<td nowrap>住所</td>
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
				<input type="button" value="実行" onClick="return PushUpdateButton()">
				<input type="button" value="クリア" onClick="ClearFormAll()">
			</p>
			<input type="button" value="メニュー画面に戻る"
				onclick="this.form.BUTTON_ID.value='UC999_01'; this.form.submit();"
			>
		</div>
	</form>
</body>
</html>


