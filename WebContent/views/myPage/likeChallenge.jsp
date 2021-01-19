<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기한 챌린지 그룹</title>
<style>
	#likeChallForm{
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
        
    #like1{
          background-color: white;
          margin-top: 50px;
          margin-left: 00px;
          width: 900px;
          height: 50px;
          text-align: center;
          font-family: "Do Hyeon";
          font-size: 36px;
          border-radius: 20px;
        }  
        
       #readBtn{
	       border: 1px solid #fdc8c6;
	       background-color: #fdc8c6;
	       border-radius: 20px;
	       font-family: "Do Hyeon";
	       font-size: 18px;
	       margin-right: 20px;
  	 }

    #deleteBtn{
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
	<form id="likeChallForm" action="<%= request.getContextPath() %>/myPage/like" 
	method="post">
		<section id="content-1">
           	<h1 id="title">찜하기한 챌린지 그룹</h1>
           	<div id="like1"><a href="#"></a>
           		<button type="button" id="readBtn"><a href="#">상세보기</a></button>
               	<button type="remove" id="deleteBtn"><a href="#">삭제</a></button>
  
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