<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/resources/css/content.css">
<script type="text/javascript" src="/resources/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
$(function() {
    //모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    });

    //input을 datepicker로 선언
    $("#datepicker").datepicker();                    
    $("#datepicker2").datepicker();
    
    //From의 초기값을 오늘 날짜로 설정
    $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    //To의 초기값을 내일로 설정
    $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
    var fDate =  $('#datepicker').datepicker('getDate');
    $('#datepicker2').datepicker( "option", "minDate", fDate );
    $('#datepicker').change(function() {
	    var nextDayDate = $('#datepicker').datepicker('getDate', '+1d');
	    nextDayDate.setDate(nextDayDate.getDate() + 1);
	    $('#datepicker2').datepicker('setDate', nextDayDate);
	});
 
    
    $('#datepicker').datepicker("option", "minDate",'today');
    $('#datepicker').datepicker("option", "maxDate");
    $('#datepicker').datepicker("option", "onClose", function ( selectedDate ) {
    	$('#datepicker2').datepicker( "option", "minDate", selectedDate );
    	
    });
    
});
</script>

</head>
<body>
<%@ include file="include/header.jsp" %>
	<form action="carListSearch" name="searchName" id="searchId">
		<div class="wrapper">		
			<div class="mainvisual">
				<section class="searchSection">
				<center>
						<div class="search" id="l-search">
							<div class="calenderLabel">
								<label class="DateBind">
									<div class="searchLabel current">
										<img src="/resources/img/start.png" class="icon"> <input
											type="text" id="datepicker" name="rtdate">
									</div>
									<div class="searchLabel searchPartition">
										<img src="/resources/img/end.png" class="icon"> <input
											type="text" id="datepicker2" name="returndate">
									</div>
								</label>
								<div class="searchLabel searchPartition searchCategory">
									<select name="searchOption">
										<option value="allcar">전체</option>
										<option value="경차">경차</option>
										<option value="준중형">준중형</option>
										<option value="중형">중형</option>
										<option value="고급">고급</option>
										<option value="RV">RV</option>
										<option value="승합">승합</option>
									</select>
								</div>		
									<input class="searchimg" type="image" src="/resources/img/search.png">
									<input type="submit" id="submitButton" style="display: none;">
							</div>
						</div>
					
					</center>
				</section>
			</div>
			<section class="carSection" id="centerimg">
				<input type="hidden" name="param" id="pInput">
				<h2 class="carTitle"><span class="point">제이케이렌트카</span> 인기차종</h2>
				<ul class="carList">
					<li class="carLabel">
						<a href="#"  onclick="lightCarSubmitForm()">
							<div class="car1" id="carbox"></div>
							<div class="" id="cartext" >
								<p class="listTitle">모닝 · 스파크</p>
								<p class="listLabel" id="lightCar">경차</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li> 
					<li>
						<a href="#"  onclick="subcompactCarSubmitForm()">
							<div class="car2" id="carbox"></div>
							<div class="" id="cartext">
								<p class="listTitle">쏘울 · 엑센트 · 아반떼</p>
								<p class="listLabel" id="subcompactCar">준중형</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li> 
					<li>
						<a href="#"  onclick="mediumsizedCarSubmitForm()">
							<div class="car3" id="carbox"></div>
							<div class="" id="cartext">
								<p class="listTitle">K5 · 쏘나타 · SM6</p>
								<p class="listLabel" id="mediumsizedCar">중형</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#"  onclick="luxuryCarSubmitForm()">
							<div class="car4" id="carbox"></div>
							<div class="" id="cartext">
								<p class="listTitle">K7 · 그랜져 · 제네시스</p>
								<p class="listLabel" id="luxuryCar">고급</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#"  onclick="RVCarSubmitForm()">
							<div class="car5" id="carbox"></div>
							<div class="" id="cartext">
								<p class="listTitle">니로 · 싼타페 · 펠리세이드</p>
								<p class="listLabel" id="RVCar">RV</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li>
					<li>
						<a href="#"  onclick="vanCarSubmitForm()">
							<div class="car6" id="carbox"></div>
							<div class="" id="cartext">
								<p class="listTitle">카니발 · 그랜드스타렉스</p>
								<p class="listLabel" id="vanCar">승합</p>
								<p class="listLink">예약하기</p>
							</div>
						</a>
					</li>
				</ul>
			</section>			
		</div>
	</div>
	</form>
<%@ include file="include/footer.jsp" %>
</body>
</html>