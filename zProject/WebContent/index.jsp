<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Scanner" %>
<%@ page import="java.util.Random" %>
<%@ page trimDirectiveWhitespaces="true" %> <!-- jsp 코드 빈자리 제거 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome to pp</title>
<meta name="viewport" content="width=device-width, initial-scale=1"><!-- 반응형 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAYPrJtPT3ZbtWCRBJDGSzbcRgORfEoz90&callback=initMap"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<style type="text/css">
	ul, li{
		margin: 0;
		list-style-type:none;
	}
	#menu{
		width:100%;
		height: 50px;
		background-color: lightblue;
		line-height: 50px;
	}
	#menu>a>img{
		width: 50px;
		height: 50px;
		margin-left: 20px;
	}
	#menuDiv{
		float: right;
		width: 60%;
		
	}
	#menuDiv>ul>li{
		float: left;
		padding-left: 100px;
	}
	.carousel-inner{
		height: 500px;
	}
	
	
</style>
</head>
<body>

<!--메뉴 -->
<section id="menu">
	<%@ include file="/pp/header.jsp"%>
</section>

<!-- 바디1 : carousel -->
<section>
	<div id="carouselCaption" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselCaption" data-slide-to="0" class="active"></li>
			<li data-target="#carouselCaption" data-slide-to="1"></li>
			<li data-target="#carouselCaption" data-slide-to="2"></li>
			<li data-target="#carouselCaption" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" alt="banner1" src="img/banner1.png">
				<div class="carousel-caption d-none d-md-block">
					<h5>첫번째 배너 </h5>
					<p>첫번째 배너 글 설명</p>
				</div>			
			</div>
			
			<div class="carousel-item">
				<img class="d-block w-100" alt="banner2" src="img/banner2.png">
				<div class="carousel-caption d-none d-md-block">
					<h5>두번 배너 </h5>
					<p>두번째 배너 글 설명</p>
				</div>			
			</div>
			
			<div class="carousel-item ">
				<img class="d-block w-100" alt="banner3" src="img/banner3.png">
				<div class="carousel-caption d-none d-md-block">
					<h5>세번째 배너 </h5>
					<p>세번째 배너 글 설명</p>
				</div>			
			</div>
			
			<div class="carousel-item">
				<img class="d-block w-100" alt="banner4" src="img/banner4.png">
				<div class="carousel-caption d-none d-md-block">
					<h5>네번째 배너 </h5>
					<p>네번째 배너 글 설명</p>
				</div>			
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselCaption" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselCaption" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
	</div>
</section>

<!-- 바디2 : 지도 -->
<section>
	<div id="gMap">google map</div>
	<script type="text/javascript">
		document.getElementById("gMap").style.height = "300px";
		
		var latitude = 37.5729503;
		var longitude = 126.9793578;
		
		function initMap(){
			var myCenter = new google.maps.LatLng(latitude, longitude);
			
			var mapProperty = {
					center : myCenter,
					zoom: 15,
					mapTypeid : google.maps.MapTypeId.ROADMAP
			}
		}
	</script>
</section>
<!-- footer -->
<footer>
	
</footer>
</body>
</html>