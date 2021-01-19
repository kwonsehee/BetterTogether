<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="challenge.model.vo.Challenge"%>
<%
	Challenge ch = (Challenge)request.getAttribute("challenge");   
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
#listbtn{
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
		<button id="listbtn">목록으로 돌아가기 </button>
  </section>
  

  <!-- form 태그를 post 방식으로 제출 
	challNo를 화면에 드러내지 않고 form을 submit 하면서 넘길 수 있음-->
	<form id="challNoForm" method="post">
		<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>"> 
	</form>
	
	<script>
	const listbtn = document.getElementById('listbtn');
	listbtn.addEventListener('click',function(){
		$("#challNoForm").attr("action", "<%= request.getContextPath()%>/chall/list");
		$("#challNoForm").submit();
	});
	
	</script>
  
 
  
</body>
</html>