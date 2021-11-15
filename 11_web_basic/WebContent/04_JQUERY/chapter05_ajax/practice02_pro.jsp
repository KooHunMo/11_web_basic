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
		System.out.println("studentNum : " + request.getParameter("studentNum"));
		System.out.println("name : "       + request.getParameter("name"));
		System.out.println("grade : "      + request.getParameter("grade"));
		System.out.println("subject : "    + request.getParameter("subject"));
		System.out.println();
	
	%>
</body>
</html>