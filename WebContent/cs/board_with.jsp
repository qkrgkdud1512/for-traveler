<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
  <link rel="stylesheet" href="css/board_with.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 <!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<style>
section{
width:100%;
height:1500px;
}
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
.container{
position:absolute;
top:800px;
left:20%;
}
</style>
<script>

$(document).ready(function() {
	$('#contents').summernote({
		width:1030,
		minWidth:1030,
		maxWidth:1030,
        height: 600,                 // set editor height
        minHeight: 600,             // set minimum height of editor
        maxHeight: 600,             // set maximum height of editor
        focus: true                    // set focus to editable area after initializing summernote
    });
});
function readURL(input) {
	
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          	console.log(e.target.result);
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>WithMEWrite</title>
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


<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>

<div class="container">
<table class="table table-bordered">
    <thead>
        <h1>게시글 작성</h1>
    </thead>
    <tbody>
      <form action=""  method="post" onsubmit="return boardcheck()" >
              <tr>
                <th width=250px>카테고리</th>
                <td><input class="form-control" name="category" id="category" value="함께해요"  readonly class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>작성자</th>
                <td width=250px><input type="text" name="writer" id="writer" value="${ID}" readonly class="form-control"/></td>
            </tr>
             <tr>
                <th>제목</th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="title" id="title" class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>투어일자</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
            <tr>
                <th width=250px>모집기간</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>모집인원</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>제한조건</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>연락처</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
            <tr>
                <th width=250px>대표이미지</th>
                <td><img id="blah" src="http://placehold.it/180" alt="your image" /><input type='file' onchange="readURL(this);" /></td>
            </tr>
            <tr>
                <th width=250px>사진검색</th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
               <tr>
                <th width=250px></th>
                <td width=250px><input type="text" name="writer" id="" value=""  class="form-control"/></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="contents" id="contents" value=""></textarea></td>
            </tr>
             <tr height="50">
                <td colspan="2">
                    <div class="btnwich"><input type="submit" value="등록">
                    <input type="button" id="listpage" value="취소" onclick="location.href='?pageChange=WithMe.jsp'"></div>
                 </td>
            </tr>
        </form>
    </tbody>
</table>
</div>
 </section>

 </body>
</html>