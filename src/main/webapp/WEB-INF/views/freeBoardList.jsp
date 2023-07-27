<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="/resources/css/freeBoardList.css">
</head>
<body>
<%@ include file="include/header.jsp" %>
<div id="top_img_box">
	<img id="top_img" src="/resources/img/adminpage1.jpg">
</div>
<p id="content_tilte">자유 게시판</p>
<div id="content_box">
	<div>
		<p id="board_total_count">▷ 총 <span id="countNum">${totalCount}</span>개의 게시글이 있습니다.</p>
	</div>
	<form action="searchList" id="search_form">
		<div id="search_select">
			<select name="searchOption" class="search_option">
				<option value="title">제 목</option>
				<option value="content">내 용</option>
				<option value="writer">글쓴이</option>
			</select>
		</div>
		<div id="search_input">
			<input type="text" name="keyWord" class="search_input">
		</div>
		<div id="search_btn">
			<input type="image" src="/resources/img/search_button.gif" alt="submit" class="search_btn">
		</div>
		<div id="search_write">
			<a href="freeBoardWrite"><img src="/resources/img/write.png" class="search_write"></a>
		</div>
	</form>
</div>
<div id="content_div">
	<table id="content_table">
		<tr id="table_head">
			<th class="col1">번호</th>
            <th class="col2">제목</th>
            <th class="col3">작성자</th>
            <th class="col4">작성일</th>
            <th class="col5">조회수</th>
		</tr>
		<c:forEach items="${dtos}" var="dtos">
		<tr>
			<td class="col1">${dtos.rfbnum}</td>
			<td class="col2">
				<a href="freeBoardView?rfbnum=${dtos.rfbnum}">${dtos.rfbtitle}</a>
				<c:if test="${dtos.rfbreplycount != 0}">
             	<span id="reply_count">[${dtos.rfbreplycount}]</span>
                </c:if>
			</td>
			<td class="col3">${dtos.rid}</td>
			<td class="col4">
   	        <c:out value="${fn:substring(dtos.rfbdate,0,10)}"></c:out>
            </td>
            <td class="col5">${dtos.rfbhit }</td>
		</tr>
		</c:forEach>
	</table>
	<table id="page_table">
		<tr>
			<td>
				<c:if test="${pageMaker.prev}">
					<a href="freeBoardList?pageNum=${pageMaker.startPage-5}" id="page_btn">◀</a>&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
					<c:choose>
						<c:when test="${currPage == num}">
							<span id="page_num">${num}</span>
						</c:when>
						<c:otherwise>
							<a href="freeBoardList?pageNum=${num}" id="page_btn">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<c:if test="${pageMaker.next}">
					<a href="freeBoardList?pageNum=${pageMaker.startPage+5}" id="page_btn">▶</a>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<%@ include file="include/footer.jsp" %>
</body>
</html>