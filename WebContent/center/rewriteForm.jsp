<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
<title>tour write</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 top 파일로 가야함 한단계위로올라가려면 ../ 해줘야한다 (.은 현재위치) inc폴더찾기 -->
	<!-- 상대참조 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="subtour_img"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">홍보게시판</a></li>
<li><a href="../center/fnotice.jsp">자료실</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<%
//세션값 가져오기 //세션값 없으면 login.jsp로 이동
String id=(String)session.getAttribute("id");
	if(id==null){
	response.sendRedirect("../member/login.jsp");	
	
}
	int num=Integer.parseInt(request.getParameter("num"));
	int re_ref =Integer.parseInt(request.getParameter("re_ref"));
	int re_lev =Integer.parseInt(request.getParameter("re_lev"));
	int re_seq =Integer.parseInt(request.getParameter("re_seq"));
%>
<h1>Review rewrite</h1>
<script type="text/javascript">
function fun1(){
	if(document.fr.name.value.length==0){
		alert("이름을 입력해주세요.")
		return false;
	}
	if(document.fr.pass.value.length==0){
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	if(document.fr.subject.value.length==0){
		alert("제목을 작성해주세요.")
		return false;
	}
	if(document.fr.content.value.length==0){
		alert("내용이 없습니다.")
		return false;
	}
}
</script>
<form action="rewritePro.jsp" method="post" id="rewriteForm" name="rewriteForm">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id%>"></td></tr>
<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="[답글]"></td></tr>
<tr><td>내용</td>
<td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="글쓰기" class="btn">
</div>
</form>
</article>

<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>