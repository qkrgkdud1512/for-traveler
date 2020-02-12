<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="model.Dto"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<% request.setCharacterEncoding("UTF-8"); %>



<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="./css/header.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script  src="js/header.js"></script>

</head>
<body>
<% 
 String ses=null;
 ses=(String)session.getAttribute("ID");
 if(ses==null){%>
 <jsp:include page="header.jsp"/>
 <%} else{%>
 <jsp:include page="Loginheader.jsp"/>
 <%} %>

<!doctype html>
<!-- JS -->
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tourcity.js"></script>
 <link rel="stylesheet" href="css/tourcity.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
$(document).ready(function() {//현재날짜와 게시글작성일을 비교해서 new출력
	var today=new Date();//날짜를 가져온다
	var dd=today.getDate();//일
	var mm=today.getMonth()+1;//월
	var yyyy=today.getFullYear();//년
	if(dd<10){
		dd='0'+dd
	}
	if(mm<10){
		mm='0'+mm
	}
	var today=yyyy+"-"+mm+"-"+dd;//년-월-일 로 변수에담는다
	var size=$("#size").val();//list사이즈를 변수로 담는다
	
	for(var i=0;i<size;i++){//list사이즈만큼 for문을 돌린다
		if(today==$("#date"+i).val())//현재날짜와 hidden에 담긴 작성일을 비교해서 일치하면 new출력
		$("#newimg"+i).css("display","block"); 		
	}	
});
</script>
<script>
function writepage(){//session 을 ID가sessionchek인 input hidden박스에 value값으로 넣어주고 값 을 비교하여 로그인과 비로그인 구별하여 글쓰기제한둠
	var sessioncheck=$("#sessioncheck").val();
	var check="null";
	if(sessioncheck==check){
		alert("로그인이 필요합니다.");
	} 
	else{
		location.href="tip_boardWrite.jsp";
	}
}
function search(){//검색어를입력안하면 메시지 출력
	var text=$("#searchinfo").val();
	var check="null";
	if(text==check||text==""){
		alert("검색어를 입력하세요.");
		return false;
	}
	true;
}
</script>
<style>
/* 게시판 리스트 목록 */
.sub_news{position:relative;
top:50px;
left:100px;}

.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:80%;border-bottom:1px solid #999;color:#666;font-size:13px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:10px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .date,.sub_news .hit.num{padding:0;font-family:Tahoma;font-size:11px;line-height:normal}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}

/* //게시판 리스트 목록 */

/* 마우스오버 */
#tr_hover:hover {
    background-color:#D6F0FF;}
    

th{
background:yellow;
}
.newimg{
width:30px;
height:20px;
float:left;
display:none;
}
#btnwrite{
position:relative;
top:60px;
left:100px;
}
#scbox{
position:absolute;
top:40px;
left:120px;
}

.sel{position:relative;
width:80px;
height:22px;
top:1.5px;
left:-5px;}
body{margin:auto;}

section {
margin:auto;
width:70%;
height:1100px;
}

footer{
height:200px;
width:100%;
background:#D6503E; 
}

#tablebox{position:relative;
top:90px;
left:100px;
height:500px;
}

h2{position:relative;
top:-30px;
left:150px;
font-size:20pt;}

 aside {
 position: absolute;
top:300px;
 left:1%;
  width: 200px;
  height:260px;
  min-height: 200px;
  padding: 35px;
  margin: 0 22px 44px 22px;
  position: absolute;
  vertical-align: top;
  display: inline-block;
  font-family: Englebert, Arial;
  color: #4b453c;
  background: url(https://i.imgur.com/2BdQt0g.jpg);
  line-height: 34px;
  text-align: center;
  box-shadow: 0 4px 5px rgba(0, 0, 0, 0.2);
  z-index:1111;
}

.sidefixed {
position: fixed; 
top:70px;
}

#Boardselectmenu{font-size:10pt;}

.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}


</style>
<html>
 <head>
  <meta charset="UTF-8">

  <title>board</title>
 </head>
 <body>


<jsp:useBean id="board" class="model.Dto"/>



<!--   사이드메뉴 -->
	<aside>
		<ul class="note-wrap note" style="list-style-type: none">


			<li align="left"><a href="with.jsp">함께해요</a></li>
			<li align="left"><a href="hugi.jsp">여행후기</a></li>
			<li align="left"><a href="tip.jsp">정보 & 팁</a></li>
			<li align="left"><a href="">Q&A</a></li>

		</ul>
	</aside>
<section>
<div id="tablebox">
<h2>정보 & 팁</h2>

<table class="sub_news" border="1" cellspacing="0">
<caption>게시판 리스트</caption>
<colgroup>
<col>
<col width="110">
<col width="100">
<col width="80">
</colgroup>
<thead>
<tr>
<th scope="col" width="30px;">글번호</th>
<th scope="col" width="50px">카테고리</th>
<th scope="col">제목</th>
<th scope="col" width="70px;">글쓴이</th>
<th scope="col" width="50px;">날짜</th>
<th scope="col" width="50px;">조회수</th>
</tr>
</thead>
<%

	ArrayList<Dto> list = (ArrayList<Dto>)request.getAttribute("data");
	 for(int i=0; i<list.size(); i++){
			out.print("<tr>"+"<td width=100 align=center>"+list.get(i).getNumber()+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getCategory()+"</td>");
			out.print("<td width=100 align=center>"+"<a href='tip.do?command=select_contents&number="+list.get(i).getNumber()+"&hits="+list.get(i).getHits()+"'>"+list.get(i).getTitle()+"</a>"+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getWriter()+"</td>");
			out.print("<td width=100 align=center>"+list.get(i).getDate()+"</td>");
			out.print("<td width=150 align=center>"+list.get(i).getHits()+"</td>"+"<tr>");
			
		 }



%>
</table>
<input type="hidden" name="sessioncheck" id="sessioncheck" value="${ID} }">
<input type=button onclick="writepage()" name="write" id="btnwrite" value="글쓰기"/>
<div id="scbox">
<form name="boardsearchform" action="tip_view.jsp" onsubmit="return search()" method="post">
<select class="sel" name="Boardselectmenu" id="Boardselectmenu">
<option value="none" selected>전체</option>
<option value="category">카테고리</option>
<option value="title_contents">제목+내용</option>
<option value="title">제목</option>
<option value="contents">내용</option>
<option value="writer">작성자</option>
<input type="text" value="" name="searchinfo" id="searchinfo">
<input type="submit" value="검색">
</div>
</select>
</form>
</div>
</section>
<footer>
   제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
   </footer>
 </body>
</html>