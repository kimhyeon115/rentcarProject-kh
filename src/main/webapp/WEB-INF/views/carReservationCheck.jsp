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
<c:if test="${found == 0}">
	<script>
		alert("${message}")
		history.go(-1);
	</script>
</c:if>
<%@ include file="include/header.jsp" %>
	<div class="l-ct">
		<div id="app">
			<h1 class="goodsSectionTitle l-ct" style="text-align: center;"><span style="color: blue;">${sessionId}</span>&nbsp;고객님의 예약 이력입니다.</h1>
			<br>
			<c:forEach items="${dtos }" var="dtos">
			<section class="vehicleSection l-ct">
				<div class="vehicleTable">
					<div class="vehicleThum vehicleCell">
						<img class="carimg" src="${dtos.carDto.cimg}">
					</div>
					<div class="vehicleInfo vehicleCell">
						<ul class="vehicleContent">
							<li>
								<span class="vehicleSubject">고유번호</span>
								<span class="vehicleSubjectContent">${dtos.cindex}</span>
							</li>
							<li>
								<span class="vehicleSubject">브랜드</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cbrend}</span>
							</li>
							<li>
								<span class="vehicleSubject">차량명칭</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cname}</span>
							</li>
							<li>
								<span class="vehicleSubject">대여기간</span>
								<span class="vehicleSubjectContent" style="color:red">${dtos.rpdate}</span>
							</li>
							<li>
								<span class="vehicleSubject">총대여료</span>
								<span class="vehicleSubjectContent" style="color:red"><fmt:formatNumber value="${dtos.rtprice}" pattern="#,###,###"/>원</span>
							</li>
							<li>
								<span class="vehicleSubject">차량 정보</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cclass}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.coil}
									&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ctype}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ccolor}</span>
							</li>
							<li>
								<span class="vehicleSubject">비고</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cnote}<br>
								<p style="color: red; font-weight: 600; font-size: 16px;">만26세이상 운전경력 1년</p></span>
							</li>
							<li>
								<span class="vehicleSubject"></span>
								<span class="vehicleSubjectContent">💥 차량색상은 이미지와 다를 수 있습니다</span>
								<input class="reservationback" type="button" value="예약취소"
										onclick="confirmCancellation(${dtos.rtnum})">
							</li>
						</ul>
					</div>
				</div>
			</section>
			<br>
			<br>
			</c:forEach>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>