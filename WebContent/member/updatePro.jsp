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
<%//한글처리
//파라미터 가져오기
//MemberBean mb 객체생성
//멤버변수 <- 파라미터 값 저장
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String mobile = request.getParameter("mobile");
MemberBean mb = new MemberBean();
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);

MemberDAO mdao = new MemberDAO();
int check = mdao.userCheck(id, pass);
if(check == 1){
	mdao.updateMember(mb);
	response.sendRedirect("../main/main.jsp");
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