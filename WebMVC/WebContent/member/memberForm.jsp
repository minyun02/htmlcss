<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#memId>ul{overflow: auto;}
	#memId li{float: left; height: 50px; border-bottom: 1px solid #ddd; padding: 10px 0;}
	#memId li:nth-child(2n){width: 80%;}
	#memId li:nth-child(2n+1){width: 20%;}
	#memId li:last-of-type{width: 100%; text-align: center;}	
</style>
<script>
	$(function(){
		//아이디 중복검사
		$("#idCheck").click(function(){
			if($("#userid").val()!=""){	
				window.open("<%=request.getContextPath()%>/member/idCheck.do?userid="+$("#userid").val(),"idchk","width=500,height=400");
			}else{
				alert("아이디를 입력후 중복검사하세요..")
			}
		});

		//아이디 중복검사 해제
		var userid;
		$("#userid").keyup(function(){
			$("#hiddenCheck").val("N");
			userid = $("#userid").val();
		});
		$("#userid").change(function(){
			if(userid!=$("#userid")){
				$("#hiddenCheck").val("N");
			}
		});
	});
</script>
<div class="container">
	<h1>회원가입하기</h1>
	<form method="post" id="memId" action="member/memberFormOk.do">
		<ul id="regForm">
			<li>아이디</li>
			<li><input type="text" name="userid" id="userid" maxlength="20">
				<input type="button" value="아이디중복검사" id="idCheck">
				<input type="hidden" name="hiddenCheck" id="hiddenCheck" value="N">
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd" maxlength="20"></li>
			<li>비밀번호 확인</li>
			<li><input type="password" name="userpwd2" id="userpwd2" maxlength="20"></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username" maxlength="20"></li>
			<li>연락처</li>
			<li>
				<select name="tel1" id="tel1">
					<option value="010">010</option>
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="041">041</option>
				</select> -
				<input type="text" name="tel2" id="tel2" maxlength="4"> -
				<input type="text" name="tel3" id="tel3" maxlength="4">
			</li>
			<li>이메일</li>
			<li>
				<input type="text" name="emailid" id="emailid">@
				<select name="emaildomain">
					<option value="nate.com"></option>
					<option value="naver.com"></option>
					<option value="hanmail.net"></option>
					<option value="gmail.com"></option>
				</select>
			</li>
			<li>주소</li>
			<li><input type="text" name="zipcode" id="zipcode">
				<input type="button" value="우편번호검색" id="zipSearch">
				<input type="text" name="addr" id="addr"></li>
			<li>상세주소</li>
			<li><input type="text" name="detailaddr" id="detailaddr"></li>
			<li>관심분야</li>
			<li>
				<input type="checkbox" name="interest" value="컴퓨터">컴퓨터
				<input type="checkbox" name="interest" value="쇼핑">쇼핑
				<input type="checkbox" name="interest" value="등산">등산
				<input type="checkbox" name="interest" value="독서">독서
				<input type="checkbox" name="interest" value="인라인">인라인
				<input type="checkbox" name="interest" value="자전거">자전거
				<input type="checkbox" name="interest" value="게임">게임
				<input type="checkbox" name="interest" value="웹툰">웹툰
			</li>	
			<li>
				<input type="submit" value="회원가입하기">
				<input type="reset" value="다시쓰기">
			</li>			
		</ul>
	</form>
</div>