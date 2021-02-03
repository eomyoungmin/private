<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<style>{
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: table;
  background-color: black;
}

@font-face {
  font-family: neon;
  src: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/707108/neon.ttf);
}

.container {
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}

.neon {
  font-family: neon;
  color: #FB4264;
  font-size: 2vw;
  line-height: 2vw;
  text-shadow: 0 0 1vw #F40A35;
}

.flux {
  font-family: neon;
  color: #426DFB;
  font-size: 2vw;
  line-height: 2vw;
  text-shadow: 0 0 1vw #2356FF;
}

.neon {
  animation: neon 1s ease infinite;
  -moz-animation: neon 1s ease infinite;
  -webkit-animation: neon 1s ease infinite;
}

@keyframes neon {
  0%,
  100% {
    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
    color: #FED128;
  }
  50% {
    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
    color: #806914;
  }
}

.flux {
  animation: flux 2s linear infinite;
  -moz-animation: flux 2s linear infinite;
  -webkit-animation: flux 2s linear infinite;
  -o-animation: flux 2s linear infinite;
}

@keyframes flux {
  0%,
  100% {
    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
    color: #28D7FE;
  }
  50% {
    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
    color: #146C80;
  }
}
</style>
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>

<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/123....jpg"
 width="971" height="300"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div id="solution">
<div id="hosting">
<h3>우리동네</h3>
<p>우리 동네 구석구석 숨어 있는 다양한 사람들과</p>
</div>
<div id="security">
<h3>생활문화</h3>
<p>생활과 문화를 다함께 즐길 수 있는</p>
</div>
<div id="payment">
<h3>동호회</h3>
<p>동호회를 가입해서 유익한 인연을 만나세요~.</p>
</div>
</div>
<div class="clear"></div>
<div id="sec_news">
<h3><span class="orange">Advertising</span></h3>
<div class="container">
  <div class="neon">10월의 행운 </div> <div class="flux"> 특급 할인~ ↘Click</div>
</div>
<table>
<tr onclick="location.href='../center/fnotice.jsp'">
<td colspan="2"><img src="../upload/ad2.jpg" width="350" height="160"><br></td></tr>
</table>
</div>
<div id="news_notice">
<h3 class="brown">최근게시글</h3>
<table>
<%
String id = (String)session.getAttribute("id");
int pageSize = 5;
int startRow = 1;
BoardDAO bdao=new BoardDAO();
List boardList=bdao.getBoardList(startRow, pageSize);
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
for(int i=0; i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i);
%>
<%if(id == null){
	%><tr><td class="contxt"><a href="../member/login.jsp">
	<%=bb.getSubject()%></a></td>
	<td><%=sdf.format(bb.getDate()) %></td></tr><%
	%>
<%}else{
%><tr><td class="contxt"><a href="../center/content.jsp?num=<%=bb.getNum()%>">
<%=bb.getSubject()%></a></td>
<td><%=sdf.format(bb.getDate()) %></td></tr><%
}%>
<%}
%>
</table>
</div>
</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>