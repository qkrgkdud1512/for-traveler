<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.Dto"%>
<%@page import="model.Comment_Dto"%>
<%@ page import="java.util.ArrayList" %>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!DOCTYPE html>
<html>

<head>
<style>
section{margin:auto;
width:100%;
height:1100px;
}
th{
width:100px;
text-align:center;
}
#pre{
font-size:12pt;
width:800px;
maxWidth:800px;
height:500px;
maxHeigth:600px;
background:white;
display:"";
}
textarea{
display:none;
}

#viewpage{
float:right;
}
#btnwichbox{
position:absolute;
left:19%;
}
#update{position:relative;
left:-80px;
margin-right:15px;
}
#delete{position:relative;
left:-80px;
}

footer{
height:200px;
width:100%;
background:#D6503E; 
}

.containerset{
position:relative;
top:10%;
left:28%;
width:900px;}

h1{font-weight:bold;
font-size:18pt;
position:relative;
}


h2{font-weight: bold;
font-size:18pt;
top:-10px;
position:relative;
left:85px;}

#comments_box{position:absolute;
left:70px;
width:700px;
height:100px;
}

#comments_btn{position:relative;
right:42px;
width:90px;
height:100px;
float:right;}

.comments{margin-top:30px;
}


</style>


<script>
$(document).ready(function() {//게시글 상세보기를 했을때 세션ID값과 작성자ID가 동일하면 히든버튼 활성화 수정 삭제 가능하게 함
	
	var writer=$("#writer").val();
	var sessionID=$("#sessionID").val();
	
	if(writer==sessionID){
		//alert("d");
		$("#update").attr("type","button");
		$("#delete").attr("type","button");		
	}
});
</script>
<script>
function del(){//삭제버트누를시 정보변경후 삭제실행
	$("#view").attr("action","tip.do?command=delete");
	$("#delete").removeAttr("onclick");
	$("#view").removeAttr("onsubmit");
	$("#delete").attr("type","submit");
}
function up(){//수정버튼누를시 정보변경
	$('#contents').summernote({
		width:800,
		minWidth:800,
		maxWidth:800,
        height: 550,                 // set editor height
        minHeight: 550,             // set minimum height of editor
        maxHeight: 550,             // set maximum height of editor
        focus: true                  // set focus to editable area after initializing summernote
    });
    $("#update").attr("value","등록");
    $("#pre").css("display","none");
    $("#category").removeAttr("readonly");
	$("#title").removeAttr("readonly");
	$("#update").removeAttr("onclick");
	$("#view").attr("onsubmit","return boardcheck()");
	$("#update").attr("type","submit");
	return false;
}
function page(){//목록보기누를시 페이지이동
	location.href='tip.do?command=select';
}
function boardcheck(){
	if($("#category").val()==""||$("#category").val()==null){
		alert("카테고리를 선택해주세요");
		return false;
	}
	if($("#title").val()==""||$("#title").val()==null){
		alert("제목을 입력해주세요");
		return false;
	}
	if($("#contents").val()==""||$("#title").val()==null){
		alert("내용을 입력해주세요");
		return false;
	}
	return true;
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
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
<section>
<%
String no=request.getParameter("NO");//파라미터로 게시글번호 가지고옴
String hits=request.getParameter("hits");//조회수를 가지고옴
//board.hitsUpdate(hits,no);//게시글번호로 해당 조회수 체크후 값+1 증가시켜서 저장(조회수증가처리)
%>
<div class="containerset">
<h1>정보&팁</h1>
<table class="table table-bordered">
<input type="hidden" name="sessionID" id="sessionID" value=${ID}>
<thead>

</thead>
<tbody>
<form action="tip.do?command=update" name="view" id="view" method="post">
<tr>
<%

ArrayList<Dto> list =(ArrayList<Dto>)request.getAttribute("data");//게시글번호로 해당하는 내용들 출력<th width=250px>카테고리</th>
out.print("<input type='hidden' name='number' value='"+list.get(0).getNumber()+"'>");//게시글번호 hidden으로 값저장
out.print("<th>카테고리</th><td><input class='form-control' name='category' id='category' readonly placeholder='카테고리를 선택해주세요' value='"+list.get(0).getCategory()+"'/></td></tr><tr>");//카테고리
out.print("<th>작성자</th><td><input type='text' name='writer' id='writer' value='"+list.get(0).getWriter()+"' readonly class='form-control'/></td></tr><tr>");//작성자
out.print("<th>제목</th><td><input type='text' placeholder='제목을 입력하세요.' name='title' id='title' class='form-control' value='"+list.get(0).getTitle()+"'/></td> </tr><tr>");//제목
out.print("<th>내용</th><td><pre id='pre'>"+list.get(0).getContents()+"</pre>");//컨텐츠 내용이 보여지는 화면 수정버튼 클릭시 display:none 처리
out.print("<textarea name='contents' id='contents'>"+list.get(0).getContents()+"</textarea></td> ");//기본설정은 display:none 이지만 수정버튼 클릭시 활성화 되고 컨텐츠내용을 수정할수있는 입력화면으로 바뀜 

%>
</tr>
<tr height="50">
<td colspan="2">
<div id="btnwichbox"><input name="update" id="update" type="hidden" onclick="return up()" value="수정">
<input name="delete" id="delete" type="hidden" onclick="del()" value="삭제">
</div>
<input name="viewpage" id="viewpage" type="button" onclick="page()" value="목록으로">
</td>
</tr>
</form>
</tbody>
</table>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<hr>


<!-- 댓글등록 -->
<div class="comments">
<h2>COMMENT</h2>
<form action="com.do?command=com_insert" name="comment" id="comment" method="post">


<% ArrayList<Comment_Dto> com_list = (ArrayList<Comment_Dto>)request.getAttribute("data");
for(int i=0; i<com_list.size(); i++){
	%> 
<input type=text name="comments_box" id="comments_box" value=""/>
<input type=submit id="comments_btn" value="댓글등록"/>

<%} %>

</div>
</div>
</form>
</section>
</body>
<footer>
  제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
</footer>
</html>