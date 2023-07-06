<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제주현대렌트카</title>
<link rel="stylesheet" type="text/css" href="/resources/css/carList2.css">
</head>
<body>
<div class="body-wapper">
<%@ include file="include/adminheader.jsp" %>
	<div class="topimg">
		<img src="/resources/img/adminpage1.jpg">
	</div>
	<h1>현재 등록된 차량정보</h1>
	<div class="container">
		<div class="listMenuTabs">
			<input class="listtype" type="button" value="전체" onclick="script:window.location.href='carList2_form'">
			<input class="listtype" type="button" value="경차" onclick="script:window.location.href='carList2_form?cclass=경차'">
			<input class="listtype" type="button" value="소형/준중형" onclick="script:window.location.href='carList2_form?cclass=준중형'">
			<input class="listtype" type="button" value="고급" onclick="script:window.location.href='carList2_form?cclass=고급'">
			<input class="listtype" type="button" value="RV" onclick="script:window.location.href='carList2_form?cclass=RV'">
			<input class="listtype" type="button" value="승합" onclick="script:window.location.href='carList2_form?cclass=승합'">
			<input class="listtype" type="button" value="수입차" onclick="script:window.location.href='carList2_form?cclass=수입'">
			<input class="listtype" id="caradd"  type="button" value="차량등록" onclick="script:window.location.href='carAdd_form'">
		</div>
		<p>&nbsp;&nbsp;<span class="count">${type}</span>등급 차량<span class="count">&nbsp;${totalCount}</span>대가 검색되었습니다.</p>
		<table class="carlist">
			<tr class="carlistheadline">
				<th width="7%">차량번호</th>
				<th width="11%">브랜드</th>
				<th width="11%">등급</th>
				<th width="11%">명칭</th>
				<th width="11%">색상</th>
				<th width="8%">유종</th>
				<th width="8%">타입</th>
				<th width="11%">대여료/일</th>
				<th width="11%">누적대여일수</th>
				<th width="11%">총수익</th>
			</tr>
			<c:forEach items="${carListDto}" var="dtos" >
				<tr class="carlistline" onclick="script:window.location.href='carDetail_form?cindex=${dtos.cindex}'" style="cursor:pointer;" id="carlistline">
					<td>${dtos.cindex}</td>					
					<td>${dtos.cbrend}</td>
					<td>${dtos.cclass}</td>
					<td>${dtos.cname}</td>
					<td>${dtos.ccolor}</td>
					<td>${dtos.coil}</td>
					<td>${dtos.ctype}</td>
					<td class="carlistprice">${dtos.price}</td>
					<td>${dtos.pdate}일</td>
					<td>${dtos.pdate * dtos.price}원</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<hr width="1200">
	<table class="pagetable">
		<tr class="pagetr">
			<td class="pagetd">
				<c:if test="${pageMaker.prev}">
					<a class="pagebutton" href="carList2_form?cclass=${type}&pageNum=${pageMaker.startPage-5}">◀</a>
				</c:if>
			</td>				
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
			<td class="pagetd">
				<c:choose>
					<c:when test="${currPage == num}">
						<span class="lookpage">${num}</span>
					</c:when>
					<c:otherwise>
						<a class="pagebutton" href="carList2_form?cclass=${type}&pageNum=${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</td>
			</c:forEach>
			<td class="pagetd">
				<c:if test="${pageMaker.next}">
					<a class="pagebutton" href="carList2_form?cclass=${type}&pageNum=${pageMaker.startPage+5}">▶</a>
				</c:if>
			</td>
		</tr>
	</table>
<%@ include file="include/footer.jsp" %>
</div>
</body>
</html>