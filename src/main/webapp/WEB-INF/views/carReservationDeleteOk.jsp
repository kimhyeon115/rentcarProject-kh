<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약성공</title>
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" href="/resources/css/carReservationDelete.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div class="outterdiv">
	<div class="innerdiv" id="innerbox" border="0" cellspacing="0" cellpadding="10">
		<h3 class="innertitle"><span class="userid">${dtos.rid}</span> 고객님의 해당 예약이 취소되었습니다</h3>
		<p class="price"><span style="color: red; font-size: 26px;">${dtos.rtprice}원</span> 환불 예정입니다</p>
		<section class="vehicleSection l-ct">
				<div class="vehicleTable">
					<ul class="vehicleContent">
						<li>
							<span class="vehicleSubject"><b>예약번호</b></span>
							<span class="vehicleSubjectContent">${dtos.rtnum}</span>
						</li>
						<li>
							<span class="vehicleSubject"><b>브랜드</b></span>
							<span class="vehicleSubjectContent">&nbsp;&nbsp;&nbsp;${dtos.carDto.cbrend}</span>
						</li>
						<li>
							<span class="vehicleSubject"><b>차량명칭</b></span>
							<span class="vehicleSubjectContent">${dtos.carDto.cname}</span>
						</li>
						<li>
							<span class="vehicleSubject"><b>대여기간</b></span>
							<span class="vehicleSubjectContent" style="color:red">${dtos.rpdate}</span>
						</li>
						<li>
							<span class="vehicleSubject"><b>차량정보</b></span>
							<span class="vehicleSubjectContent">${dtos.carDto.cclass}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.coil}
								&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ctype}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ccolor}</span>
						</li>
					</ul>					
				</div>
			</section>
		<div class="CheckOk">
			<input id="CheckOkbutton" type="button" value="홈으로 가기" 
			onclick="script:window.location.href='index'">
		</div>				
	</div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>