<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// request.setCharacterEncoding("utf-8");
String uploadPath = request.getRealPath("/upload");
System.out.print(uploadPath);
// 파일크기
int maxSize = 10*1024*1024;
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
int num=Integer.parseInt(multi.getParameter("num"));
String pass=multi.getParameter("pass");
String name=multi.getParameter("name");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
// file 새롭게 추가 파일
String file = multi.getFilesystemName("file");
// 새롭게 추가할 파일이 업으면 file 기존 파일이름
if(file==null){
	file=multi.getParameter("oldfile");
}

FboardBean bb = new FboardBean();
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
// 파일추가
bb.setFile(file);
FboardDAO bdao= new FboardDAO();
int check = bdao.numCheck(bb);
if(check == 1){
	bdao.updateBoard(bb);
	
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
			alert("아이디 없음");
			history.back(); // 뒤로이동 
	</script>
	<%
}
%>
</body>
</html>