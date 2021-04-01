<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${userid == null && username == null}">
	<script>
		alert("로그아웃되었습니다.")
		location.href= "<%=request.getContextPath()%>/index.do"
	</script>
</c:if>
<c:if test="${userid != null && username != null}">
	<script>
		alert("로그아웃에 실패했습니다..")
		location.href= "<%=request.getContextPath()%>/index.do"
	</script>
</c:if>