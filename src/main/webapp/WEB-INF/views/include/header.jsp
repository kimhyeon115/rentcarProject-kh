<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" href="/resources/css/header.css">
</head>
<body>
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
		<tr id="headerline">
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
			
			<%
				if(sessionId == null){
			%>
			<td class ="headertext"><a href="join">회원가입</a></td>
			<%		
				}else if(sessionId.equals("admin") ){
			%>
			<td class ="headertext"><a href="carList2_form">관리페이지</a></td>	
			<%		
				} else{
			%>
			<td class ="headertext"><a href="modify">프로필수정</a></td>
			<%		
				}
			
			%>
			<jsp:useBean id="javaDate" class="java.util.Date" />
			<fmt:formatDate var="today" value="${javaDate}" pattern="yyyy-MM-dd"/>
			<c:set var="oneDayAfter" value="<%=new Date(new Date().getTime() + 60*60*24*1000*1)%>"/>
			<fmt:formatDate var="tomorrow" value="${oneDayAfter}" pattern="yyyy-MM-dd" />
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="carListSearch?rtdate=${today}&returndate=${tomorrow}&searchOption=allcar">실시간예약</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="information_form">이용안내</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="insurance_form">보험안내</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="carReservationCheck">예약확인</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="freeBoardList">자유게시판</a></td>
			<td class="margin02">&nbsp;</td>
			<td class ="headertext"><a href="userBoardList">문의게시판</a></td>
			<td class="margin02">&nbsp;</td>
			<td >&nbsp;</td>
		</tr>
	</table>
</body>
</html>