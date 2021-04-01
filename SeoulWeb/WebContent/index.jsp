<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEOUL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<script src="/SeoulWeb/plugin/jquery.bxslider.js"></script>
<link rel="stylesheet" href="/SeoulWeb/plugin/jquery.bxslider.css" type="text/css"></link>
<style>
	body, ul, li{
		margin: 0; padding: 0; list-style-type: none;
	}
	#mainDiv{
		width: 800px;
		margin: 0 auto;
	}
	/*MENU*/
	#menu a:link, a:visited, a:active{
		text-decoration: none; color: #FFF;
	}
	#menu a:hover{
		color: #f00;
	}
	#menu{
		height: 50px;
		
	}
	#menu>li{
		float: left;
		width: 20%;
	}
	#menu li{
		height: 50px;
		line-height: 50px;
		text-align: center;
		background-color: #456;
	}
	#menu ul{
		position: relative;
		z-index: 999;
		display: none;
	}
	/*LOGIN*/
	form{
		text-align: right;
		height: 24px;
	}
	form>*{
		height: 24px;
	}
	.signin-cs>a{
		text-decoration: none;
		color: gray;
	}
	/*LOGO*/
	#imgDiv{
		width: 275px;
		margin: 0 auto;
		height: 100px;
		line-height: 100px;
	}
	/*BXSLIDER*/
	#slider img{
		width: 100%;
	}
	/*게시판*/
	h1{
		text-align: center;
		color: #ddd;
	}
	#boardDiv{
		width: 100%;
	}
	#list{
		overflow: auto;
	}
	#list>li{
		float: left;
		width: 10%;
		border-bottom: 1px solid grey;
		height: 40px;
		line-height: 40px;
	}
	#list>li:nth-child(6n+3){
		width: 45%;
	}
	#list>li:nth-child(6n+5){
		width: 11%;
	}
	.wordCut{
		white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
	/*PAGING*/
	#page{
		width: 220px;
		margin: 0 auto;
	}
	.page-link:link, .page-link:visited, .page-link:active{
		text-decoration: none; color: blue;
	}
</style>
<script>
	$(function(){
		//메뉴 호버
		$('#menu>li').hover(function(){
			$(this).children('ul').css('display','block');
		}, function(){
			$(this).children('ul').css('display','none');
		});	
		
		//bxSlider
		$('#slider').bxSlider({
			mode: 'horizontal' // 'horizontal','vertical','fade'
			, captions: true // 설명을 표시 (title태그에 있는 설명)
		});
		
		//체크박스 전체선택, 해제
		$('#checkAll').click(function(){
			if($('#checkAll').is(":checked")== true){
				$('.check').prop('checked', true);
			}
			if($('#checkAll').is(":checked")== false){
				$('.check').prop('checked', false);
			}
		});
	});
</script>
</head>
<body>
	<div id="mainDiv">
		<c:if test="${userid==null || userid==''}">
			<form method="post" action="<%=request.getContextPath()%>/member/loginOk.do" id="frm">
				<input type="text" name="userid" id="userid" placeholder="아이디" size="15">
				<input type="password" name="userpwd" id="userpwd" placeholder="비밀번호" size="15">
				<input type="submit" value="로그인" id="login">
				<span class="signin-cs"><a href="#">회원가입</a></span>
				<span class="signin-cs"><a href="#">고객센터</a></span>
			</form>
		</c:if>
			
		<c:if test="${userid != null && userid != ''}">
			<form method="post" action="<%=request.getContextPath()%>/member/logout.do">
				<span style="font-weight:bold">${username}</span>님 어서오세요.
				<input type="submit" value="로그아웃" id="login">
				<span class="signin-cs"><a href="#">회원가입</a></span>
				<span class="signin-cs"><a href="#">고객센터</a></span>
			</form>
		</c:if>
			
		<div id="imgDiv">
			<a href="https://www.seoul.go.kr/main/index.jsp"><img src="<%=request.getContextPath()%>/img/seoul.png"></a>
		</div>
		<ul id="menu">
			<li><a href="#">나의서울</a></li>
			<li><a href="#">전자우편</a></li>
			<li><a href="#">서울소개</a>
				<ul>
					<li><a href="#">시청안내</a></li>
					<li><a href="#">서울의상징</a></li>
					<li><a href="#">서울의역사</a></li>
					<li><a href="#">서울정보</a></li>
				</ul>
			</li>
			<li><a href="#">시민참여</a>
				<ul>
					<li><a href="#">서울시민과의대화</a></li>
					<li><a href="#">시민의견</a></li>
					<li><a href="#">공모전</a></li>
				</ul>
			</li>
			<li><a href="#">청사안내</a>
				<ul>
					<li><a href="#">조직도</a></li>
					<li><a href="#">시의회</a></li>
					<li><a href="#">자치구</a></li>
				</ul>
			</li>
		</ul>
	
		<ul id="slider">
			<li><img src="<%=request.getContextPath()%>/img/banner1.jpg" title="Seoul Music Festival"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner2.jpg" title="SIBAC 2019"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner3.jpg" title="2019 서울전환도시 국제컨퍼런스"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner4.jpg" title="2019 다다다 발표대회"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner5.jpg" title="2019 서울인공지능챗본론"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner6.jpg" title="서울차 없는 날"></li>
			<li><img src="<%=request.getContextPath()%>/img/banner7.jpg" title="Zero 제로페이 미국 캐나다 이벤트"></li>
		</ul>
		<div id="boardDiv">	
			<h1>자유게시판</h1>
			<p><input type="checkbox" name="checkAll" id="checkAll">전체 선택</p>
			<ul id="list">
				<li></li>
				<li>번호</li>
				<li>제목</li>
				<li>작성자</li>
				<li>작성일</li>
				<li>조회수</li>
				<c:forEach var="vo" items="${list}">
					<li><input type="checkbox" class="check"></li>
					<li>${vo.no}</li>
					<li class="wordCut">${vo.subject}</li>
					<li>${vo.userid}</li>
					<li>${vo.writedate}</li>
					<li>조회수</li>
				</c:forEach>
			</ul>
		</div>	
		<div id="page">
	    	<ul class="pagination pagination-sm" id ="pageNum">
	  			<li class="page-item"><a href="#" class="page-link"> Prev </a></li>
	     		<li class="page-item"><a href="#" class="page-link">1</a></li>
	      		<li class="page-item"><a href="#" class="page-link">2</a></li>
	       		<li class="page-item "><a href="#" class="page-link">3</a></li>
	       		<li class="page-item"><a href="#" class="page-link">4</a></li>
	       		<li class="page-item"><a href="#" class="page-link">5</a></li>
	       		<li class="page-item "><a href="#" class="page-link"> Next </a></li>
	         </ul>
         </div>
	</div>
</body>
</html>