<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차리스트</title>
<link rel="stylesheet" type="text/css" href="/resources/css/carDetail.css">
<script type="text/javascript" src="/resources/js/index.js"></script>
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
			alert("관리자 모드로 로그인이 필요합니다");
			history.go(-1);
			</script>
			<% 
			}
			%>
<c:if test="${not empty messeage}">
	<script>
		alert("${messeage}")
		history.go(-1);
	</script>
</c:if>
<%@ include file="include/adminheader.jsp" %>
	<div class="topimg">
		<img src="/resources/img/adminpage1.jpg">
	</div>
	<div class="l-ct">
		<div id="app">
			<c:choose>
				<c:when test="${page == 2}">
				<h1 class="goodsSectionTitle l-ct">해당 <span style="color: blue;">${cindex}</span>번차량의 예약이력입니다.</h1>	
				</c:when>
				<c:when test="${page == 1}">
				<h1 class="goodsSectionTitle l-ct">예약번호 <span style="color: red;">${rtnum}</span>번의 예약내용입니다.</h1>
				</c:when>
			</c:choose>
			<c:forEach items="${dtos}" var="dtos" varStatus="status">
			<c:if test="${status.index == 1 && page == 1}">
			<h1 class="goodsSectionTitle l-ct">해당 <span style="color: blue;">${cindex}</span>번차량 기타 이력입니다.</h1>	
			</c:if>
			<section class="vehicleSection l-ct">
				<div class="vehicleTable">
					<div class="vehicleThum vehicleCell">
						<img class="carimg" src="${dtos.carDto.cimg}">
					</div>
					<div class="vehicleInfo vehicleCell">
						<ul class="vehicleContent">
							<li>
								<span class="vehicleSubject"><span style="color: red;">예약</span>&nbsp;|&nbsp;<span style="color: blue;">차량번호</span></span>
								<span class="vehicleSubjectContent"><span style="color: red;">${dtos.rtnum}</span>
									&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<span style="color: blue;">${dtos.cindex}</span></span>
							</li>
							<li>
								<span class="vehicleSubject">브랜드&nbsp;|&nbsp;명칭</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cbrend}&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;${dtos.carDto.cname}</span>
							</li>
							<li>
								<span class="vehicleSubject">예약자</span>
								<span class="vehicleSubjectContent"><span style="color: blue">${dtos.rid}</span></span>
							</li>
							<li>
								<span class="vehicleSubject">예약일</span>
								<span class="vehicleSubjectContent">${dtos.rvdate.substring(0,10)}</span>
							</li>
							<li>
								<span class="vehicleSubject">대여기간</span>
								<span class="vehicleSubjectContent" style="color:red">${dtos.rpdate}</span>
							</li>
							<li>
								<span class="vehicleSubject">총대여료</span>
								<span class="vehicleSubjectContent" style="color:red">${dtos.rtprice}</span>
							</li>
							<li>
								<span class="vehicleSubject">차량 정보</span>
								<span class="vehicleSubjectContent">${dtos.carDto.cclass}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.coil}
									&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ctype}&nbsp;&nbsp;|&nbsp;&nbsp;${dtos.carDto.ccolor}</span>
							</li>
							<li>
								<span class="vehicleSubjectContent" style="line-height: 50px">💥 차량색상은 이미지와 다를 수 있습니다</span>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<br>
			</c:forEach>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>