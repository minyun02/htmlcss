<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${result==1}">
	<!-- 가입 성공 -->
	<script>
		location.href = "<%=request.getContextPath()%>/member/login.do";
	</script>
</c:if>
<c:if test="${result==0 }">
	<!-- 가입 실패 -->
	<script>
		alert("로그인 실패하였습니다.");
		history.back();
	</script>
</c:if>