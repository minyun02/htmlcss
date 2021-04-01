<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#dataList{overflow: auto;}
	#dataList>li{
		float: left; width: 10%; height: 40px; line-height: 40px; border-bottom: 1px solid #ddd;
	}
	#dataList>li:nth-child(7n+2){
		width: 40%;
	}
	.img{
		width: 20px;
		height: 20px;
	}
	.wordCut{
		white-space: nowrap; overflow: hidden; text-overflow: ellipsis;
	}
</style>
<script>
	$(function(){
		$(document).on('click', '#dataList img', function(){
			//레코드 번호
			var no = $(this).parent().parent().prev().prev().prev().prev().text();
			//console.log('no=', no);
			var downObj = $(this).parent().parent().next(); //원하는 객체를 변수로 미리 구해놓는다 왜냐면 success에서 this는 다른 이벤트로 인식하기 때문
			var params = "no="+no;
			$.ajax({
				url : '/WebMVC/data/downcount.do'
				, data : params
				, success : function(result){
					var downarr = result.split('<hr class="down">');
					console.log(downarr[1]);
					downObj.text(downarr[1].trim());
				}, error : function(){
					console.log('다운횟수 에러발생........');
				}
			});
			
		});
	});
</script>
<div class="container">
	<h1>자료실 리스트</h1>
	<div>
		<c:if test="${userid != null && userid != ''}">
			<a href="<%=request.getContextPath()%>/data/dataForm.do">자료실 글 올리기</a>
		</c:if>
	</div>	
	<ul id="dataList">
		<li>번호</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>hit</li>
		<li>첨부</li>
		<li>Down</li>
		<li>등록일</li>
		
		<c:forEach var="dataVO" items="${lst}">
			<li>${dataVO.no}</li>
			<li class="wordCut"><a href="<%=request.getContextPath()%>/data/dataView.do?no=${dataVO.no}">${dataVO.title}</a></li>
			<li>${dataVO.userid}</li>
			<li>${dataVO.hit}</li>
			<li>
				<a href="<%=request.getContextPath()%>/upload/${dataVO.filename1}" download><img src="<%=request.getContextPath()%>/img/save.png" title="${dataVO.filename1}" class="img"></a>
				<c:if test="${dataVO.filename2!=null && dataVO.filename2!=''}">
					<a href="<%=request.getContextPath()%>/upload/${dataVO.filename2}"download><img src="<%=request.getContextPath()%>/img/save.png" title="${dataVO.filename2}" class="img"></a>
				</c:if>
			</li>
			<li>${dataVO.downCount}</li>
			<li>${dataVO.writedate}</li>
		</c:forEach>
	</ul>
</div>