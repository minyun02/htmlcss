<!-- 지시부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Scanner" %>
<%@ page import="java.util.Random" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- jsp 코드 빈자리 제거 -->
<%!
	// 선언부
	// 메소드 또는 변수를 선언
	public int sum(int a, int b){
		int hap = a + b;
		return hap;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{background-color:pink;}
</style>
<script>
	//document.write("javascript....")
</script>
</head>
<body>
<%@ include file="jsp04_include/0318_jspf_header.jspf" %>
<h2>session.ID : <%=session.getId() %></h2>

<h1>JSP Start........</h1>
<%
	Calendar now = Calendar.getInstance();
	int year = now.get(Calendar.YEAR); //
	int month = now.get(Calendar.MONTH)+1;
	int day = now.get(Calendar.DAY_OF_MONTH);
%>
<h1>오늘은 <%=year %>년 <%=month %>월<%=day %>일 입니다.</h1>
<hr>
<h1>jstl 태그</h1>
<!-- 
	https://tomcat.apache.org/taglibs/standard/ 에서
	jakarta-taglibs-standard-1.1.2.zip을 다운로드 후
	
	현재 프로젝트의 WEB-INF/lib에
		jstl.jar, standard.jar를 복사한다.
-->
<ol>
	<li><a href="jstl/jstl01_setTag.jsp">set Tag : 변수의 선언 및 삭제</a></li>
	<li><a href="jstl/jstl02_ifTag.jsp?name=이순신&age=28">if Tag : 조건문</a></li>
	<li><a href="jstl/jstl03_forEachTag.jsp">forEach Tag : 반복문</a></li>
	<li><a href="jstl/jstl04_forTokensTag.jsp">forTokens Tag : 문자열 조각내기</a></li>
	<li><a href="jstl/jstl05_urlTag.jsp">url Tag</a></li>
	<li><a href="jstl/jstl06_choose.jsp?username=홍길동1&age=15">choose Tag : if~else, switch</a></li>
	<li><a href="jstl/jstl07_redirectTag.jsp">redirect Tag</a></li>
</ol>
<hr>
<% // 스크립트릿
	int a = 1234;
	int b = 5678;
	String name = "홍길동";
	//out 내장 객체 : client에게 정보를 보냄(response)
	out.write(name);
	int result = sum(b, a);
	out.write("<br>result"+result);
	out.write("<br>"+a+"+"+b+"="+sum(a,b));
	
%>
<br>
<%=a+4%>-<!-- %= -> 단순한 계산이나 변수를 불러오는거만 가능 -->
<%=b%>=
<%=sum(a,b)%> 



<hr>
<%
	out.write("<h1>AAAAAAAA</h1>");
	out.write("<img src='img/icon01.png'>");
%>
</body>
</html>