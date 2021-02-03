<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	%>
	<div id="login"><a href="../member/login.jsp">login</a>|
	<a href="../member/test.jsp">회원가입</a></div>
	 <%
}else if(id != null){
	if(id.equals("admin")){
		%>
		<div id="login"><%= id%>님 <a href="../member/logout.jsp"> logout </a>|
		<a href="../member/update.jsp"> 회원정보수정 </a>| 
		<a href="../member/list.jsp"> 회원목록 </a>|
		<a><input type="button" value="메일보내기" name="mail" class="dup" onclick="smail()"></a> 
		</div>
		 <%
	}else{
		%>
		<div id="login"><%= id%>님 <a href="../member/logout.jsp"> logout </a>|<a href="../member/update.jsp"> 회원정보수정</a> |
		<a><input type="button" value="메일보내기" name="mail" class="dup" onclick="smail()"></a> 
		
		</div> <%
	}
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/local1.png" width="265" height="67px" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a class="menuLink" href="../main/main.jsp">HOME</a></li>
	<li><a class="menuLink" href="../company/welcome.jsp">COMPANY</a></li>
	<li><a class="menuLink" href="../center/gnotice.jsp">겔러리</a></li>
	<li><a class="menuLink" href="../center/notice.jsp">홍보게시판</a></li>
	<li><a class="menuLink" href="../center/map.jsp">지도</a></li>
</ul>
</nav>
</header>
<script type="text/javascript">
function smail(){
	var win=window.open("../main/mailForm.jsp", "mail", "width=700, height=650");}
</script>