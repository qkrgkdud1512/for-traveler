<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

	<%
		String ses = null;
		ses = (String) session.getAttribute("ID");
		if (ses == null) {
	%>
	<jsp:include page="header.jsp" />
	<%
		} else {
	%>
	<jsp:include page="Loginheader.jsp" />
	<%
		}
	%>
	
	<script>
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num--;
	if(num<=0){
	alert('최소 인원수는 1명이상입니다.');
	num =1;
	}
	$('#numberUpDown').text(num);
	});
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var num = parseInt(stat,10);
	num++;

	if(num>8){
	alert('최대 인원수는 8명입니다.');
	num=5;
	}
	$('#numberUpDown').text(num);
	});
	});

</script>

	<section>
	<link rel="stylesheet" href="css/flight_go.css">
<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet"
			href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
			type="text/css" />

		<script
			src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
		<!-- js -->
		<script language="JavaScript" src="js/index.js" charset="UTF-8"></script>
		
		
		<img src="img/new_banner.jpg">
	<div id="air_box"> 
	
	<!-- 라디오버튼 -->
	
	<label class="box-radio-input">
	<input type="radio" name="cp_item" value="옵션1" checked="checked"><span>왕복</span>
	</label>
    <label class="box-radio-input">
    <input type="radio" name="cp_item" value="옵션2"><span>편도</span>
    </label>
    
    <!-- 인원수 증감-->
    <h2 id="h2_text">인원수</h2>
    <div id="count_number">
    <a herf="#" id="decreaseQuantity"><img src="img/minus.png" width="40px;" height="40px;"></a>
    <span id="numberUpDown">1</span>
    <a herf="#" id="increaseQuantity"><img src="img/plus.png" width="40px;" height="40px;"></a>
    </div>
    
     <!-- 좌석등급-->
         <h2 id="h2_text2">좌석등급</h2>
    <label class="box-radio-input2">
	<input type="radio" name="seat_item" value="옵션1" checked="checked"><span>이코노미</span>
	</label>
    <label class="box-radio-input2">
    <input type="radio" name="seat_item" value="옵션2"><span>비즈니스</span>
    </label>
    <label class="box-radio-input2">
    <input type="radio" name="seat_item" value="옵션3"><span>퍼스트</span>
    </label>
      
              
    <div id = "text_section">     
    <input id="autocomplete" type="text" placeholder="출발지를 입력하세요" value=<%request.getParameter("autocomplete");%>/>
		<br>
		<br>
		<br>
		
		<input id="autocomplete2" type="text" placeholder="목적지를 입력하세요" value=<%request.getParameter("autocomplete2");%>/>
		
		<input class="dal" type="text" placeholder="출발일을 선택하세요" id="testDatepicker" value=<%request.getParameter("dal");%>>
		<input class="dal2" type="text" placeholder="도착일을 선택하세요" id="testDatepicker2" value=<%request.getParameter("dal2");%>>
		<button class="pressDown">
		GO
		</button>
		</div>
	</div>
<div class="inpage">
<h2>3개의 항공권</h2>
<img id="img1" src="img\air_go.jpg" width="800px" height="150px"><br>
<img id="img2" src="img\air_go2.jpg" width="800px" height="150px"><br>
<img id="img3" src="img\air_go3.jpg" width="800px" height="150px">

</div>
	
	</section>
</body>
</html>
