<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		table{
/* 			margin-left:auto;  */
/* 			margin-right:auto; */
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>


<script type="text/javascript">
		// 비밀번호 미입력시 경고창
		function checkValue(){
			if(!document.deleteform.password.value){
				alert("비밀번호를 입력하지 않았습니다.");
				return false;
			}
		}
	</script>
</head>
<body>
<%
String id =(String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("login.jsp");
}

%>
<b><font size="6" color="gray">회원 탈퇴</font></b>
<br><br>
<form action="deletePro.jsp" method="post" onsubmit="return checkValue()">
<table>
<tr>
	<td bgcolor="skyblue">아이디 : </td>
	<td><input type="text" name="id" value="<%=id%>" readonly></td>
	<td bgcolor="skyblue">비밀번호 : </td>
	<td><input type="password" name="pass" maxlength="20"></td>
	</tr>
	</table>
	<input type="submit" value="회원정보삭제">
	</form>
</body>
</html>
