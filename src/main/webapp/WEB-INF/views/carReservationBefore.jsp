<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약성공</title>
<link rel="stylesheet" href="/resources/css/content.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="outterdiv">
	<div class="innerdiv" border="0" cellspacing="0" cellpadding="10">
		<h3 class="innertitle"><span class="userid">${rid}</span> 고객님의 예약이 정상 처리되었습니다.</h3>
		<p class="price"><span style="color: red; font-size: 26px;">${totalPrice}원</span> 결제되었습니다</p>
		<p class="content">- 보상한도 : 한도무제한 - 면책금 : 없음 - 휴차보상료 : 없음<br>
						   - 가입제한 : 만26세이상운전경력1년 ( 차종 별 가입제한이 상이할 수 있음 )</p>
		<p>대인, 대물, 자손에 가입되어 있습니다.</p>
		<ul class="insContent"><li><span class="insSubject">대인보험</span> <span class="insSubjectContent">
						보험내역 : 운전자 과실로 인한 인명 사고(동승자 포함)<br>보상범위 : 무제한<br>가입유무 : 가입
						</span></li> <li><span class="insSubject">대물보험</span> <span class="insSubjectContent">
						보험내역 : 운전자 과실로 인한 차량 및 물건 피해 사고<br>보상범위 : 사고건당 2,000만원 한도<br>가입유무 : 가입
						</span></li> <li><span class="insSubject">자손보험</span> <span class="insSubjectContent">
						보험내역 : 운전자 과실로 인한 인명 피해 사고<br>보상범위 : 사고건당 1,500만원 한도<br>가입유무 : 가입
						</span></li></ul>
		<div class="CheckOk">	
			<input id="CheckOkbutton" type="button" value="예약확인 하기" 
			onclick="script:window.location.href='carReservationCheck'">
			&nbsp;
			<input id="CheckOkbutton" type="button" value="홈으로 가기" 
			onclick="script:window.location.href='index'">
		</div>				
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>