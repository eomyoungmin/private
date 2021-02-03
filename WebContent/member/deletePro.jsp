<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
String id = request.getParameter("id");
String pass = request.getParameter("pass");
MemberDAO mdao=new MemberDAO();
int check=mdao.userCheck(id, pass);
if(check == 1){
	MemberBean mb = new MemberBean();
	mb.setId(id);
	mb.setPass(pass);
	session.invalidate();
	mdao.deleteMember(mb);
	response.sendRedirect("login.jsp");
}else if(check == 0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back(); // 뒤로이동 
	</script>
	<%
}else if(check == -1){
	%>
	<script type="text/javascript">
			alert("아이디 없음");
			history.back(); // 뒤로이동 
	</script>
	<%
}
%>
</body>
</html>