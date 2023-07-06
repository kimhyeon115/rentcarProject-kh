<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/content.css">
<script type="text/javascript" src="/resources/js/join.js"></script>
</head>
<body>
		<%
		int checkId = Integer.parseInt(request.getAttribute("checkId").toString());
		int joinFlag = Integer.parseInt(request.getAttribute("joinFlag").toString());
		if(checkId == 1){
		%>
		<script type="text/javascript">
			alert("입력하신 아이는 이미 가입된 아이디 입니다. 다시입력해주세요");
			history.go(-1);
		</script>	
		<%
		} else if (joinFlag == 0){
		%>
		<script type="text/javascript">
			alert("회원가입에 실패하였습니다.");
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
								<td class="main_text" style="text-align: center;">
									${rname}님 회원가입을 축하드립니다.<br> 가입하신 아이디는 ${rid }
									입니다.<br> <input class="contentbtn01" type="button"
									value="로그인 바로가기" onclick="script:window.location.href='login'">
									<input class="contentbtn01" type="button"
									value="홈으로 바로가기" onclick="script:window.location.href='index'">
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