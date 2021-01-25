<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	Member m = (Member)(session.getAttribute("loginUser"));
 */
%>

<%
	if(request.getAttribute("msg")!=null){
		if(request.getAttribute("msg").equals("success")){
%>
<script>
	alert("신고에 성공하였습니다.");
	window.close();
</script>
<%}
}%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 신고한 글</title>
<style>
	#report_form{
        width: 950px;
      height: 1000px;
      /* border: 1px solid black; */
      margin-top: -6%;
      padding-left: 5%;
       background-color: #f9f1f1;
       border-radius: 20px;
        }
    
    #title{
            margin-top: 70px;
            font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 350px;
        }
        
     #report {
            background-color: white;
            width: 850px;
            height: 800px;
            text-align: center;
            font-family: "Do Hyeon";
            font-size: 24px;
            border-radius: 20px;
        }
       #goMainBtn{
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 18px;
            margin-left : 400px;
            margin-top : 100px;
        }  
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>
	<form id="joinedChallForm" action="<%= request.getContextPath() %>/myPage/joined" 
	method="post">
	<section id="report_form">
		<h1 id="title">내가 신고한 글</h1>
		<!-- 내가신고당한 횟수를 알려주는 부분  -->
		
		<div>
		
		</div>
        <div id="report">
                신고 대상<br>
                카테고리<br>
                신고일자<br>
                상태<br>
        	
        </div>
    <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
    </section>
    
    
    <script>
		 //1.메인으로 돌아가기
		const goMainBtn = document.getElementById('goMainBtn');
		goMainBtn.addEventListener('click',function(){
			location.href="<%= request.getContextPath()%>";
		});
    </script>
    </form>
</body>
</html>