<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="news.model.vo.News, java.util.ArrayList"%>
<%
//새로운 소식이 있는지 확인
ArrayList<News> news = null;
if(session.getAttribute("news")!=null){
	news = (ArrayList<News>)session.getAttribute("news");
	System.out.println("commonUi의 news 갯수"+news.size());
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>

<%
	if(request.getAttribute("result")!=null){
		if(request.getAttribute("result").equals("success")){
%>
<script>
opener.parent.location.reload();
	window.close();
</script>
<%} 
		}%>
<style>
#loginTitle{
            text-align: center;
            font-size:30px;
            margin-top: 10%;
            margin-bottom:3%;
        }
	li{
		margin-top:50px;
	 	padding-left:10px; 
	}
#newsCheckAfter{
font-family: "Nanum Gothic";
         border-radius: 10px;
           border: solid 1px #9e9e9e5b;
           padding:5px 15px 5px 15px;
           background-color: #e6e4e4b6;
           font-size:10px;
           font-weight: bolder;
}
 .line{
            float: left;
            width: 100%;
            height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
             
        }
    
</style>
</head>
<body>

<div id="loginTitle">새로운 알림</div>
<div class="line"></div>
	<%if(news!=null){ %>
	<ul>
	<%for(int i=0; i<news.size();i++){ %>
		<!-- 챌린지0 신고1 질문답변2 -->
		<%if(news.get(i).getNews_cate()==1){ %>
		<li>회원님이 작성한 게시글이 신고되었습니다.</li>
		
		<%}else if(news.get(i).getNews_cate()==0){ %>
		<br>
		<li>회원님이 참여한 챌린지 <%=news.get(i).getTitle() %>가 삭제 또는 신고되어 챌린지 신청이 철회되었습니다.</li>
		<%}else if(news.get(i).getNews_cate()==3){ %>
		<li>회원님이 신고한 <%=news.get(i).getTitle() %>가 신고처리 되었습니다.</li>
		<%}else if(news.get(i).getNews_cate()==2){ %>
		<li>회원님의 질문<%=news.get(i).getTitle() %>에 관리자가 답변을 달아주었습니다.</li>
		
		<%} %>
	
	<%} %>
	</ul>
	<p style="text-align:center;color:#937CF7;margin-top:10%;">마이페이지를 확인해주세요</p>
	<button id="newsCheckAfter" style="margin-left:45%;">확인</button>
	<%} %>
	
	<script>
	//home버튼
	   const newsCheckAfter = document.getElementById("newsCheckAfter");
	   newsCheckAfter.addEventListener('click',function(){
	      location.href="<%= request.getContextPath()%>/news/checkAfter";
	   });
	
	</script>	

</body>
</html>