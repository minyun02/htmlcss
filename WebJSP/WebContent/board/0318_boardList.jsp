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
	ul, li{margin: 0; padding:0; list-style-type: none;}
	#boardList>li{
		float: left; width: 10%; height: 40px; line-height: 40px; border-bottom: 1px solid gray;
	}
	/*제목 : 55% */
	#boardList>li:nth-child(5n+2){
		width: 55%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
	/* 작성일 : 15% */
	#boardList>li:nth-child(5n+4){
		width: 15%;
	}
</style>
</head>
<body>
<%@ include file="../jsp04_include/0318_jspf_header.jspf" %>
<div class="container">
	<h1>게시판 목록</h1>
	<div>총 레코드 수 : 3232, Page : 1/5 page</div>
	<ul id="boardList">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		
		<li>100</li>
		<li><a href="#">BMW 코리아가 오는 16일 오후 2시 6분BMW 코리아가 오는 16일 오후 2시 6분BMW 코리아가 오는 16일 오후 2시 6분BMW 코리아가 오는 16일 오후 2시 6분BMW 코리아가 오는 16일 오후 2시 6분</a></li>
		<li>tiger1234</li>
		<li>21-10-03 10:12</li>
		<li>12</li>
		
		<li>98</li>
		<li><a href="#">BMW 코리아가 오는 16일 오후 2시 6분</a></li>
		<li>tiger1234</li>
		<li>21-10-03 10:12</li>
		<li>12</li>
		
		<li>90</li>
		<li><a href="#">BMW 코리아가 오는 16일 오후 2시 6분</a></li>
		<li>tiger1234</li>
		<li>21-10-03 10:12</li>
		<li>12</li>
		
		<li>87</li>
		<li><a href="#">BMW 코리아가 오는 16일 오후 2시 6분</a></li>
		<li>tiger1234</li>
		<li>21-10-03 10:12</li>
		<li>12</li>
		
		<li>82</li>
		<li><a href="#">BMW 코리아가 오는 16일 오후 2시 6분</a></li>
		<li>tiger1234</li>
		<li>21-10-03 10:12</li>
		<li>12</li>
	</ul>
	<div>
	<%
		String logStatus = (String)session.getAttribute("logStatus");	// Y or null or ""
		if(logStatus != null && logStatus.equals("Y")){
	%>
		<a href="<%=request.getContextPath()%>/board/0318_boardWriteForm.jsp">글쓰기</a>
		
		
	<%
		}
	
	%>	
	</div>
	<div>
		<ul class="breadcrumb pagination-sm">
          <li class="page-item"><a href="#" class="page-link">Prev</a></li>
          <li class="page-item"><a href="#" class="page-link">1</a></li>
          <li class="page-item"><a href="#" class="page-link">2</a></li>
          <li class="page-item active"><a href="#" class="page-link">3</a></li>
          <li class="page-item"><a href="#" class="page-link">4</a></li>
          <li class="page-item"><a href="#" class="page-link">5</a></li>
          <li class="page-item disabled"><a href="#" class="page-link">Next</a></li>
       </ul>
	</div>
	<div>
		<form method="post" action="<%=request.getContextPath() %>/board/0318_boardList.jsp">
			<!-- 제목, 작성자, 글내용 검색기능 -->
			<select name="searchKey">
				<option value="subject">제목</option>
				<option value="userid">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord">
			<input type="submit" value="Search...">
		</form>
	</div>
</div>
</body>
</html>