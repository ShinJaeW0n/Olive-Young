<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>임시 메인 페이지</title>
</head>
<body>
	메인입니다.
	<!--
	<button onClick="location.href='userListAction.do'">회원 정보</button>
	<button onClick="location.href='myPageInfo.jsp'">myPage</button>
	-->	
	<%
	String id = (String)session.getAttribute("id");
	System.out.println("아이디 값은? " + id);	
	
	if(id == null) {
	%>
		<a href="userLogin.bo">로그인</a>
	<%
	} else {
		if(id.equals("admin")) {
	%>
		<a href="userLogoutAction.bo">로그아웃</a>
		<a href="userListAction.bo">회원 정보</a>
	<%
		} else {
	%>
			<a href="userLogoutAction.bo">로그아웃</a>
			<a href="myPage1.bo">myPage</a>	
	<%		
		}
	}
	%>		
</body>
</html>