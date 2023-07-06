<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="/resources/css/content.css">
<script type="text/javascript" src="/resources/js/memberdelete.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
	<center>
		<table border="0" cellspacing="0" cellpadding="10" width="80%" height="750px">
			<tr>
				<td class="contentbox">
					<center>
						<table border="0" cellspacing="0" cellpadding="10">
							<form action="memberdelete" method="post" name="delete_frm">
								<tr>
									<td class="contenttext">아 이 디 : </td>
									<td><input class="inputbox01" type="text" name="rid" value="${dto.rid}" readonly="readonly"></td>
								</tr>
								<tr>
									<td class="contenttext">비밀번호 :</td>
									<td><input class="inputbox01" type="password" name="rpw"></td>
								</tr>
								<tr>
									<td class="contenttext">비밀번호 확인 :</td>
									<td><input class="inputbox01" type="password"
										name="rpw_check"></td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<input class="contentbtn02" type="button" value="취소" onclick="script:window.location.href='index'">
										<input class="contentbtn03" type="button" value="회원탈퇴" name="deletebutton" onclick="deleteCheck()">
									</td>
								</tr>
								<input type="hidden" name="storedPassword" value="${dto.rpw}">
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