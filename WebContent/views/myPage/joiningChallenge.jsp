<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 챌린지 그룹</title>
<style>
	.joining_content{
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
    
    #joining {
           font-family: "Do Hyeon";
            font-size: 24px;
            font-align : "center";
           	margin-right: 50px;
            margin-top: 50px;
            border: 2px solid white;
            /* width : 90%; */
            
        }
    
     #goMainBtn{
            border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 24px;
            margin-left : -30px;
            margin-top : 50px;
        }  
        
       #backBtn {
        	border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 24px;
        }
        
        #joiningList{
        	font-align : "center";
        	margin : auto;
        }
        
      
     /*페이징 css*/
        #pagingArea {
    	   margin-left:-30px;
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
	<section id="content" class="joining_content">
		<h1 id="title">참여중인 챌린지그룹 조회</h1>
          <% if(loginUser!=null && cList!=null) { %>
            <div id="joining">
                 <div id="joiningChall">
                 <table id="joiningList">
                    <tr>
                    	<th>카테고리</th>
                    	<!-- <th>카테고리 명</th> -->
                       <th>챌린지 명</th>
                       <th>챌린지 기간</th>
                    </tr>
         <% for(Challenge chall : cList) { %>
                    <tr>
                    	<td><%= chall.getCateName() %></td>
                       <td><%= chall.getChallTitle() %></td>
                       <td><%= chall.getChallPeriod() %></td>
                    </tr>
          <% } %> 
                 </table>
                 </div>
           </div>
      <% } else { %>
        <div id="joined1">참여했던 챌린지그룹이 없습니다.</div>
       <% } %>
       
        <!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=1'"> &lt;&lt;</button>	
 
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:white;" disabled><%= p %></button>	
			
			<% } else {%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/joining/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
               
            </div>
                <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
            	 <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
    		</section>
        </section>
    	 <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업) 
      $(function(){
         $("#joiningList td").mouseenter(function(){
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
		location.href='<%=request.getContextPath()%>';
	});
   	</script>
</body>
</html>