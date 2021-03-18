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
	footer{background-color:#ddd; height: 100px;}
	header{height: 100px; background-color:pink;}
</style>
</head>
<body>
<div class="container">
	<!-- header include (jsp:로 시작하는걸 액션코드라 부른다.-->
	<jsp:include page="0318_jsp_header.jsp"></jsp:include>
	<!-- 현재 페이지 컨텐츠 -->
	<div style="border:1px solid gray">
	<%
		//include파일 변수 사용하기
		//변수, 데이터가 호환되지 않는다.
		//out.write("이름="+username);
		//out.write("번호="+num);
	%>
		<img src="../img/icon07.png">
	</div>
	<!-- footer include -->
	<jsp:include page="0318_jsp_footer.jsp"></jsp:include>
</div>
</body>
</html>