<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" href="/resources/css/list.css">
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
	<center>
		<table border="0" cellspacing="0" cellpadding="10" width="80%">
			<tr>
				<td class="contentbox">
					<center>
							<h2 id="board_title">자유 게시판</h2>
							<div id="total_search">
								<div id="total">▷ 총 ${totalCount}개의 게시물이 있습니다.</div>
								<form action="searchList">
									<div id="search">
										<div id="search_select">
											<select name="searchOption">
												<option value="title">제목</option>
												<option value="content">내용</option>
												<option value="writer">글쓴이</option>
											</select>
										</div>
										<div id="search_input">
											<input type="text" name="keyWord">
										</div>
										<div id="search_btn">
											<input type="image" src="/resources/img/search_button.gif">
										</div>
								</form>
							</div>
							</div>
						<table>
				          <tr>
				            <th>번호</th>
				            <th>제목</th>
				            <th>작성자</th>
				            <th>작성일</th>
				            <th>조회수</th>
				          </tr>
				          <c:forEach items="${dtos }" var="dtos">
				          <tr>
				            <td class="col1">${dtos.rfbnum }</td>
				            <td class="col2">
				            <c:choose>
				            	<c:when test="${dtos.rid == 'admin'}">
				            	 <a href="freeBoardView?rfbnum=${dtos.rfbnum }"><span class="notice">${dtos.rfbtitle}</span></a>&nbsp;&nbsp;&nbsp;
				            	</c:when>
				            	<c:otherwise>
				            		<a href="freeBoardView?rfbnum=${dtos.rfbnum }">${dtos.rfbtitle}</a>&nbsp;&nbsp;&nbsp;
				            	</c:otherwise>
				            </c:choose>
				              
				              <c:if test="${dtos.rfbreplycount != 0}">
				             	<span style="color:#999999;font-size: 9px;">[${dtos.rfbreplycount}]</span>
				              </c:if>
				            </td>
				            <td class="col3">${dtos.rid }</td>
				            <td class="col4">
				   	         <c:out value="${fn:substring(dtos.rfbdate,0,10) }"></c:out>
				            </td>
				            <td class="col5">${dtos.rfbhit }</td>
				          </tr>
				          </c:forEach>
				        </table>
						<div id="buttons">
							<div class="col1"></div>
							<div class="col2">
								<a href="freeBoardWrite"><img src="/resources/img/write.png"></a>
							</div>
						</div>
						<tr>
							<td colspan="5" align="center">
								<c:if test="${pageMaker.prev }">
									<a href="freeBoardList?pageNum=${pageMaker.startPage-10 }">◀</a>&nbsp;&nbsp;&nbsp;
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
									<c:choose>
										<c:when test="${currPage == num}">
											<span style="color: #FFFFFF; background-color: blue;; font-weight: bold;">${num}</span>&nbsp;&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
											<a href="freeBoardList?pageNum=${num }">${num }</a>&nbsp;&nbsp;&nbsp;
										</c:otherwise>
									</c:choose>
								</c:forEach> 
								<c:if test="${pageMaker.next }">
									<a href="freeBoardList?pageNum=${pageMaker.startPage+10 }">▶</a>
								</c:if>
							</td>
						</tr>
					</center>
				</td>
			</tr>
		</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>