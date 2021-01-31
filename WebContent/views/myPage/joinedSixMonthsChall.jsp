<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*, myPage.model.vo.*"%>
<%
   ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
   
      
      PageInfo pi = (PageInfo)request.getAttribute("pi");

      
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여했던 챌린지 그룹</title>
<style>

    .joined_content{
        width: 950px;
      height: 1000px;
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
           /* margin: auto;
           padding: 5px;
           padding-left: 50px; */
           font-family: "Do Hyeon";
           font-size: 18px;
       }

       #threeMons_btn{
           border: 2px solid #fdc8c6;
           border-radius: 20px;
          /*  background-color: #fdc8c6; */
           background-color : white;
           font-family: "Do Hyeon";
           margin-left: 300px;
           font-size: 24px;
       }

      #sixMons_btn {
           border: 2px solid #fdc8c6;
           border-radius: 20px;
          /*  background-color: #fdc8c6; */
           background-color : white;
           font-family: "Do Hyeon";
           margin-left: 10px;
           margin-top: 10px;
           font-size: 24px;
       }

       #oneyear_btn {
           border: 2px solid #fdc8c6;
           border-radius: 20px;
          /*  background-color: #fdc8c6; */
            background-color : white;
           font-family: "Do Hyeon";
           margin-left: 10px;
           margin-top: 10px;
           font-size: 24px;
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
            font-size: 24px;
            margin-left : -20px;
            margin-top : 50px;
        }
        
        #backBtn {
        	border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 24px;
        }
        
        #joined {
           font-family: "Do Hyeon";
            font-size: 24px;
            font-align : "center";
           	margin-right: 50px;
            margin-top: 50px;
            border: 2px solid white;
            /* width : 90%; */
            
        }
        
        #joinedList{
        	font-align : "center";
        	margin : auto;
        }
        
        #joined1 {
           font-family: "Do Hyeon";
            font-size: 36px;
            margin-left: 250px;
            margin-top: 50px;
        }
        
        #joinedDetailBtn {
        	border: 1px solid #fdc8c6;
            background-color: #fdc8c6;
            border-radius: 20px;
            font-family: "Do Hyeon";
            font-size: 18px;
            margin-left : 00px;
            margin-top : 0px;
        }
        
      /*페이징 css*/
        #pagingArea {
    	  /* margin:auto; */
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
   <%@ include file="../common/common_ui.jsp"%>  
   
   <section id="content" class="joined_content">
      <h3 id="title">참여했던 챌린지 그룹</h3>
      <% if(loginUser!=null && cList!=null) { %>
      		<button id="threeMons_btn" class="threeMonths" name="3mons" onclick="location.href='<%=request.getContextPath()%>/joined/threeMonths'">3개월</button>
      		<button id="sixMons_btn" class="sixMonths" name="6mons" onclick="location.href='<%=request.getContextPath()%>/joined/sixMonths'">6개월</button>
      		<button id="oneyear_btn" class="oneyear" name="1year" onclick="location.href='<%=request.getContextPath()%>/joined/oneyear'">1년</button>
           
            <div id="joined">
                 <div id="joinedChall">
                 <table id="joinedList">
                    <tr>
                    	<th>챌린지 번호</th>
                    	<th>카테고리</th>
                       <th>챌린지 명</th>
                       <th>챌린지 기간</th>
                    </tr>
         <% for(Challenge chall : cList) { %>
                    <tr>
                    	<td><%= chall.getChallNo() %></td>
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
			<!-- 참여했던 챌린지 메인에서 보여질 페이징 바 -->
			<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=1'"> &lt;&lt;</button>	
 			
 			<%-- <!-- 3개월, 6개월, 12개월 클릭 했을 경우 보여질 페이징 바 -->
 			<% if(ds.getThreeMonths() <=3) { %>
 			<button onclick="location.href='<%= request.getContextPath() %>/joined/threeMonths?currentPage=1&threeMonths=<%= threeMonths %>'"> &lt;&lt;</button>	
			<% } else if (ds.getSixMonths()<=6) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=1&sixMonths=<%= sixMonths %>'"> &lt;&lt;</button>	
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/joined/oneyear?currentPage=1&oneyear=<%= oneyear %>'"> &lt;&lt;</button>
			<% } %> --%>
				
			<!-- 이전으로(<) -->
			<!-- 1페이지일 경우 이전으로 버튼 비활성화 -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<!-- 참여했던 챌린지 기본 메인 페이지 -->
			<% } else {%>			
	        <button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
				<%-- <!-- 참여했던 챌린지 3,6,12개월 버튼 클릭 시 페이지 이동 -->
				<% if(ds.getThreeMonths() <=3) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/threeMonths?currentPage=<%= pi.getCurrentPage() -1 %>&threeMonths=<%= threeMonths %>'"> &lt;</button>	
				<% } else if(ds.getSixMonths() <=6) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getCurrentPage() -1 %>&sixMonths=<%= sixMonths %>'"> &lt;</button>	
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/oneyear?currentPage=<%= pi.getCurrentPage() -1 %>&oneyear=<%= oneyear %>'"> &lt;</button>	
				<% } %> --%>
			<% } %>
			
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
				<% if(p == pi.getCurrentPage()) { %>
				<button style="background:white;" disabled><%= p %></button>	
			
				<% } else {%>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%=p %>'"> <%= p %> </button>
					<%-- <% if(ds.getThreeMonths() <=3) { %>
					<button onclick="location.href='<%= request.getContextPath() %>/joined/threeMonths?currentPage=<%=p %>&threeMonths=<%= threeMonths %>'"><%= p %></button>
					<% } else if(ds.getSixMonths() <=6) { %>
					<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%=p %>&sixMonths=<%= sixMonths %>'"> <%= p %> </button>
					<% } else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/joined/oneyear?currentPage=<%=p %>&oneyear=<%= oneyear %>'"> <%= p %> </button>
					<% } %> --%>
				<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button>
				<%-- <% if(ds.getThreeMonths() <=3) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/threeMonths?currentPage=<%= pi.getCurrentPage() + 1 %>&threeMonths=<%= threeMonths %>'"> &gt;</button>
				<% } else if(ds.getSixMonths() <=6){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getCurrentPage() + 1 %>&sixMonths=<%= sixMonths %>'"> &gt;</button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/joined/oneyear?currentPage=<%= pi.getCurrentPage() + 1 %>&oneyear=<%= oneyear %>'"> &gt;</button>
				<% } %> --%>
			<% } %>
             
             
             <!-- 맨 끝으로 (>>) -->
			 <button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
           	<%--  <% if(ds.getThreeMonths() <=3) { %>
             <button onclick="location.href='<%= request.getContextPath() %>/joined/threeMonths?currentPage=<%= pi.getMaxPage() %>&threeMonths=<%= threeMonths %>'"> &gt;&gt; </button>
             <% } else if(ds.getSixMonths() <=6) { %>
             <button onclick="location.href='<%= request.getContextPath() %>/joined/sixMonths?currentPage=<%= pi.getMaxPage() %>&sixMonths=<%= sixMonths %>'"> &gt;&gt; </button>
             <% } else { %>
             <button onclick="location.href='<%= request.getContextPath() %>/joined/year?currentPage=<%= pi.getMaxPage() %>&oneyear=<%= oneyear %>'"> &gt;&gt; </button>
             <% } %> --%>
            </div>
                <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
                <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
        </section>

    </section>
    
     <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업) 
      $(function(){
         $("#joinedList td").mouseenter(function(){
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