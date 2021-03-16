<!-- 지시부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>JSP Start........</h1>
<%
	int a = 100;
	String name = "홍길동";
	//out 내장 객체 : client에게 정보를 보냄(response)
	out.write(name);

%>
</body>
</html>