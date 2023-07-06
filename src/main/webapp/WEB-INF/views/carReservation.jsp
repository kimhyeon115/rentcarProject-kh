<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리스트</title>
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="/resources/css/carDetail.css">
<script type="text/javascript" src="/resources/js/index.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/carList.css">
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
			<%
				String sessionId1 = (String) session.getAttribute("sessionId");
				if(sessionId1 == null){
			%>
			<script type="text/javascript">
			alert("로그인 이후에 이용해주세요");
			history.go(-1);
			</script>
			<% 
			}
			%>
<%@ include file="include/header.jsp" %>
<form action="carReservationOk">
				<input type="hidden" name="rid" value="${sessionId}">
				<input type="hidden" name="rtdate" value="${rtdate}">
				<input type="hidden" name="returndate" value="${returndate}">
				<input type="hidden" name="cindex" value="${dto.cindex}">
				<input type="hidden" name="rtPrice" value="${dto.price}">
	<div class="topimg">
		<img src="/resources/img/adminpage1.jpg">
	</div>
	<div class="l-ct" style="margin-bottom: 80px;">
		<div id="app">
			<h1 class="goodsSectionTitle l-ct">선택하신 차량정보</h1>
			<section class="vehicleSection l-ct">
				<div class="vehicleTable">
					<div class="vehicleThum vehicleCell">
						<img class="carimg" src="${dto.cimg}">
					</div>
					<div class="vehicleInfo vehicleCell">
						<ul class="vehicleContent">
							<li>
								<span class="vehicleSubject">고유번호</span>
								<span class="vehicleSubjectContent">${dto.cindex}</span>
							</li>
							<li>
								<span class="vehicleSubject">브랜드</span>
								<span class="vehicleSubjectContent">${dto.cbrend}</span>
							</li>
							<li>
								<span class="vehicleSubject">차량명칭</span>
								<span class="vehicleSubjectContent">${dto.cname}</span>
							</li>
							<li>
								<span class="vehicleSubject">대여기간</span>
								<span class="vehicleSubjectContent" style="color:red">${rtdate} ~ ${returndate} </span>
							</li>
							<li>
								<span class="vehicleSubject">대여료/일</span>
								<span class="vehicleSubjectContent" style="color:red"><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</span>
							</li>
							<li>
								<span class="vehicleSubject">차량 정보</span>
								<span class="vehicleSubjectContent">${dto.cclass}&nbsp;&nbsp;|&nbsp;&nbsp;${dto.coil}
									&nbsp;&nbsp;|&nbsp;&nbsp;${dto.ctype}&nbsp;&nbsp;|&nbsp;&nbsp;${dto.ccolor}</span>
							</li>
							<li>
								<span class="vehicleSubject">비고</span>
								<span class="vehicleSubjectContent">${dto.cnote}<br>
								<p style="color: red; font-weight: 600; font-size: 16px;">만26세이상 운전경력 1년</p></span>
							</li>
							<li>
								<span class="vehicleSubject"></span>
								<span class="vehicleSubjectContent">💥 차량색상은 이미지와 다를 수 있습니다</span>
							</li>
							<li>
								<input class="buttons" type="button" value="목록" style="margin-left: 5px" onclick="goBack()">
								<input class="buttons" type="submit" value="예약하기">
							</li>
						</ul>
					</div>
				</div>
				</form>
			</section>
		</div>
	</div>
</form>
<%@ include file="include/footer.jsp" %>
</body>
</html>