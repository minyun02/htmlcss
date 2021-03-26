<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/WebMVC/js_css/login.css">
<script>
	$(function(){
		$("from").submit(function(){
			if($("#userid").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}
			if($("#userpwd").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			return true;
		});
	});
</script>
<div id="main">
	<!-- 로고 -->
	<div id="top_logo">
		<a href="#"><img src="/WebMVC/img/daum_logo.png"></a>
	</div>
	<!-- 로그인폼, 배너 -->
	<div id="login_form">
		<div id="login">
			<form method="post" action="<%=request.getContextPath()%>/member/loginOk.do">
				<input type="text" class="form_input form" name="userid" id="userid" placeholder="아이디입력">
				<input type="password" class="form_input form" name="userpwd" id="userpwd" placeholder="비밀번호입력">
				<!--<input type="button" value="로그인">-->
				<input type="submit" class="form_com form sub" value="로그인">
				<div id="state">
					<span>
						<input type="checkbox" name="logState" value="no"> 로그인 상태 유지
					</span>
					<span style="float:right">
						<a href="#">보안</a> 
						<a href="#">ON</a>
					</span>
				</div>
				<div id="check">
					<a href="#">아이디 찾기 |</a> 
					<a href="#">비밀번호 찾기</a>
				</div>
			</form>
		</div>
		<a href="#"><img src="/WebMVC/img/banner.png" id="banner"></a>
	</div>
</div>