<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
// member/loginPro.jsp
// id,pass 파라미터 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
// MemberDAO mdao 객체생성
MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck(id, pass);

if(check == 1){
	session.setAttribute("id", id);
	response.sendRedirect("../main/main.jsp");
}else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호 틀림");
	history.back();
	</script>
	<%
}else if (check == -1){
	%>
	<script type="text/javascript">
	alert("아이디 없음");
	history.back();
	</script>
	<%
}
%>
</body>
</html>