<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연습예시</title>
</head>
<body>
	<% 
	
		request.setCharacterEncoding("utf-8");
	
		System.out.println("--- 전송된 데이터 확인 ---");
		System.out.println("name : "    + request.getParameter("name"));
		System.out.println("id : "      + request.getParameter("id"));
		System.out.println("pwd : "     + request.getParameter("pwd"));
		System.out.println("age : "     + request.getParameter("age"));
		System.out.println("gender : "  + request.getParameter("gender"));
		System.out.println("hobbies : " + request.getParameter("hobbies"));
		System.out.println("travel : "  + request.getParameter("travel"));
		System.out.println("content : " + request.getParameter("content"));
		System.out.println();
	
	%>
</body>
</html>