<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fboard.FboardDAO"%>
<%@page import="fboard.FboardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../center/notice.jsp">홍보게시판</a></li>
<li><a href="../center/fnotice.jsp">자료실</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
String id = (String)session.getAttribute("id");
//BoardDAO bdao 객체생성
FboardDAO bdao=new FboardDAO();
// 게시판 글 전체 개수 select count(*) from board
// int count = getBoardCount() 메서드 만들기 호출
int count = bdao.getBoardCount();
// List boardList   = getBoardList() 메서드 만들 호출
int pageSize = 15;
String pageNum=request.getParameter("pageNum");
//pageNum없으면  "1" 페이지 설정
if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow= (currentPage-1)*pageSize+1;
List boardList=bdao.getBoardList(startRow, pageSize);
// 날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%>
<!-- 게시판 -->
<article>
<h1>File Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    for(int i=0;i<boardList.size();i++){
    	FboardBean bb=(FboardBean)boardList.get(i);
    	%>
    	<%if(id == null){
    		%> <tr onclick="location.href='../member/login.jsp?num=<%=bb.getNum()%>'"><td><%=bb.getNum() %></td>
    	    <td class="left"><%=bb.getSubject() %>
    	    <img src="../upload/<%=bb.getFile()%>" width="50" height="50"></td>
    <td><%=bb.getName() %></td>
    <td><%=sdf.format(bb.getDate()) %></td>
    <td><%=bb.getReadcount() %></td></tr><% 
    	}else{
    		%> <tr onclick="location.href='fcontent.jsp?num=<%=bb.getNum()%>'"><td><%=bb.getNum() %></td>
    	    <td class="left"><img src="../upload/<%=bb.getFile()%>" width="50" height="50">
    	    <%=bb.getSubject() %></td>
    <td><%=bb.getName() %></td>
    <td><%=sdf.format(bb.getDate()) %></td>
    <td><%=bb.getReadcount() %></td></tr>
    	<%
    	}%>

    <%}
    %>
</table>
<div id="table_search">
<form action="fnoticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
<% 
if(id == null){
	%><input type="button" value="글쓰기" class="btn" onclick='location.href="../member/login.jsp"'><%
}else{
	%>
<input type="button" value="글쓰기" class="btn" onclick="location.href='fwriteForm.jsp'">
<%}
%>
</div>
<div class="clear"></div>
<div id="page_control">
<!-- <a href="#">Prev</a> -->
<% 
int pageBlock = 10;
int startPage = (currentPage-1)/pageBlock*pageBlock+1;
int endPage = startPage+pageBlock-1;
int pageCount = count/pageSize + (count%pageSize==0? 0:1); 
if(endPage> pageCount){
	endPage= pageCount;
}
if(startPage > pageBlock){
	%><a href="fnotice.jsp?pageNum=<%=startPage-pageBlock %>">prev</a> <%
}
for(int i = startPage; i<=endPage; i++){
	%><a href="fnotice.jsp?pageNum=<%=i%>"><%=i%></a><%	
		
}
if(endPage < pageCount){
	%><a href="fnotice.jsp?pageNum=<%=startPage+pageBlock%>">next</a><%
}
%>
<!-- <a href="#">1</a><a href="#">2</a><a href="#">3</a> -->
<!-- <a href="#">4</a><a href="#">5</a><a href="#">6</a> -->
<!-- <a href="#">7</a><a href="#">8</a><a href="#">9</a> -->
<!-- <a href="#">10</a> -->
<!-- <a href="#">Next</a> -->
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>