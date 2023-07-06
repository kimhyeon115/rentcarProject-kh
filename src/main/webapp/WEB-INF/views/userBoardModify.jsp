<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/content.css">
<link rel="stylesheet" href="/resources/css/write.css">
<script type="text/javascript" src="/resources/js/userBoardModify.js"></script>
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
					 	<table  border="0" cellspacing="0" cellpadding="10">
					 	  <h2 id="board_title">문의게시판</h2>
							<form action="userBoardModifyOk" name="userBoardModify_frm">
							<input type="hidden" name="rbnum" value="${dto.rbnum}">
								<tr id="name">
									<td class="col1">아 이 디 :</td>
									<td ><input class="col2" type="text" name="rid" readonly="readonly" value="${sessionId}"></td>
								</tr>
								<tr id="subject">
									<td class="col1">글제목 : </td>
									<td class="col2"><input type="text" name="rbtitle" value="${dto.rbtitle}"></td>
								</tr>
								<tr id="content">
									<td class="col1">글내용 :</td>
									<td class="col2"><textarea name="rbcontent">${dto.rbcontent}</textarea></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input class="contentbtn01"
										type="button" value="수정하기" onclick="userBoardModifyCheck()">&nbsp;
										<input class="contentbtn01" type="button" value="뒤로가기"
										onclick="script:window.location.href='userBoardView?rbnum=${dto.rbnum}'"></td>
								</tr>
							</form>
						</table>
					</center>
				</td>
			</tr>
		</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>