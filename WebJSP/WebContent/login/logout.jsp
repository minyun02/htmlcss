<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	//session 지우기
	session.invalidate();

	response.sendRedirect("/WebJSP");
%>