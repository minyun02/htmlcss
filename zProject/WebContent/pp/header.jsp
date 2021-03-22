<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Scanner" %>
<%@ page import="java.util.Random" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- jsp 코드 빈자리 제거 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYPrJtPT3ZbtWCRBJDGSzbcRgORfEoz90&callback=initMap"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

</head>
<body>
<a href="<%=request.getContextPath()%>"><img alt="Cat-logo" src="img/cat.png"></a>
	<div id="menuDiv">
		<ul>
			<li>
				<a href="#">로그인</a>
			</li>
			<li>
				<a href="#">친구찾기</a>
			</li>
			<li>
				<a href="#">커뮤니티</a>
			</li>
			<li>
				<a href="#">지도보기</a>
			</li>
		</ul>
	</div>

</body>
</html>