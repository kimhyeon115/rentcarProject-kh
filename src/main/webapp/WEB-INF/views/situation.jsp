<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주현대렌트카</title>
<link rel="stylesheet" type="text/css" href="/resources/css/situation.css">
</head>
<body>
<div class="body-wapper">
<%@ include file="include/adminheader.jsp" %>
	<div class="topimg">
		<img src="/resources/img/adminpage1.jpg">
	</div>
	<h1>차량대여 예약목록</h1>
	<div class="container">
		<p>&nbsp;&nbsp;<span class="count">${totalCount}개</span>의 예약이 검색되었습니다.</p>
		<table class="carlist">
			<tr class="carlistheadline">
				<th width="10%">예약번호</th>
				<th width="10%">예약일</th>
				<th width="10%">차량번호</th>
				<th width="10%">브랜드</th>
				<th width="10%">등급</th>
				<th width="10%">명칭</th>				
				<th width="10%">대여일</th>
				<th width="10%">반납일</th>
				<th width="10%">대여기간</th>
				<th width="10%">대여비용</th>
			</tr>
			<c:forEach items="${dtos}" var="dtos" >
				<tr class="carlistline" onclick="script:window.location.href='admincarReservationCheck_form?rtnum=${dtos.rtnum}&cindex=${dtos.cindex}'"
					style="cursor:pointer;" id="carlistline">
					<td>${dtos.rtnum}</td>
					<td>${dtos.rvdate.substring(0,10)}</td>
					<td>${dtos.cindex}</td>
					<td>${dtos.carDto.cbrend}</td>
					<td>${dtos.carDto.cclass}</td>
					<td>${dtos.carDto.cname}</td>					
					<td>${dtos.rtdate.substring(0,10)}</td>
					<td>${dtos.returndate.substring(0,10)}</td>
					<c:set var="startDate" value="${dtos.rtdate.substring(0, 10)}"/>
					<c:set var="endDate" value="${dtos.returndate.substring(0, 10)}"/>
					<c:set var="startLocalDate" value="<%= LocalDate.parse((String) pageContext.getAttribute(\"startDate\")) %>"/>
					<c:set var="endLocalDate" value="<%= LocalDate.parse((String) pageContext.getAttribute(\"endDate\")) %>"/>
					<c:set var="daysBetween" value="${startLocalDate.until(endLocalDate).days}"/>
					<td>${daysBetween}일</td>
					<td>${dtos.rtprice}원</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr width="1200">
	<table class="pagetable">
		<tr class="pagetr">
			<td class="pagetd">
				<c:if test="${pageMaker.prev}">
					<a class="pagebutton" href="situation_form?&pageNum=${pageMaker.startPage-5}">◀</a>
				</c:if>
			</td>				
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
			<td class="pagetd">
				<c:choose>
					<c:when test="${currPage == num}">
						<span class="lookpage">${num}</span>
					</c:when>
					<c:otherwise>
						<a class="pagebutton" href="situation_form?&pageNum=${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</td>
			</c:forEach>
			<td class="pagetd">
				<c:if test="${pageMaker.next}">
					<a class="pagebutton" href="situation_form&pageNum=${pageMaker.startPage+5}">▶</a>
				</c:if>
			</td>
		</tr>
	</table>
<%@ include file="include/footer.jsp" %>
</div>
</body>
</html>