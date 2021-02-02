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
<title>새로운 알림 보여주는 창</title>
<%
	if(request.getAttribute("result")!=null){
		if(request.getAttribute("result").equals("success")){
%>
<script>
	window.close();
</script>
<%} else{ %>
<script>
	alert("새로운 소식 확인에 실패하였습니다.");
</script>
<%		}
	}%>
</head>
<body>
	<%if(news!=null){ %>
	<%for(int i=0; i<news.size();i++){ %>
		<!-- 챌린지0 신고1 질문답변2 -->
		<%if(news.get(i).getNews_cate()==0){ %>
			<a>참여 신청한 챌린지가 삭제 또는 신고되어 챌린지 신청이 철회되었습니다.</a>
		
		<%}else if(news.get(i).getNews_cate()==1){ %>
		<a>회원님이 작성한 게시글이 신고되었습니다.</a>
		
		<%}else { %>
		<a>회원님의 질문에 관리자가 답변을 달아주었습니다.</a>
		
		<%} %>
	<%} %>
	<p>마이페이지를 확인해주세요</p>
	<button id="newsCheckAfter">확인</button>
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