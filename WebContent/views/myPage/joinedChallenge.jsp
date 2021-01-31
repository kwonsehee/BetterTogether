<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
   ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
   
      
      PageInfo pi = (PageInfo)request.getAttribute("pi");
      
      
     /*  Search s = (Search)request.getAttribute("search");
      String search = "";
      String searchCondition = "";
      String[] selected = new String[3];
      if(s != null){
         search = s.getSearch();
         searchCondition = s.getSearchCondition();
         if(searchCondition.equals("writer")){
            selected[0] = "selected";
         }else if(searchCondition.equals("title")){
            selected[1] = "selected";
         }else{
            selected[2] = "selected";
         }
      }   */
   	
      
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
           margin: auto;
           padding: 5px;
           padding-left: 50px;
           font-family: "Do Hyeon";
           font-size: 18px;
       }

       .threemons{
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 300px;
           font-size: 24px;
       }

       .sixmons {
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
           font-family: "Do Hyeon";
           margin-left: 10px;
           margin-top: 10px;
           font-size: 24px;
       }

       .year {
           border: 1px solid #fdc8c6;
           border-radius: 20px;
           background-color: #fdc8c6;
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
        
        /* 검색하기 영역 */
      .searchArea {
         float:left;
         margin-top:30px;
         margin-left: -80px;
      }
      
      #searchCondition{
         font-family: "Do Hyeon";
         font-size:20px;
         height:30px;
      }
      
      input:focus, #pagingArea button:focus{
         outline: none;
      }
      
      #search_btn{
         font-family: "Do Hyeon";
         border-radius: 20px;
           border: solid 1px #fdc8c6;
           background-color: #fdc8c6;
           padding:5px 15px 5px 15px;
           font-size:17px;
      }
      
      #listTable th:nth-child(3){
         width: 250px;
      }
      
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>  
   
   <section id="content" class="joined_content">
      <h3 id="title">참여했던 챌린지 그룹</h3>
      <% if(loginUser!=null && cList!=null) { %>
     <%--  <form action="<%= request.getContextPath() %>/joined/dateSelect" method="post">
      <input type="hidden" name="threemonths" value="3개월">
     <input type="button" id="month1" class="threemons" name="3개월">3개월 전
      </form>
      
      <form action="<%= request.getContextPath() %>/joined/dateSelect" method="post">
      <input type="hidden" name="sixmonths" value="6개월">
      <input type="button" id="month2" class="sixmons" name="6개월">6개월 전      
      </form>
      
      <form action="<%= request.getContextPath() %>/joined/dateSelect" method="post">
      <input type="hidden" name="oneyear" value="12개월">
      <input type="button" id="month3" class="year" name="1년 전">1년 전      
      </form> --%>
      
            <div id="joined">
                 <div id="joinedChall">
                 <table id="joinedList">
                    <tr>
                    	<th>챌린지 번호</th>
                    	<th>카테고리</th>
                    	<!-- <th>카테고리 명</th> -->
                       <th>챌린지 명</th>
                       <th>챌린지 기간</th>
                    </tr>
         <% for(Challenge chall : cList) { %>
                    <tr>
                    	<td><%= chall.getChallNo() %></td>
                    	<td><%= chall.getCateName() %></td>
                       <td><%= chall.getChallTitle() %></td>
                       <td><%=chall.getChallStart() %>~<%= chall.getEndDate() %></td>
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
			
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=1'"> &lt;&lt;</button>	
 
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:white;" disabled><%= p %></button>	
			
			<% } else {%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
             <!-- 맨 끝으로 (>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/joined/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
               
            </div>
                <button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button>
                <button id="backBtn" type="button" class="text_font joinform_btn" onclick="javascript:history.back();">뒤로가기</button>
            
      
     <%--   <!-- 검색 영역 -->
            <div class="searchArea">
               <form action="<%= request.getContextPath() %>/joined/search" method="get"
               onsubmit="return checkSearchCondition();">
                  <select id="searchCondition" name="searchCondition">
	                  <option value="----">----</option>
	                  <option value="title" <%= selected[0] %>>제목</option>
					  <option value="category" <%= selected[1] %>>카테고리</option>
					  <option value="writer" <%= selected[2] %>>작성자</option>                  
                  </select>
                  <% if(search != null) {%>
                  <input type="search" name="search" value="<%= search%>">
                  <% } else { %>
                  <input type="search" name="search">
                  <% } %>
                  <button type="submit" id="search_btn">검색하기</button>
               </form>
            </div>
 --%>
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
    
   <%--  <script>
    	//1.3개월 전 
    	const month1 = document.getElementById('month1');
    	month1.addEventListener('click', function(){
    		location.href='<%= request.getContextPath()%>/joined/3mons';
    	});
    </script> --%>
</body>
</html>