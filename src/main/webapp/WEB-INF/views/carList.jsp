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
    	document.carListSearch.submit();
    });
    
    $('#datepicker2').change(function() {
    	document.carListSearch.submit();
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
					<form action="carListSearch" name="carListSearch">
						<div class="search" id="l-search">
							<div class="calenderLabel">
								<label class="DateBind">
									<div class="searchLabel current">
										<img src="/resources/img/start.png" class="icon"> 
										<input type="text" id="datepicker" name="rtdate" value="${rtdate }" >
									</div>
									<div class="searchLabel searchPartition">
										<img src="/resources/img/end.png" class="icon"> 
										<input type="text" id="datepicker2" name="returndate" value="${returndate }">
									</div>
								</label>
								<div class="searchLabel searchPartition searchCategory">
									<select name="searchOption" id="searchOption" >
										<option value="allcar" ${searchOption == 'allcar' ? 'selected="selected"' : '' }>전체</option>
										<option value="경차" ${searchOption == '경차' ? 'selected="selected"' : '' }>경차</option>
										<option value="준중형" ${searchOption == '준중형' ? 'selected="selected"' : '' }>준중형</option>
										<option value="중형" ${searchOption == '중형' ? 'selected="selected"' : '' }>중형</option>
										<option value="고급" ${searchOption == '고급' ? 'selected="selected"' : '' }>고급</option>
										<option value="RV" ${searchOption == 'RV' ? 'selected="selected"' : '' }>RV</option>
										<option value="승합" ${searchOption == '승합' ? 'selected="selected"' : '' }>승합</option>
									</select>
								</div>		
								<input class="searchimg" type="image" src="/resources/img/search.png">
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
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=allcar">전체차량</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=경차">경차</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=준중형">준중형</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=중형">중형</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=고급">고급</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=RV">RV</a></td>
					<td class="margin02">&nbsp;</td>
					<td class="headertext"><a href="carListSearch?rtdate=${rtdate } &returndate=${returndate }&searchOption=승합">승합</a></td>
					<td class="margin02">&nbsp;</td>
				</tr>
			</table>
			<c:choose>
				<c:when test="${count != 0}">
					<ul class="carList">
						<c:forEach items="${dtos }" var="dtos">
							<li class="carLabel">
								<a href="carReservation?cindex=${dtos.cindex }&rtdate=${rtdate } &returndate=${returndate }">
									<div>
										<img alt="차량사진" src="${dtos.cimg }" id="carbox">
									</div>
									<div class="" id="cartext">
										<p class="listTitle" style="text-align: center;">${dtos.cname }</p>
										<p class="listContent" style="text-align: center;"> ${dtos.cclass } | ${dtos.ccolor } |  ${dtos.coil } </p>
										<p class="listPrice" style="text-align: center;"><fmt:formatNumber value="${dtos.price}" pattern="#,###"/>원&nbsp;&nbsp;&nbsp;</p>
										<p class="listLink">예약하기</p>
									</div>
								</a>
							</li> 
						</c:forEach>
					</ul>
					</c:when>
					<c:otherwise>
						<p style="color:red; font-weight: bold; font-size: 20px">검색하신 ${rtdate } ~ ${returndate } 날짜에는 예약가능한 차량이 없습니다.</p>
					</c:otherwise>
				</c:choose>
			</section>			
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>