<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 모집한 챌린지 그룹</title>
<style>
	#myJoinChallForm{
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

    #mychall {
        background-color: white;
        width: 900px;
        height: 110px;
        text-align: center;
        font-family: "Do Hyeon";
        font-size: 24px;
        border-radius: 20px;
    }

    #update{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
        margin-right: 20px;
    }

    #delete{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
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
	<form id="myJoinChallForm" action="<%= request.getContextPath() %>/myPage/myJoin" 
	method="post">
		<section id="content-1">
            <h1 id="title">내가 모집한 챌린지그룹</h1>
            <div id="mychall">
                <button type="button" id="update"><a href="#">수정</a></button>
                <button type="remove" id="delete"><a href="#">삭제</a></button>
            </div>
        </section>
        <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
    	
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