<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style>
	header{height: 100px; background-color: lightblue;}
	footer{height: 100px; background-color: orange;}
</style>
</head>
<body>
	<div class="container">
		<!-- header include(조각파일:jspf) -->
		<%@ include file="0318_jspf_header.jspf" %>
		<!-- 메인 컨텐츠 -->
		<div>
			<h1>조각파일 incldue(<%=username %>,<%=num %>)</h1>
			<img src="../img/icon09.png">
		</div>
		<!-- footer include(조각파일:jspf) -->
		<%@ include file="0318_jspf_footer.jspf" %>
	</div>
</body>
</html>