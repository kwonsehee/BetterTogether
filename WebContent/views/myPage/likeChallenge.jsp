<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
    
<%
	//리스트 가져오기
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	
	//페이징 바
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	//찜하기 -> 취소
	String hits_status = "";
	if(cList!=null){
		hits_status = (String)request.getAttribute("hits_status");
	}
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
            font-size: 24px;
            margin-left : -40px;
            margin-top : 50px;
        }  
        
     #backBtn {
        	border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 24px;
        }
        
       #like1 {
           font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 0px;
            margin-top: 50px;
        }
        
        #like {
        	font-family: "Do Hyeon";
            font-size: 24px;
            font-align : "center";
           	margin-right: 50px;
            margin-top: 50px;
            border: 2px solid white;
          
        }
        
        #likeList {
        	margin:auto;
        	
        	
        }
        
         /*페이징 css*/
        #pagingArea {
    	  margin-left:-40px;
  	   }
      	#pagingArea button {
            font-family: "Do Hyeon";
            font-size : 18px;
            color: black;
            text-decoration: none;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            
        }
        
         #page_css {
            width: 100%;
            height: 20%;
            float: left;
            padding-top: 50px;
            padding-left: 400px;
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
                 				<th>챌린지번호</th>
                 				<th>카테고리</th>
                 				<th>챌린지 제목</th>
                 				<th>챌린지 기간</th>
                 			</tr>
         			<% for(Challenge chall : cList) { %>
                 			<tr>
                 				<td><%= chall.getChallNo() %></td>
                 				<td><%= chall.getCateName() %></td>
                 				<td><%= chall.getChallTitle() %></td>
                 				<td><%= chall.getChallPeriod() %></td>
                 				<td><button id="likeDeleteBtn">찜하기 취소</button></td>
                 			</tr>
          			<% } %> 
                 		</table>
                 		</div>
           			</div>
      			<% } else { %>
       				 <div id="like1">찜하기한 챌린지 그룹이 없습니다.</div>
       			<% } %>
    	
 
  <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=1'"> &lt;&lt;</button>	
 
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:white;" disabled><%= p %></button>	
			
			<% } else {%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/like/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
               
            </div>
            <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
            <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
            </section>	
            </section>
       <script>

      $(function(){
    	  //챌린지 찜하기 취소 버튼 클릭 시 찜하기한 챌린지에서 삭제하기
    	  $("#likeDeleteBtn").click(function(e){
    		  //likeList에 이벤트를 걸어놔서 버튼에도 이벤트가 걸림 stopProagation으로 막아줌
         	 e.stopPropagation(); 
    		  //td에 있는 버튼 
         	 var num = $(this).parent().parent().children().eq(0).text();
    		  //찜하기 취소 버튼 클릭 시 넘어가게 하기
         	 location.href="<%= request.getContextPath() %>/like/hits?challNo=" +num;
          });
          
    	  
       // 챌린지 상세보기 기능 (jQuery를 통해 작업)
         $("#likeList td").mouseenter(function(){
            $(this).parent().css({"background":"white", "cursor":"pointer"});
         }).mouseout(function(){
            $(this).parent().css("backgroundColor", "#f9f1f1");
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
              // 쿼리 스트링을 이용하여 get방식으로 글 번호를 전달 
            location.href="<%= request.getContextPath() %>/chall/join?challNo=" +num;
         });
         
         
       
         
         
         
      }); 
       
    </script>
            
   	<script>
	 //1.메인으로 돌아가기
	const goMainBtn = document.getElementById('goMainBtn');
	goMainBtn.addEventListener('click',function(){
		location.href='<%= request.getContextPath()%>';
	});
   	</script>
</body>
</html>