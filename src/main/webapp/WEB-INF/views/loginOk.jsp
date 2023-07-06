<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/content.css">
</head>
<body>
		<%
		int loginCheck = Integer.parseInt(request.getAttribute("loginCheck").toString());
		if(loginCheck == 0){
		%>
		<script type="text/javascript">
			alert("입력하신 아이디와 비밀번호를 다시 확인해주세요");
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
							<tr>
								<td class="main_text">
									${sessionId}님 환영합니다.
									<br> <input class="contentbtn01" type="button"
									value="메인화면 바로가기" onclick="script:window.location.href='index'">
								</td>
							</tr>
						</table>
					</center>
				</td>
			</tr>
		</table>
	</center>
<%@ include file="include/footer.jsp" %>
</body>
</html>