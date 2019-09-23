<%@page import="pack.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="connBean" class="pack.ConnectionBean" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	** 상품 자료 ** <br>
	방법 1) 전통적인 방법 <br>
	<table border="1">
		<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>
<%
	ArrayList<ProductBean> list = connBean.getDataAll();

	for(ProductBean p : list) {
%>
		<tr>
			<td><%=p.getCode() %></td>
			<td><%=p.getSang() %></td>
			<td><%=p.getSu() %></td>
			<td><%=p.getDan() %></td>
		</tr>
<%
	}
%>
	</table>
	
	<br>
	방법 2) JSTL <br>
	<table border="1">
		<tr><th>code</th><th>sang</th><th>su</th><th>dan</th></tr>
		<c:forEach var="s" items="<%=list %>">
			<tr>
				<td>${s.code }</td><td>${s.sang }</td><td>${s.su }</td><td>${s.dan }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>