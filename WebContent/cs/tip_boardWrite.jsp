<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">



<style>
section{margin:auto;
width:100%;
height:1100px;
}
h1{position:relative;
top:80px;
left:400px;
font-size:20pt;}
th{
width:100px;
text-align:center;
}
.btnwich{
position:absolute;
left:49%;
}
#listpage{
margin-left:18px;
}
.container{position:relative;
top:100px;}

#category{position:relative;
top:5px;
width:150px;
height:30px;
}

footer{
height:200px;
width:100%;
background:#D6503E; 
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWrite</title>
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
 <!-- include summernote css/js-->
 <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
 <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	$('#contents').summernote({
		width:1000,
		minWidth:1000,
		maxWidth:1000,
        height: 500,                 // set editor height
        minHeight: 500,             // set minimum height of editor
        maxHeight: 500,             // set maximum height of editor
        focus: true                    // set focus to editable area after initializing summernote
    });
});
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
<section>
<b><h1>게시글 작성 </h1></b>


<div class="container">
<table class="table table-bordered">
    <thead>
        
    </thead>
    <tbody>
     <form action="tip.do?command=insert" method=post onsubmit="return boardcheck()" > 
              <tr >
                <th width=250px>카테고리</th>
                
                <td><input type="text" name="category" id="category" value=정보&팁 readonly class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>작성자</th>
                <td width=250px><input type="text" name="writer" id="writer" value=${ID} readonly class="form-control"/></td>
            </tr>
            <tr>
                <th>현지 연락처</th>
                <td><input type="text" placeholder="sns 및 카카오톡 ID를 입력하세요. " name="kakao" id="kakao" class="form-control"/></td>
            </tr>
             <tr>
                <th>제목</th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title" id="title" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="contents" id="contents" value="" style=display:none;></textarea></td>
            </tr>
             <tr height="50">
                <td colspan="2">
                    <div class="btnwich"><input type="submit" value="등록">
                    <input type="button" id="listpage" value="취소" onclick="location.href='?pageChange=tip_view.jsp'"></div>
                    
                 </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
</section>
<footer>
 제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
</footer>
</body>
</html>