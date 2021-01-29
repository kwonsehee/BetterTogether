 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.*, common.model.vo.*"%>
<%
   // 챌린지 리스트 
   ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
   int cate = 0;
   //cate
   if(request.getAttribute("cate")!=null){
     cate = Integer.parseInt((String.valueOf(request.getAttribute("cate"))));
   }
   
 //challBoard type 1:시작전,2:진행중,3:종료
   int challBoardType = 0;
   if(request.getAttribute("challBoardType")!=null){
	   challBoardType = Integer.parseInt((String.valueOf(request.getAttribute("challBoardType"))));
   } 
   
   // 페이징 처리 
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   // 검색 기능
   	Search s = (Search)request.getAttribute("search");
	String search = "";
	String searchCondition = "";
	String[] selected = new String[3];
	if(s != null){
		search = s.getSearch();
		searchCondition = s.getSearchCondition();
		if(searchCondition.equals("title")){
			selected[0] = "selected";
		} else if(searchCondition.equals("category")){
			selected[1] = "selected";
		} else {
			selected[2] = "selected";
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
         #title{
         	margin-top:50px;
            width: 100%;
        }
        #title span {
            font-size: 30px;
            font-family: "Do Hyeon";
            text-align: center;
            padding-top: 10px;
            margin-left:400px;
        }


        .challenge_table {
            font-family: "Do Hyeon";
            font-size: medium;
            margin-left: 40px;
            width: 90%;
            border-top: 2px solid #ff6064;
            border-collapse: collapse;
            margin-top:30px;
        }

        .challenge_table th,
        .challenge_table td {
            border-bottom: 1px solid #444444;
            padding: 10px;
            text-align: center;
        }
        


        #challenge_btn {
            font-family: "Do Hyeon";
            width: 150px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            margin-top: -60px;
            float: right;
            font-size: 20px;
            margin-right: 50px;
        }


        /*페이징 css*/
        #pagingArea {
    	  margin:auto;
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
      
      #btnType_area{
      	 margin-left:373px;
      	 margin-top:60px;
      	
      }
      
      #btnType_area button {
      	 font-family: "Do Hyeon";
            width: 80px;
            height: 30px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: white;
            font-size:17px;
            margin-top:20px;
      }
      

 
    </style>
</head>
<body>
  <%@ include file="../common/common_ui.jsp"%>
  
  <section id="content" class="content_css">
        <section id="title">
            <span>챌린지 모집 게시판</span>
            <!-- 어떤 카테고리의 것인지 표시해주기 -->
        </section>
        
        <!-- 1:시작전 2:진행중 3:종료 -->
        <form action="<%= request.getContextPath() %>/chall/type" method="post" id="type_form">
        	<span id="btnType_area">
				<button type="submit" name="challBoardType" value="1">시작전</button>
				<button type="submit" name="challBoardType" value="2">진행중</button>
				<button type="submit" name="challBoardType" value="3">종료</button>
			</span>
        </form>
        
        
        <section id="content-1">
            <table id= "listTable" class="challenge_table">
                    <tr>
                        <th>번호</th>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>모집인원수</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                
                <% if(list.isEmpty()) { %>
                <tr>
                   <td colspan="8">조회 된 챌린지가 없습니다.</td>
                </tr>
                <% } else { %>
                   <% for(Challenge ch : list) { %>
                   <tr>
                      <td><%= ch.getChallNo() %></td>
                      <td><%= ch.getCateName() %></td>
                      <td><%= ch.getChallTitle() %></td>
                      <td><%= ch.getChallPeople() %>명</td>
                      <td><%= ch.getNickName() %></td>
                      <td><%= ch.getChallDate() %></td>
                      <td><%= ch.getChallCnt() %></td>
                   </tr>
                   <% } %>
                   <% } %>   
            </table>
        </section>

		<!-- 페이징 바 -->
        <section id="page_css">
            <div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			<% if(s != null) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt;</button>		
			<%}else if(cate !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=1&cate=<%= cate %>'"> &lt;&lt;</button>		
			<% }else if(challBoardType !=0 ){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=1&challBoardType=<%= challBoardType %>'"> &lt;&lt;</button>		
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=1'"> &lt;&lt;</button>	
			<% } %>  
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else if(s != null) { %>		
			<button onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getCurrentPage() - 1%>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;</button>	
			
			<%}else if(cate !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getCurrentPage() - 1%>&cate=<%= cate %>'"> &lt;</button>		
			 <%}else if(challBoardType !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/chall/type?challBoardType=<%= pi.getCurrentPage() - 1 %>&challBoardType=<%= challBoardType %>'"> &lt;</button>
			<% } else {%>
	        <button onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:white;" disabled><%= p %></button>
			<% } else if(s != null){%>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%=p %>&searchCondition=<%= searchCondition %>&search=<%=search %>'"> <%= p %></button>	
			<%}else if(cate !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= p%>&cate=<%= cate %>'">  <%= p %></button>		
			<%} else if(challBoardType !=0) {%>
			 <button onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= p%>&challBoardType=<%= challBoardType %>'">  <%= p %></button>		
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			<% } else if (s != null){%>
			
			<button onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;</button>				
			<%}else if(cate !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getCurrentPage() + 1%>&cate=<%= cate %>'"> &gt;</button>		
			<% } else if (challBoardType !=0) {%>
			 <button onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= pi.getCurrentPage() + 1%>&challBoardType=<%= challBoardType %>'"> &gt;</button>		
			<% } else {%>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
              
             <!-- 맨 끝으로 (>>) -->
			<% if(s != null) {%>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
			<%}else if(cate !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getMaxPage()%>&cate=<%= cate %>'">  &gt;&gt;</button>		
			<% } else if(challBoardType !=0){ %>
			 <button onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= pi.getMaxPage()%>&challBoardType=<%= challBoardType %>'">  &gt;&gt;</button>		
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			
			<% }  %>  
               
            </div>
            
             <!-- 검색 영역 -->
            <div class="searchArea">
               <form action="<%= request.getContextPath() %>/chall/search" method="get"
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

        </section>
        
      

        <form method="POST">
            <section id="content-3">
                <%-- 로그인 유저만 작성하기 버튼 보이기 --%>
                <% if(loginUser != null) { %>
                <button id="challenge_btn" type="button" onclick="location.href='<%= request.getContextPath() %>/views/challenge/challengeMake.jsp'">챌린지 개설</button>
                <% } %>
            </section>
        </form>

    </section>
    
     <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업)

      $(function(){
         $("#listTable td").mouseenter(function(){
            $(this).parent().css({"background":"white", "cursor":"pointer"});
         }).mouseout(function(){
            $(this).parent().css("backgroundColor", "#f9f1f1");
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
              // 쿼리 스트링을 이용하여 get방식으로 글 번호를 전달 
              location.href="<%= request.getContextPath() %>/chall/join?challNo="+num;
         });
      });
       
    </script>
    

</body>
</html>
