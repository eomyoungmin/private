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
<title>tour writePro</title>
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

<h1>글쓰기완료</h1>
<% // 한글처리
request.setCharacterEncoding("utf-8");
// id,pass,name 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int num=Integer.parseInt(request.getParameter("num"));
int re_ref =Integer.parseInt(request.getParameter("re_ref"));
int re_lev =Integer.parseInt(request.getParameter("re_lev"));
int re_seq =Integer.parseInt(request.getParameter("re_seq"));
// 자바빈 패키지  board 파일 이름 BoardBean 
// BoardBean bb 객체생성
// 자바빈 멤버 변수  <= 파라미터 저장

// 자바빈   패키지 board 파일이름 BoardBean
// BoardBean bb 객체생성
BoardBean bb=new BoardBean();
//자바빈 멤버변수 <= 파라미터 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setRe_ref(re_ref);
bb.setRe_lev(re_lev);
bb.setRe_seq(re_seq);
//디비자바파일 패키지 board 파일이름 BoardDAO
//BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
//insertBoard(bb) 메서드호출
bdao.reInsertBoard(bb);
response.sendRedirect("notice.jsp");
%>

<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>