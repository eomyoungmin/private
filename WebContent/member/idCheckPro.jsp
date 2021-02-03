<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
MemberBean mb = new MemberBean();
mb.setId(id);
MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck2(id);
if(check == -1){
	
	%>
	<script type="text/javascript">
		alert("사용가능한 아이디 입니다.");
		location.href="idCheckForm.jsp?id=<%=id%>";
	</script>
	<%
}else if(check == 0){
	%>
	<script type="text/javascript">
		alert("이미 존재하는 아이디 입니다.");
		location.href="idCheckForm.jsp?id=<%=id%>";
	</script>
	<%
}

%>
</body>
</html>