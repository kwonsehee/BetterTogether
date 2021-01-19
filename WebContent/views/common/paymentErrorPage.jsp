<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message=(String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스타일  -->
<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<style>
#home_btn{
   font-family: "Do Hyeon";
   width: 150px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   font-size: 20px;
}

#msg_content{
	font-size : 30px;
	font-family: "Do Hyeon";
	
}

button:focus{
	outline:none;
}
</style>
</head>
<body>
  <%@ include file="../common/common_ui.jsp"%>
  <section id="content" class="content_css">
  
	<h1 id="msg_content" align='center'><%= message %></h1>
	<div align='center'>
		<button id="home_btn" onclick="location.href='<%=request.getContextPath() %>'">홈으로 돌아가기 </button>
  </section>
</body>
</html>