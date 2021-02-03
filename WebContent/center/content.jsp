<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
// int num 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao 객체생성
BoardDAO bdao = new BoardDAO();
// 조회수 증가 메서드 호출
bdao.updateReadcount(num);
// 리턴할형 BoardBean bb = getBoard(num) 메서드 만들고 호출 (글하나 하나의 바구니)
BoardBean bb = bdao.getBoard(num);
%>
<!-- 게시판 -->
<article>
<h1>Notice Content</h1>
<table id="notice">
<tr><td>글번호</td><td><%=bb.getNum() %></td>
    <td>글쓴날짜</td><td><%=bb.getDate() %></td></tr>
<tr><td>작성자</td><td><%=bb.getName() %></td>
    <td>조회수</td><td><%=bb.getReadcount() %></td></tr>
<tr><td>제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
<tr><td>내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
</table>

<div id="table_search">
<%
// 세션값 가져오기
// 세션값이 있으면 
// 세션값 글쓴이 일치하면 글수정, 글삭제 버튼 보이기 자기가 쓴 글만 삭제하고 수정하기
String id = (String)session.getAttribute("id");
if(id != null){
	if(id.equals(bb.getName())){
%>
<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
<input type="button" value="글삭제" class="btn" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
<%
	}else if(id.equals("admin")){
		%>
		<input type="button" value="글수정" class="btn" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
		<input type="button" value="글삭제" class="btn" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
		<%
	}
}
%>

<input type="button" value="글목록" class="btn" onclick="location.href='notice.jsp'">
</div>
<div class="clear"></div>
<div id="page_control">
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