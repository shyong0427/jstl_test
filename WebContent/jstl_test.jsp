<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	** 변수 ** <br>
	<c:set var="irum" value="한국인" scope="page" />
	<c:out value="${irum }"></c:out>
	<br>
	<c:set var="ir" scope="session" >공기밥</c:set>
	<c:out value="${ir }" /> 
	
	<hr>
	if 조건문 사용<br>
	<c:set var="aa" value="star"/>
	<c:if test="${aa == 'star' }"> if test1 : aa 값은 <c:out value="${aa }"></c:out></c:if> <br>
	<c:if test="${aa != null }"> if test2 : aa 값은 <c:out value="${aa }"></c:out></c:if> <br>

	choose 조건문 사용 <br>
	<c:choose> 
		<c:when test="${aa == 'moon' }"> 달 </c:when>
		<c:when test="${aa eq 'star' }"> 별 </c:when>
		<c:otherwise>기타</c:otherwise>
	</c:choose>

	<hr>
	-- 반복문 -- <br>
	<c:forEach var="bb" begin="1" end="10" step="2">
		<c:out value="${bb }"/> &nbsp; ${bb } <br>
	</c:forEach>
	<br>
	<%
		HashMap map = new HashMap();
		map.put("name", "마당쇠");
		map.put("today", new Date());
	%>
	<c:set var="arr" value="<%=new int[]{1,2,3,4,5} %>"></c:set>
	<c:set var="m" value="<%=map %>"></c:set>
	
	배열 출력 : <br>
	<c:forEach var="i" items="${arr }">
		${i}&nbsp;
	</c:forEach>
	<br>
	<c:forEach var="i" items="${arr }" begin="2" end="4">
		${i}&nbsp;
	</c:forEach>
	<br>
	
	Map 출력 : <br>
	<c:forEach var="j" items="${m }">
		${j.key } ${j.value }
	</c:forEach>
	
	<hr>
	^^ 문자열 분할^^ <br>
	<c:forTokens var="animal" items="horse, tiger, lion* dog* cat" delims=",*" varStatus="num">
		<c:out value="${num.count })${animal }" />&nbsp;&nbsp;&nbsp;
	</c:forTokens>
	
	<hr>
	** 숫자 및 날짜 서식 ** <br>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	숫자 : <fmt:formatNumber value="12345" type="number" /> <br>
	숫자 : <fmt:formatNumber value="12345" type="currency" /> <br>
	
	<c:set var="now" value="<%=new Date() %>" />
	날짜 : <fmt:formatDate value="${now }" type="date" /> <br>
	날짜 : <fmt:formatDate value="${now }" type="both" /> <br>
</body>
</html>