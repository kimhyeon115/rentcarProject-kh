<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" href="/resources/css/View.css">
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
						<div id="view_title_box">
							<span id="boardTitle">${dto.rfbtitle }</span> 
							<span id="info">${dto.rid }
								| 조회수 : ${dto.rfbhit } | ${dto.rfbdate }</span>
						</div>
						<p id="view_content">${dto.rfbcontent }</p>
						
						
						<!-- 댓글 -->
						<hr>
					
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<c:forEach items="${replyListDto}" var="replyDto">
								<tr height="60px">
									<td width="10%" align="center">${replyDto.rid }</td>
									<td width="60%">${replyDto.rfrcontent }</td>
									<td width="10%">${replyDto.rfrbdate}</td>
									<c:if test="${sessionId==replyDto.rid || sessionId=='admin'}">
									<td width="5%"align="center"><input type="button" value="수정" onclick="script:window.location.href='freeReplyModify?rfrnum=${replyDto.rfrnum }'">
									<input type="button" value="삭제 " onclick="script:window.location.href='freeReplyDelete?rfrnum=${replyDto.rfrnum }&rfbnum=${replyDto.rfbnum }'">
									</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
						<form action="freeReplyOk">
							<input type="hidden" name="rfbnum" value="${dto.rfbnum }">
							<div id="comment_box">
								<img id="title_comment" src="/resources/img/title_comment.gif">
								<textarea name="rfrcontent"></textarea>
								<input type="image" id="ok_ripple" src="/resources/img/ok_ripple.gif">
							</div>
						</form>
						<!-- 댓글끝 -->
						<div id="buttons">
					<c:if test="${sessionId==dto.rid || sessionId=='admin'}">
							<a href="freeBoardModify?rfbnum=${dto.rfbnum }">
							<input type="image" src="/resources/img/modify.png"></a> 
							<a href="freeBoardDelete?rfbnum=${dto.rfbnum }">
							<input type="image" src="/resources/img/delete.png"></a> 
					</c:if>
							<a href="freeBoardList"><img src="/resources/img/list.png"></a>
						</div>
						
					</center>
				</td>
			</tr>
		</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>