<%@page import="com.bitcamp.home.board.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	/*게시판*/
	h1{text-align: center; color: #ddd;}
	#list{overflow: auto;}
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
	#slider img{
		width: 100%;
	}
	.sliderDiv{
		width: 800px;
		margin: 0 auto;
	}
	#page{
		margin: 0 auto;
		overflow: auto;
		clear: left;
	}
	#page>li{
		float: left; width: 20px; height: 20px; line-height: 20px; text-align: center;
		border: 1px solid #ddd; 
	}
	.wordCut{
		white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
	/
</style>
<script>
	$(function(){
		$('#slider').bxSlider({
			mode: 'horizontal' // 'horizontal','vertical','fade'
			, captions: true // 설명을 표시 (title태그에 있는 설명)
		});
		
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
<div class="sliderDiv">
	<ul id="slider">
		<li><img src="<%=request.getContextPath()%>/img/banner1.jpg" title="Seoul Music Festival"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner2.jpg" title="SIBAC 2019"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner3.jpg" title="2019 서울전환도시 국제컨퍼런스"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner4.jpg" title="2019 다다다 발표대회"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner5.jpg" title="2019 서울인공지능챗본론"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner6.jpg" title="서울차 없는 날"></li>
		<li><img src="<%=request.getContextPath()%>/img/banner7.jpg" title="Zero 제로페이 미국 캐나다 이벤트"></li>
	</ul>
</div>
<div class="mainDiv">
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
	<div id="page">
    	<ul class="pagination pagination-sm" id ="pageNum">
  			<li class="page-item"><a href="" class="page-link"> << </a></li>
     		<li class="page-item"><a href="" class="page-link">1</a></li>
      		<li class="page-item"><a href="" class="page-link">2</a></li>
       		<li class="page-item "><a href="#" class="page-link">3</a></li>
       		<li class="page-item"><a href="#" class="page-link">4</a></li>
       		<li class="page-item"><a href="#" class="page-link">5</a></li>
       		<li class="page-item "><a href="#" class="page-link"> >> </a></li>
         </ul>
	</div>   
</div>
















