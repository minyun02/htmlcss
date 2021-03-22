<%@page import="com.bitcamp.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	int nowNum = Integer.parseInt(request.getParameter("nowNum"));
	String searchKey = request.getParameter("searchKey");
	String searchWord = request.getParameter("searchWord");
	
	BoardDAO dao = new BoardDAO();
	int r = dao.deleteRecord(no, (String)session.getAttribute("logId"));
	if(r>0){//삭제 성공
		//리스트로 이동
		%>
		<script>
			location.href="<%=request.getContextPath()%>/board/0318_boardList.jsp?nowNum=<%=nowNum%><%if(searchWord!=null && !searchWord.equals("")){out.write("&searchKey="+searchKey+"&searchWord"+searchWord);}%>"
		</script>
		<%
	}else{//삭제 실패
		%>
		<script>
			history.back();
		</script>
		<%
	}
%>