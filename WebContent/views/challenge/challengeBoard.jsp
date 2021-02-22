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
<title>Better Together</title>

<style>
#challenge_btn {
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 10px 5px 10px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	float: right;
	margin-right: 8%;
	margin-bottom: 30px;
}

/*페이징 css*/
#pagingArea {
	text-align: center;
}

#pagingArea button {
	width: 25px;
	margin-top: 20px;
	border: 0px;
	color: #757575;
	font-family: "Nanum Gothic";
	font-size: 12px;
}

#pagingArea button:hover {
	cursor: pointer;
}

#btnType_area {
	margin-left: 42%;
}

#btnType_area button {
	font-family: "Nanum Gothic";
	width: 70px;
	height: 30px;
	border-radius: 20px;
	border: solid 1px #9e9e9e5b;
	font-size: 14px;
	margin-top: 20px;
	margin-bottom:20px;
}

/*밑에서부터 수정된 UI */
.challArea {
	width: 90%;
	min-height: 400px;
	margin: auto;
	padding-left: 7%;
}

.chall_list {
	width: 220px;
	display: inline-block;
	padding: 10px;
	margin: 10px;
	text-align: left;
}

#call_img {
	border-radius: 5px;
}

/* 챌린지 info css */
.chall_info {
	margin: 7px;
	font-family: "Nanum Gothic";
	font-size: 15px;
}

#chall_No, #chall_start {
	font-size: 12px;
	color: #616161b6;
	font-weight: bolder;
}

#chall_title {
	font-size: 13px;
	color: #252525b6;
	font-weight: bold;
}

#chall_freq, #chall_period {
	font-family: "Nanum Gothic";
	width: 60px;
	height: 30px;
	border-radius: 3px;
	border: solid 1px #e6e4e4b6;
	font-size: 11px;
	color: #616161b6;
	font-weight: bold;
	background-color: #e6e4e4b6;
	margin-left: 3%;
}

#check_img {
	width: 10px;
	height: 10px;
}

#content-1 {
	margin-top: 3%;
}

#cate_Name {
	background-color: #b6a8f5;
	border: solid 1px #b6a8f5;
	border-radius: 5px;
	color: white;
}

/* 검색영역 css */
.searchArea {
	float: left;
	width: 100%;
	text-align: center;
	padding: 20px;
}

#searchBtn {
	width: 80px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

#searchBtn:hover {
	cursor: pointer;
}

#searchBox {
	width: 300px;
	border: 1px solid rgba(219, 219, 219, 0.356);
}

#searchCondition {
	width: 70px;
	height: 30px;
	border: 1px solid rgba(219, 219, 219, 0.356);
	text-align: center;
}

.line {
	border: 0.5px solid #937cf790;
}

.dateBtn:focus, #challenge_btn:focus, #searchBtn:focus, .pagingBtn:focus {
	outline: none;
	border: solid 1px #937CF7;
	background-color: #e0dbf890;
}
</style>

</head>
<body>
  <%@ include file="../common/common_ui.jsp"%>
  
  <section id="btSection" class="content_css">
        <!-- <section id="title">
            <span>챌린지 모집 게시판</span>
            어떤 카테고리의 것인지 표시해주기
        </section> -->
        
        <!-- 1:시작전 2:진행중 3:종료 -->
        <form action="<%=request.getContextPath()%>/chall/type" method="post" id="type_form">
        	<span id="btnType_area">
				<button type="submit" class="dateBtn" name="challBoardType" value="1">시작전</button>
				<button type="submit" class="dateBtn" name="challBoardType" value="2">진행중</button>
				<button type="submit" class="dateBtn" name="challBoardType" value="3">종료</button>
			</span>
        </form>
        
       	<div class="line"></div>
       	 
        <section id="content-1">
            <%-- <table id= "listTable" class="challenge_table">
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
            </table> --%>
            	<div class="challArea">
				<% for(Challenge ch : list) {%>
				<div class="chall_list">
					<input type="hidden" value="<%=ch.getChallNo() %>">		
					<div>
						<% if(challBoardType == 3){ %>
						<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 200px;height: 150px; -webkit-filter: grayscale(100%); filter: gray;">
						<% }  else {%>
						<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 200px;height: 150px;">
						<% } %>
					</div>
					<p id="chall_No" class="chall_info"><img
						src="<%=request.getContextPath()%>/resources/images/challCheck.png"
						id="check_img"> 공식 챌린지 <button id="cate_Name" disabled><%= ch.getCateName()%></button></p>
					<p id="chall_title" class="chall_info"><%=ch.getChallTitle() %></p>	
					<p id="chall_start" class="chall_info"><%=ch.getChallStart() %> 시작</p>	
					<button id="chall_freq" disabled>주 <%=ch.getChallFrequency() %>회</button>
					<button id="chall_period" disabled><%=ch.getChallPeriod() %>주 동안</button>
				</div>
				<%} %>
            	</div>
            	
            	
            	<div id="pagingArea">
            <!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨 끝으로(>>) -->  
              
            <!-- 처음으로(<<) -->
			<% if(s != null) { %>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt;</button>		
			<%}else if(cate !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=1&cate=<%= cate %>'"> &lt;&lt;</button>		
			<% }else if(challBoardType !=0 ){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=1&challBoardType=<%= challBoardType %>'"> &lt;&lt;</button>		
			<% } else {%>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=1'"> &lt;&lt;</button>	
			<% } %>  
			
			<!-- 이전으로(<) -->
			<% if(pi.getCurrentPage() == 1) {%>
			<button disabled> &lt; </button>
			<% } else if(s != null) { %>		
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getCurrentPage() - 1%>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;</button>	
			
			<%}else if(cate !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getCurrentPage() - 1%>&cate=<%= cate %>'"> &lt;</button>		
			 <%}else if(challBoardType !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/type?challBoardType=<%= pi.getCurrentPage() - 1 %>&challBoardType=<%= challBoardType %>'"> &lt;</button>
			<% } else {%>
	        <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getCurrentPage() - 1%>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()) { %>
			<button style="background:lightgray;" disabled><%= p %></button>
			<% } else if(s != null){%>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%=p %>&searchCondition=<%= searchCondition %>&search=<%=search %>'"> <%= p %></button>	
			<%}else if(cate !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= p%>&cate=<%= cate %>'">  <%= p %></button>		
			<%} else if(challBoardType !=0) {%>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= p%>&challBoardType=<%= challBoardType %>'">  <%= p %></button>		
			<% } else {%>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%=p %>'"> <%= p %> </button>
			<% } %>
			<% } %>
            
            <!-- 다음으로(>) -->
			<% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
			<button disabled> &gt;</button>
			<% } else if (s != null){%>
			
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;</button>				
			<%}else if(cate !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getCurrentPage() + 1%>&cate=<%= cate %>'"> &gt;</button>		
			<% } else if (challBoardType !=0) {%>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= pi.getCurrentPage() + 1%>&challBoardType=<%= challBoardType %>'"> &gt;</button>		
			<% } else {%>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt;</button><% } %>
              
             <!-- 맨 끝으로 (>>) -->
			<% if(s != null) {%>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
			<%}else if(cate !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/member/cateinput?currentPage=<%= pi.getMaxPage()%>&cate=<%= cate %>'">  &gt;&gt;</button>		
			<% } else if(challBoardType !=0){ %>
			 <button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/type?currentPage=<%= pi.getMaxPage()%>&challBoardType=<%= challBoardType %>'">  &gt;&gt;</button>		
			<% } else { %>
			<button class="pagingBtn" onclick="location.href='<%= request.getContextPath() %>/chall/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			
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
                  <input id="searchBox" type="search" name="search" value="<%= search%>">
                  <% } else { %>
                  <input id="searchBox" type="search" name="search">
                  <% } %>
                  <button type="submit" id="searchBtn">검색하기</button>
               </form>
            </div>
            	
            	
        </section>


        <form method="POST">
            <section id="content-3">
                <% if(loginUser != null) { %>
                	<%if(loginUser.getWriter_active().equals("Y")){ %>
                	<button id="challenge_btn" type="button" onclick="location.href='<%= request.getContextPath() %>/views/challenge/challengeMake.jsp'">챌린지 개설</button>
                	<%}else{ %>
                	<button id="challenge_btn" type="button" onclick="alert('회원의 글쓰기 권한이 제한되었습니다.')">챌린지 개설</button>
               <% } %>
                <% } %>
            </section>
        </form>

    </section>
    
     <script>
       // 챌린지 상세보기 기능 (jQuery를 통해 작업)

    <%--   $(function(){
         $("#listTable td").mouseenter(function(){
            $(this).parent().css({"background":"white", "cursor":"pointer"});
         }).mouseout(function(){
            $(this).parent().css("backgroundColor", "#f9f1f1");
         }).click(function(){
            var num = $(this).parent().children().eq(0).text();
              // 쿼리 스트링을 이용하여 get방식으로 글 번호를 전달 
              location.href="<%= request.getContextPath() %>/chall/join?challNo="+num;
         });
      }); --%>
      
      $(function(){
			$(".chall_list").click(function(){
				var challNo = $(this).children().eq(0).val();
				location.href='<%= request.getContextPath() %>/chall/join?challNo='+challNo;
			});   			
 		});
       
    </script>
    
    <%@ include file="../common/footer.jsp" %>

</body>
</html>
