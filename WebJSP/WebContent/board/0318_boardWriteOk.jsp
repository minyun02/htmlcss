<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bitcamp.board.BoardDAO"%>
<!-- 게시판 입력폼에 입력한 데이터를 DB에 저장 -->
<!-- 액션태그 useBean 폼데이터 request+ vo에 담는다.    폼의 name속성의 값과 vo에 있는 멤버변수명이 같은 데이터끼리 담는다. -->


<!-- 
	BoardVo vo = new BoardVO(); -> 객체를 만든다는건 그 안에 변수를 사용하기 위한것.(즉 request가 일어나는 시점)
													scope=생명주기(언제까지 살아있게 할까냐)
													생명주기 : request, page, session, application
	객체생성 id='객체명' 
 -->
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
<jsp:useBean id="vo" class="com.bitcamp.board.BoardVO" scope="page"></jsp:useBean>
<jsp:setProperty name="vo" property="*"/> <!-- request한걸 담는 역할 *-> vo에 모든 변수를 선택 -->
<%
	//session의 글쓴이 아이디를 vo에 대입한다.
	vo.setUserid((String)session.getAttribute("logId"));
	//글쓴이 컴퓨터 아이피 주소
	vo.setIp(request.getRemoteAddr());
	
	BoardDAO dao = new BoardDAO(); //db에 데이터를 넣기위해서 객체 생성
	int result = dao.insertBoard(vo);
	
	if(result>0){//글 등록
		response.sendRedirect(request.getContextPath()+"/board/0318_boardList.jsp");
	}else{//글 등록 실패시
		%>
			<script>
				alert("글등록이 실패하였습니다.")
				history.back(); //history.go(-1);
			</script>
		<%
	}
%>

