<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
  <link rel="stylesheet" href="css/board_with.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <link rel='stylesheet' href='https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css'>
<link rel='stylesheet' href='https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css'><link rel="stylesheet" href="css/style.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" 
        type="text/javascript" language="javascript"> </script>
<script>
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
        	console.log(e.target.result);
            $('#blah').attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}
</script>


<style>
section {
	width: 100%;
	height: 2000px;
}

th {
	width: 100px;
	text-align: center;
}

.btnwich {
	position: absolute;
	left: 49%;
}

#listpage {
	margin-left: 18px;
}

.container {
	position: absolute;
	top: 800px;
	left: 20%;
}

footer {
	position: relative;
	height: 200px;
	width: 100%;
	background: #D6503E;
}

.btnwich {
	position: relative;
	top: -100px;
}

#preview img {
	width: 150px;
	height: 150px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	width: 200px;
	height: 250px;
	padding: 0px;
	border-radius: 2px;
	margin: 0px;
	float: left;
	margin-bottom: 25px
}

#text_box {
	position: relative;
	left: 320px;
	width: 815px;
	height: 200px;
	top: -250px;
}

#a_tag {
	position: relative;
    top: -245px;
    left: 35px;
    color:red;
}

#p_tag {
	position: relative;
	top: -15px;
	left: 40px;
}

.myButton {
	position: relative;
	top: -515px;
	left: 12px;
	box-shadow: inset 0px 1px 1px -48px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 5px;
	border: 2px solid #dcdcdc;
	display: inline;
	cursor: pointer;
	color: #000000;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	text-decoration: none;
}

.myButton:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.myButton:active {
	position: relative;
}

label {
	font-size: 12pt;
	position: relative;
	top:0px;
}

.thumbnail {
	vertical-align: bottom;
	position: relative;
	left: 30px;
	margin-top: 50px;
}

.wrapper {
	position: relative;
	left: 125px;
}

h2 {
	position: relative;
	top: -10px;
	left: 30px;
}

#text_area {
	position: pixed;
	width: 1022px;
	height: 150px;
	resize: none; /* 사용자 임의 변경 불가 */
}

tbody {
	position: relative;
	width: 800px;
}

.ellip {
		white-space:nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
</style>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>WithMEWrite</title>
 </head>
 <body>

  <section>

<!-- 메인배너   -->
<div class="mainbox" >
<img src="img/08.jpg"width="100%" height="500"/>
</div>

<!-- 테이블 -->
<div class="container">
<table class="table table-bordered">
    <thead>
        <h2>게시글 작성</h2>
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
                <td><input type="text" placeholder="제목을 입력하세요." name="title" id="title" class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>투어일자</th>
                <td width=250px><input type="text" name="writer" id="" placeholder="투어일자를 입력하세요."  class="form-control"/></td>
            </tr>
            <tr>
                <th width=250px>모집기간</th>
                <td width=250px><input type="text" name="writer" placeholder="인원 모집기간을 입력하세요."  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>모집인원</th>
                <td width=250px><input type="text" name="writer" placeholder="모집인원수"  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>제한조건</th>
                <td width=250px><input type="text" name="writer" placeholder="모집조건"  class="form-control"/></td>
            </tr>
             <tr>
                <th width=250px>연락처</th>
                <td width=250px><input type="text" name="writer" id="" placeholder="휴대폰번호를 입력하세요."  class="form-control"/></td>
            </tr>
             <tr>
                <th>사진첨부</th>
                <td width=250px>
                <label class="waves-effect waves-teal btn-flat" for="uploadInputBox"/>Click!
                 <!-- 미리보기 영역 -->
			<div id="preview" class="content"></div>
			
			<!-- multipart 업로드시 영역 -->
			<form id="uploadForm" style="display:line" />
		</div>

                 </td>
                 </tr>
                 
                 <tr>
                <th>내용</th>
                 <td width=250px>
                 <textarea id="text_area" 'cols="100" rows="10">
                 </textarea> 
                 </td>
                 </tr>
                 </tbody>
                 </table>
                 <input type="submit" value="등록">
                 </form>
<!-- 하단테이블 -->
<div class="wrapper">
		<div class="header">
		</div>
		<div class="body">
			<!-- 첨부 버튼 -->
			<div id="attach">
				<input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple/>
			</div>
			
			
		
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script> -->
	<script>
	
		var files = {};
		var previewIndex = 0;
		function addPreview(input) {
			var n = $( '#preview>div' ).length;
			 if( n > 4){
				 alert("사진은 5개까지만 첨부할수있습니다 ");
				 return ;
			 }
			if (input[0].files) {
				for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
					var file = input[0].files[fileIndex];

					if (validation(file.name))
						continue;

					var reader = new FileReader();
					reader.onload = function(img) {
						var imgNum = previewIndex++;
						$("#preview")
								.append(
										"<div class=\"preview-box\" value=\"" + imgNum +"\">"
												+ "<img class=\"thumbnail\" id=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
												+ "<p id='p_tag'>"
												+ "<div class='ellip' style='width:200px;'>"+file.name+"</div>"
												+ "</p>"
												+ "<a id='a_tag' href=\"#\" value=\""
												+ imgNum
												+ "\" onclick=\"deletePreview(this)\">"
												+ "X" + "</a>" + "</div>");
						
						
						files[imgNum] = file;
					};
					reader.readAsDataURL(file);
				}
			} else
				alert('invalid file input'); 
		}

		function deletePreview(obj) {
			var imgNum = obj.attributes['value'].value;
			delete files[imgNum];
			$("#preview .preview-box[value=" + imgNum + "]").remove();
			resizeHeight();
		}

		function validation(fileName) {
			fileName = fileName + "";
			var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
			var fileNameExtension = fileName.toLowerCase().substring(
					fileNameExtensionIndex, fileName.length);
			if (!((fileNameExtension === 'jpg')
					|| (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
				alert('jpg, gif, png 확장자만 업로드 가능합니다.');
				return true;
			} else {
				return false;
			}
		}

		$(document).ready(function() {
			$('.submit a').on('click',function() {	
				var form = $('#uploadForm')[0];
				var formData = new FormData(form);
	
				for (var index = 0; index < Object.keys(files).length; index++) {
					formData.append('files',files[index]);
				}
				$.ajax({
					type : 'POST',
					enctype : 'multipart/form-data',
					processData : false,
					contentType : false,
					cache : false,
					timeout : 600000,
					url : '/imageupload',
					dataType : 'JSON',
					data : formData,
					success : function(result) {

						if (result === -1) {
							alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
						} else if (result === -2) {
							alert('파일이 10MB를 초과하였습니다.');

						} else {
							alert('이미지 업로드 성공');
						}
					}
				});
			});
			$('#attach input[type=file]').change(function() {
				addPreview($(this)); 
			});
		});
	</script>

</section>

</div>
<footer>
제작자 : 박하영, 홍준영, 한상혁<br>
   copyright © TOURTIPS Inc. All rights Reserved.
</footer>
 </body>
</html>