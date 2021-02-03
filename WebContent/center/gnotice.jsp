
<%@page import="gboard.GboardBean"%>
<%@page import="gboard.GboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style rel="stylesheet">
@charset "UTF-8";

@CHARSET "UTF-8";

#sub_img{width: 971px;height: 179px;
background-image: url("../images/company/sub_back.png");
background-repeat: no-repeat;
background-position: left top;}
/*너비 971px 높이179px 
배경이미지 images/company/sub_back.png
반복 no 위치 left top*/
#sub_menu{width: 238px; float: left;margin: 20px;
font-family:Verdana,Geneva,sans-serif;font-size:1em  }
/*너비 238px 정렬 왼쪽 밖여백20px
글자체 Verdana,Geneva,sans-serif 글자크기 1em*/
#sub_menu ul{margin: 20px 0 0 10px; list-style: none;
}/*밖여백 20 0 0 10 리스트스타일none*/
#sub_menu a{text-decoration: none;color: #666;
display:block;height: 15px;width: 150px;padding: 7px;
border-bottom-width: 1px;border-bottom-style: dotted;
border-bottom-color: #999;
background-image: url("../images/bullet.gif");
background-repeat: no-repeat;
background-position: right center;}
/*밑줄 none 글자색 #666
높이 15px 너비150px 안여백7px
테두리 아래너비 1px 테두리아래스타일 dotted 
테두리아래색 #999 배경이미지 images/bullet.gif
반복no 위치right center*/
#sub_menu a:hover{color: #F90;
background-image: url("../images/bullet_orange.gif");
background-repeat: no-repeat;
background-position: right center;}/*배경이미지 bullet_orange.gif
반복 no 위치right center 글자색 color#F90 */
article{float: right;width: 660px;
padding-right: 30px;
font-family: Verdana,Geneva,sans-serif;
font-size: 1em;line-height: 1.5em}
/*정렬 오른쪽 너비 660px 안오른쪽여백 30px
글자체Verdana,Geneva,sans-serif 글자크기1em 
줄간격1.5em */
article h1{font-family: "Times New Roman";
font-size: 45px; color: #CCC; margin: 20px 0;
font-weight: normal;
}/*글자체 Times New Roman 글자크기 45px
글자색 #CCC 밖여백20px 0  글자굵기 normal*/
article p{padding-left: 10px}/*안왼쪽여백 10px*/
figure.ceo{float: right;margin: 5px;}/*정렬 오른쪽 밖여백 5px*/
figcaption{text-align: center;color:#39F }
/*글자정렬 가운데 글자색 #39F*/
.clear{clear: both;}
/*------------------*/
#sub_img_center{width: 971px;height: 179px;
background-image: url("../images/center/to3.jpg");
background-repeat: no-repeat;
background-position: center top;}
/*너비 971 높이179 
배경이미지 images/center/sub_back.png
반복 no 위치left top */
article table#notice{width: 670px;
border-collapse: collapse;}
/*너비 670 테이블공간없애기*/
@font-face{font-family: "seo";
src: url("../images/segoeui.eot");
src: local(""),
     url("../images/segoeui.woff")format("woff"),
     url("../images/segoeui.ttf")format("truetype");}
article table#notice th{height: 20px;
text-transform: capitalize;font-size: 14px;
font-family: seo; font-weight: bold;padding: 5px;
background-image: url("../images/center/t_back.jpg");
background-repeat: repeat-x;
background-position: center center; color:#FFF }
/*높이 20 첫글자대문자
글자크기 14 글자모양 seo 굵기 bold 안여백 5px
배경이미지 images/center/t_back.jpg 반복 x 
위치 center center 글자색 #FFF*/
article table#notice td{text-align: center;
padding: 6px 0; border-bottom-width: 1px;
border-bottom-style: dotted;border-bottom-color: #999}
/*글자정렬 center
안여백 6px 0 테두리아래너비 1px 테두리아래스타일dotted
테두리아래색 #999*/
article table#notice td.left{text-align: left;}
article table#notice td.llll{text-align: center;}
/*글자정렬 left*/
article th.tno{width: 50px;
border-top-left-radius:5px;
border-bottom-left-radius:5px;
}/*너비 50px 
왼쪽위 둥글게5px 왼쪽아래 둥글게5px*/
article th.ttitle{width: 400px; letter-spacing: 0.7em}
/*너비 400px 문자간격 0.7em*/
article th.twrite{width: 100px;}
/*너비 100px*/
article th.tdate{width: 50px;}
/*너비 50px*/
article th.tread{width: 50px;
border-top-right-radius:5px;
border-bottom-right-radius:5px;}
/*너비 50px 
오른쪽위 둥글게5px 오른쪽아래 둥글게5px*/
article #table_search{margin: 15px 0 10px 0;
text-align: right;
}
/*밖여백 15px 0 10px 0 정렬 right*/
#table_search .input_box{height: 20px; width: 200px;
border-radius:10px;background-color: #FEFDED;
border: 1px solid #333}
/*높이 20px 너비 200px
테두리 1px solid #333 테두리둥글게 10px 배경색#FEFDED*/
#table_search .btn{padding: 2px;margin: 0 0 0 5px;
width: 90px;height: 23px;border: 1px solid #999;
border-radius:10px;color: #FFF;
background-image: url("../images/center/t_back.jpg");
background-repeat: repeat-x;
background-position: center center;}

/*안여백 2px 밖여백 0 0 0 5px
너비 90 높이 23 테두리 1 solid #999 테두리둥글게 10px
글자색 #FFF 
배경이미지 t_back.jpg repeat-x center center*/
#page_control{text-align: center; margin: 20px 0 0 0;
margin-right: auto;margin-left: auto;}
/*글자정렬 center 밖여백 20px 0 0 0
밖여백오른쪽 auto 밖여백왼쪽 auto*/
#page_control a{padding: 2px 5px; text-decoration: none;
color: #333; margin: 0 5px;}
/*안여백 2px 5px 밑줄 none 글자색#333 밖여백 0 5px*/
#page_control a:hover{font-weight: bold; color: #F90;
text-decoration: underline;}
/*글자굵기bold 글자색#F90 밑줄 underline*/
article table#notice td:hover{
	background-color: #EEFDFF;
cursor: pointer;cursor: hand;}

커서 pointer 커서 hand*/
/*------------------*/
#sub_img_member{width: 971px;height: 179px;
background-image: url("../images/member/sub_back.png");
background-repeat: no-repeat;
background-position: left top;}
form#join {margin:10px 0 0 0; width: 670px}
/*밖여백 10px 0 0 0 너비670px*/
form#join fieldset{padding: 10px 0 20px 5px;
border: none;}
/*안여백 10px 0 20px 5px 테두리없음*/
form#join fieldset legend{font-family: seo;
font-size: 20px; border-bottom: 1px dotted #666;
width: 600px; padding: 5px 0;}
/*글자체 seo 글자크기20px
테두리아래 1px dotted #666 너비600px 안여백 5px 0*/
form#join label{width: 140px;float: left;
margin: 5px 0}
/*너비 140px 정렬 왼쪽 밖여백 5px 0*/
form#join input{margin: 5px 0; border: 1px solid #999;
background-color:#FCFDEA }
/*밖여백 5px 0 테두리 1px solid #999
배경색 #FCFDEA*/
form#join input.id{width: 100px;
height: 18px;}/*너비 100px 높이 18px*/
form#join input.dup{width: 120px; height: 23px;
border-radius:8px; border: none;
margin: 0 0 0 5px; font-weight: bold;color: #FFF;
background-image: url("../images/member/dup.jpg");
background-repeat: repeat-x;
background-position: center center;}
/*너비 120px 높이23px 
테두리둥글게 8px 테두리none 밖여백 0 0 0 5px
글자굵기bold 글자색 #FFF 
배경이미지 images/member/dup.jpg
repeat-x center center*/
form#join #buttons .submit,form#join #buttons .cancel{
	height: 30px; width: 150px; border: 1px solid #666;
	border-radius:10px; box-shadow:3px 3px 2px #CCC;
	font-size: 14px;
}
/*높이 30px 너비150px 테두리 1px solid #666
테두리둥글게 10px 박스그림자 3px 3px 2px #CCC
글자크기 14px*/
form#join #buttons .submit{
background-image: url("../images/member/submit_back.jpg");
background-repeat: repeat-x;
background-position: center center;
color: #fff;
}/*
배경이미지 images/member/submit_back.jpg
repeat-x center center 글자색 #fff*/
form#join #buttons .cancel{margin: 0 0 0 20px;
background-image: url("../images/member/cancel_back.jpg");
background-repeat: repeat-x;
background-position: center center;
color: #fff;
}
/*밖여백 0 0 0 20px
배경이미지 images/member/cancel_back.jpg
repeat-x center center*/




</style>
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
GboardDAO bdao=new GboardDAO();
// 게시판 글 전체 개수 select count(*) from board
// int count = getBoardCount() 메서드 만들기 호출
int count = bdao.getBoardCount();
// List boardList   = getBoardList() 메서드 만들 호출
int pageSize = 12;
String pageNum=request.getParameter("pageNum");
//pageNum없으면  "1" 페이지 설정
if(pageNum==null){
	pageNum="1";
}
int currentPage = Integer.parseInt(pageNum);
int startRow= (currentPage-1)*pageSize+1;
List boardList=bdao.getBoardList(startRow, pageSize);
int pageList = 4;
// 날짜 => 원하는 모양을 변경 문자열 결과값
SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%>
<!-- 게시판 -->
<article>
<h1>File Notice</h1>
<table id="notice">
<%
for(int i = 0 ; i <= boardList.size()/4 ; i++){
	%><tr>
	<%
	for( int j = i*pageList; j<((i+1)*pageList) ; j++){
	GboardBean bb = (GboardBean)boardList.get(j);
		%>
		<td><table border="1">
    	<tr onclick="location.href='../center/gcontent.jsp?num=<%=bb.getNum() %>'"><td colspan="2" class="llll">제목:<%=bb.getSubject() %></td></tr>
    	<tr onclick="location.href='../center/gcontent.jsp?num=<%=bb.getNum() %>'"><td colspan="2"><img src="../upload/<%=bb.getFile()%>" width="160" height="160"></td></tr>
    	<tr onclick="location.href='../center/gcontent.jsp?num=<%=bb.getNum() %>'"><td colspan="2">작성자 : <%=bb.getName() %></td></tr>
    <tr><td>조회수</td>
    <td><%=bb.getReadcount() %></td>
    </tr>
    </table></td>
	 <%
	 if(j>=boardList.size()-1){
		 break;
	 }
	 %>
    <%}%>
    </tr>
<%}%>
</table>
<div id="table_search">

<% 
if(id == null){
	%><input type="button" value="글쓰기" class="btn" onclick='location.href="../member/login.jsp"'><%
}else{
	%>
<input type="button" value="글쓰기" class="btn" onclick="location.href='gwriteForm.jsp'">
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
	%><a href="gnotice.jsp?pageNum=<%=startPage-pageBlock %>">prev</a> <%
}
for(int j = startPage; j<=endPage; j++){
	%><a href="gnotice.jsp?pageNum=<%=j%>"><%=j%></a><%	
		
}
if(endPage < pageCount){
	%><a href="gnotice.jsp?pageNum=<%=startPage+pageBlock%>">next</a><%
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