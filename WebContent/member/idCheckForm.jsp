<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<style type="text/css">
		#wrap {
			width: 490px;
			text-align :center;
			margin: 0 auto 0 auto;
		}
		
		#chk{
			text-align :center;
		}
		
		#cancelBtn{
			visibility:visible;
		}
		
		#useBtn{
			 visibility:hidden;
		}

	</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
%>
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form action="idCheckPro.jsp" method="post" name="wfr">
			<input type="text" name="id" required="required" value="<%=id%>">
			<input type="submit" value="중복확인" >
		</form>
		<div id="msg"></div>
		<form action="idCheckFrom.jsp" method="post" name=fr>
		<br>
		<script>
function sendCheckValue(){
	 var id=document.wfr.id.value;
	 opener.fr.id.value=document.wfr.id.value;
	window.close();
}
	</script>
		<input id="cancelBtn" type="button" name=check value="확인" onclick="sendCheckValue()">
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
	</form>
	</div>
</div>	
</body>
</html>