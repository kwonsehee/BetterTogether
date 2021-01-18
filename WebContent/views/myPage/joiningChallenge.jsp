<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 챌린지 그룹</title>
<style>
	#joiningChallForm{
        width: 950px;
		height: 800px;
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
            margin-left: 300px;
        }
	

    #join1 {
        background-color: white;
        margin-top: 50px;
        width: 900px;
        height: 80px;
        text-align: center;
        font-family: "Do Hyeon";
        font-size: 28px;
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
	<form id="joiningChallForm" action="<%= request.getContextPath() %>/myPage/joining" 
	method="post">
		<section id="content">
            <h1 id="title">참여중인 챌린지그룹 조회</h1>
            <div id="join1"><a href="#"></a>참여중인 챌린지 그룹이 없습니다.</div>
    <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
        </section>
    	
    </form>
   	<script>
	 //1.메인으로 돌아가기
	const goMainBtn = document.getElementById('goMainBtn');
	goMainBtn.addEventListener('click',function(){
		location.href='<%=request.getContextPath()%>';
	});
   	</script>
</body>
</html>