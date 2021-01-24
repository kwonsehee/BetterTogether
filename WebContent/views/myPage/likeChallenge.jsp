<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge"%>
    
<%
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	
	String challTitle = (String)request.getAttribute("challTitle");
	String challPeriod = (String)request.getAttribute("challPeriod");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜하기한 챌린지 그룹</title>
<style>
	.like_content{
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
          margin-top: 50px;
          margin-left: 00px;
          width: 900px;
          height: 50px;
          text-align: center;
          font-family: "Do Hyeon";
          font-size: 36px;
          border-radius: 20px;
        }  
        
       #likeDetailBtn {
	       border: 1px solid #fdc8c6;
	       background-color: #fdc8c6;
	       border-radius: 20px;
	       font-family: "Do Hyeon";
	       font-size: 18px;
	       margin-left: 20px;
  	 }

    #likeDeleteBtn{
        border: 1px solid #fdc8c6;
        background-color: #fdc8c6;
        border-radius: 20px;
        font-family: "Do Hyeon";
        font-size: 18px;
        margin-left:20px;
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
       #like1 {
           font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 0px;
            margin-top: 50px;
        }
        
        #like {
        	font-family: "Do Hyeon";
            font-size: 20px;
            font-align : "center";
            margin-left: 30px;
            margin-top: 50px;
            background-color : White;
            width : 90%;
        }
        
        #likeList {
        	margin:auto;
        	
        	
        }
        
      
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp" %>

		<section id="content" class="like_content">
           	<h1 id="title">찜하기한 챌린지 그룹</h1>
           		<% if(loginUser != null && cList!=null) { %>
            		<div id="like">
                 		<div id="likdChall">
                 		<table id="likeList">
                 			<tr>
                 				<td>챌린지 제목</td>
                 				<td>챌린지 기간</td>
                 			</tr>
         			<% for(Challenge chall : cList) { %>
                 			<tr>
                 				<td><%= chall.getChallTitle() %></td>
                 				<td><%= chall.getChallPeriod() %><%-- <button id="likeDetailBtn" onclick="location.href='<%=request.getContextPath() %>/chall/join?chall_no='"+chall_no>상세보기</button> --%><button type="delete" id="likeDeleteBtn">찜하기 취소</button></td>
                 			</tr>
          			<% } %> 
                 		</table>
                 		</div>
           			</div>
      			<% } else { %>
       				 <div id="like1">찜하기한 챌린지 그룹이 없습니다.</div>
       			<% } %>
    	<button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
    	</section>	
 
   	<script>
	 //1.메인으로 돌아가기
	const goMainBtn = document.getElementById('goMainBtn');
	goMainBtn.addEventListener('click',function(){
		location.href='<%= request.getContextPath()%>';
	});
   	</script>
</body>
</html>