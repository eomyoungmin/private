<%@page import="fboard.FboardDAO"%>
<%@page import="fboard.FboardBean"%>
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
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
FboardBean bb = new FboardBean();
bb.setNum(num);
bb.setPass(pass);
FboardDAO bdao= new FboardDAO();
int check = bdao.numCheck(bb);
if(check == 1){
	bdao.deleteBoard(bb);
	response.sendRedirect("fnotice.jsp");
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
			alert("게시글 없음");
			history.back(); // 뒤로이동 
	</script>
	<%
}
%>


%>
</body>
</html>