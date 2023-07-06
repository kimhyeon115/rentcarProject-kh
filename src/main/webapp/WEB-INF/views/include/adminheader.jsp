<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="/resources/css/adminheader.css">
</head>
<body>
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr class ="headerline">
			<td >&nbsp;</td>
			<td class ="img"><a href="index"><img src="/resources/img/car.jpg" width="300" height="80"></a></td>
			<td class="margin02">&nbsp;</td>
			<%
			
				String sessionId = (String) session.getAttribute("sessionId");
				
				if(sessionId == null){
			%>
			<td class ="headertext"><a href="login">로그인</a></td>
			<%		
				} else{
			%>
			<td class ="headertext"><a href="logout">로그아웃</a></td>
			<%		
				}
			
			%>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="/carList2_form?" style="color: white;">차량관리</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="/situation_form" style="color: white;">예약관리</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="freeBoardList" style="color: white;">자유게시판</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="userBoardList" style="color: white;">문의게시판</a></td>
			<td class="margin02">&nbsp;</td>
			<td >&nbsp;</td>
		</tr>
	</table>
</body>
</html>