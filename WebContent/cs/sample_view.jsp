<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="boarder.bean.BoardDto"%>
<%@ page import="boarder.dao.BoardDao"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
String se=null;
se=(String)session.getAttribute("ID");
%>
<!doctype html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



<html>
 <head>
  <meta charset="UTF-8">

  <title>board</title>
 </head>
 <body>
<jsp:useBean id="board" class="boarder.dao.BoardDao"/>
<!-- CSS -->
<link rel="stylesheet" href="css/tourcity.css">
<link rel="stylesheet" href="css/community.css">
<!-- JS -->
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/tourcity.js"></script>
<!--   사이드메뉴 -->
	<aside>
		<ul class="note-wrap note" style="list-style-type: none">


			<li align="left"><a href="?pageChange=with.jsp">함께해요</a></li>
			<li align="left"><a href="?pageChange=hugi.jsp">여행후기</a></li>
			<li align="left"><a href="?pageChange=tip.jsp">정보 & 팁</a></li>

		</ul>
	</aside>

	<!-- <!-- 메인배너   -->
	<div class="mainbox">
		<img src="img/08.jpg" width="100%" height="500" />
	</div>

	<section id="section_in">
		<h1>함께해요</h1>
		<br>
		<br>
		<hr>
		<br>
		<div class="box">
			<div class="view">
				<img src="img/T1.png" width="100%" height="100%" />
				<div class="mask">
					<h3>가족</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat.</p>
					<a href="#" class="info">Read More</a>

				</div>
			</div>


			<div class="view">
				<img src="img/T2.png"  width="100%" height="100%" />
				<div class="mask">
					<h3>연인</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat.</p>
					<a href="#" class="info">Read More</a>

				</div>
			</div>


			<div class="view">
				<img src="img/T3.png" width="100%" height="100%" />
				<div class="mask">
					<h3>힐링</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat.</p>
					<a href="#" class="info">Read More</a>

				</div>
			</div>


			<div class="view">
				<img src="img/T4.png"  width="100%" height="100%" />
				<div class="mask">
					<h3>익사이팅</h3>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat.</p>
					<a href="#" class="info">Read More</a>
				</div>
			</div>
		</div>
</section>
<footer>
 제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
</footer>
 </body>
</html>