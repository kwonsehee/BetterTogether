<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여했던 챌린지 그룹</title>
<style>

    #joinedChallForm{
        width: 950px;
		height: 800px;
		/* border: 1px solid black; */
		margin-top: -6%;
		padding-left: 5%;
		 background-color: #f9f1f1;
		 border-radius: 20px;
        }
        
	#joinedChall {
		 font-family: "Do Hyeon";
	}
	
	#title{
            margin-top: 70px;
            font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 300px;
        }
	
	#date{
            border: 1px solid white;
            border-radius: 10px;
            margin-left: 70px;
            padding: 5px;
            padding-left: 50px;
            font-family: "Do Hyeon";
            font-size: 18px;
        }

      #date2{
           border: 1px solid white;
           border-radius: 10px;
           margin: auto;
           padding: 5px;
           padding-left: 50px;
           font-family: "Do Hyeon";
           font-size: 18px;
       }

       #month1{
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 40px;
           margin-top: 10px;
           font-size: 16px;
       }

       #month2{
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 10px;
           margin-top: 10px;
           font-size: 16px;
       }

       #month3{
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 10px;
           margin-top: 10px;
           font-size: 16px;
       }

       #check{
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 50px;
           margin-top: 10px;
           font-size: 16px;
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
        
        #joined {
        	font-family: "Do Hyeon";
            font-size: 18px;
            margin-left: 300px;
            margin-top: 50px;
        }
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>
	<form id="joinedChallForm" action="<%= request.getContextPath() %>/myPage/joined" 
	method="post">
	<section id="content">
		<h1 id="title">참여했던 챌린지 그룹</h1>
		<input type="date" id="date"> ~ <input type="date" id="date2">
        <button type="button" id="month1">한달 전</button>
        <button type="button" id="month2">세달 전</button>
        <button type="button" id="month3">1년 전</button>
        <button type="submit" id="check">조회</button>
        
        <div id=joined>참여했던 챌린지 그룹이 없습니다.</div>
        
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