<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리스트</title>
<link rel="stylesheet" href="/resources/css/content.css">
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
<%@ include file="include/header.jsp" %>
		<div class="wrapper">		
			<div class="mainvisual">
				<section class="searchSection">
				<center>
					<form action="searchCarLint">
						<div class="search" id="l-search">
							<div class="calenderLabel">
								<label class="DateBind">
									<div class="searchLabel current">
										<img src="/resources/img/start.png" class="icon"> 
										<input type="text" id="datepicker" name="rtdate">
									</div>
									<div class="searchLabel searchPartition">
										<img src="/resources/img/end.png" class="icon"> 
										<input type="text" id="datepicker2" name="returndate">
									</div>
								</label>
								<div class="searchLabel searchPartition searchCategory">
									<select>
										<option value="allcar">전체</option>
										<option value="lightcar">경차</option>
										<option value="smallcar">소형/준중형</option>
										<option value="mediumcar">중형</option>
										<option value="Advancedcar">고급</option>
										<option value="rvcar">RV</option>
										<option value="bencar">승합</option>
									</select>
								</div>
								<input type="image" src="/resources/img/search.png">
							</div>
						</div>
					</form>
					</center>
				</section>
			</div>
			
			<section class="carSection" id="centerimg">
			<table border="0" cellspacing="0" cellpadding="0" width="100%">
				<tr class="headerline">
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carTotalList">전체차량</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=경차">경차</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=준중형">준중형</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=중형">중형</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=고급">고급</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=RV">RV</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carList?cclass=승합">승합</a></td>
					<td class="margin02">&nbsp;</td>
				</tr>
			</table>
			<ul class="carList">
					<c:forEach items="${dtos }" var="dtos">
						<li class="carLabel">
							<a href="carReservation?cindex=${dtos.cindex }&rtdate= &returndate=">
								<div>
									<img alt="차량사진" src="${dtos.cimg }" id="carbox">
								</div>
								<div class="" id="cartext">
									<p class="listTitle">&nbsp;&nbsp;&nbsp;${dtos.cname }</p>
									<p class="listContent"> ${dtos.cclass } | ${dtos.ccolor } |  ${dtos.coil } </p>
									<p class="listPrice">${dtos.price }원&nbsp;&nbsp;&nbsp;</p>
									<p class="listLink">예약하기</p>
								</div>
							</a>
						</li> 
					</c:forEach>
				</ul>
			</section>			
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>