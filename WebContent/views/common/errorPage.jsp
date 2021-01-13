<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message=(String)request.getAttribute("msg");
%>
<%--김은화 주석 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1 align='center'><%= message %></h1>
	<div align='center'>
		<button onclick="location.href='<%=request.getContextPath() %>'"
		style="width:50%">홈으로 돌아가기 </button>
		<!-- 세희의 주석  -->
	</div>
</body>
</html>