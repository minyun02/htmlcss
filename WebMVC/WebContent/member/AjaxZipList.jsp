<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 우편번호, 제주특별자치도, 서귀포시 , 읍 ,면  ,신서로 79길, (강정동, 인터넷 카폐 )    
   123345, 제주특별자치도, 서귀포시 __  신서로 79길,( 강정동, 인터넷카페)
 -->
<hr id="z"/>
   <c:forEach var="vo" items="${list}">
      <li><span class="zCode">${vo.zipcode}</span><span class="addr"> ${vo.sido} ${vo.sigungu } <c:if test="${vo.um!=null }"> ${vo.um}</c:if> ${vo.doro} ${vo.gibun1}<c:if test="${vo.gibun2!=0 }">-${vo.gibun2 }</c:if> (${vo.dong}<c:if test="${vo.sibuild!=null }">,${vo.sibuild}</c:if>) </span></li>
   </c:forEach>
<hr id="z"/>