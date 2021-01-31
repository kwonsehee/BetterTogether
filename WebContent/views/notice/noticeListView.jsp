<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice, common.model.vo.Search, common.model.vo.PageInfo"%>
<%
	ArrayList<Notice> list= (ArrayList<Notice>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	Search s = (Search)request.getAttribute("search");
	String search = "";
	String searchCondition = "";
	String[] selected = new String[3];
	if (s != null) {
		search = s.getSearch();
		searchCondition = s.getSearchCondition();
		if (searchCondition.equals("writer")) {
			selected[0] = "selected";
		} else if (searchCondition.equals("title")) {
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
<title>공지사항</title>
 <style>
        
        #title{
            width: 100%;
        }
        #title h1 {
            font-size: 30px;
            font-family: "Do Hyeon";
            text-align: center;
            padding-top: 10px;
        }
        .article_table {
            font-family: "Do Hyeon";
            font-size: medium;
            margin-top: 20px;
            margin-left:40px;
            width: 90%;
            border-top: 2px solid #ff6064;
            border-collapse: collapse;
        }

        .article_table th,.article_table td {
            border-bottom: 1px solid #444444;
            padding: 10px;
            text-align: center;
        }


        .sr-only,
        .page-link {
            color: black;
            padding-left: 10px;
            font-family: "Do Hyeon";
            height: 40px;
            background-color: #fdc8c6;
        }
        .article_btn {
            font-family: "Do Hyeon";
            font-size : 20px;
            width: 130px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
       
        }
        /*페이징 css*/
  		#page_css {
            width: 100%;
            height: 15%;
            float: left;
            padding-top: 50px; 
        }
	    #pagingArea {
	  	text-align:center;
  	   }
      #pagingArea button {
            font-family: "Do Hyeon";
            font-size : 18px;
            color: black;
            text-decoration: none;

            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
        }
        
        
        /*검색하기 부분*/
  		#notice_area{
  			padding-top:0px;
  			padding-left:25%;
  			float : left;
  		}
  		

    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	<section id="content" class="content_css">
        <div id="title">
            <h1>공 지 사 항</h1>
        </div>
        <section id="content-1">
            <table id="listTable" class="article_table">
                    <tr>
                        <th>유형</th>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>날짜</th>
                    </tr>

                    <!-- 공지사항에 글이 존재하지 않을 수 도 있음
						list는 DAO에서 무조건 객체로 생성 되어 반환하므로 Null이 아님
						list가 비어있는지 아닌지로 판단
					 -->
					<%if(list.isEmpty()){ %>
					<tr>
						<td colspan="6">존재하는 공지사항이 없습니다.</td>
					</tr>
					<%} else{ %>
						<% for(Notice n:list){ %>
						<tr>
							<td>
							<!-- 필독이면 빨간 글씨 필독이라고 작성 -->
							<%if(n.getaType()==2){ %>
							<span style="color:red;">필독</span>
							<!-- 필독이 아니면 검정 일반이라고 작성 -->
							<%}else{ %>
							<span>일반</span>
							<%} %>
							</td>
							<td><%= n.getaNo() %></td>
							<td><%= n.getaTitle() %></td>
							<td><%= n.getUser_id()%></td>
							<td><%= n.getaCnt() %></td>
							<td><%= n.getaDate() %></td>
						</tr>
						<%} %>	
					<%} %>
            </table>
        </section>

     
<!-- 페이징 바 -->		
	 <section id="page_css">
		<div id="pagingArea">
		<% if(s ==null){ %>
		<!-- 처음으로(<<) 이전페이지로(<) 페이지 목록 다음 페이지로(>) 맨끝으로(>>) -->
		<!-- 처음으로(<<) -->
		<button onclick= "location.href='<%=request.getContextPath() %>/notice/list?currentPage=1'">&lt;&lt;</button>
		<%}else{ %>
		<button onclick= "location.href='<%=request.getContextPath() %>/notice/search?currentPage=1&searchCondition=<%=searchCondition%>&search=<%=search%>'">&lt;&lt;</button>
		<%} %>
		<!-- 이전으로(<) -->
         <% if(pi.getCurrentPage() == 1) { %>
         <button disabled > &lt; </button>
         <% } else if(s == null) { %>
         <button onclick="location.href='<%= request.getContextPath() %>/notice/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
         <% } else { %>
         <button onclick="location.href='<%= request.getContextPath() %>/notice/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%=search %>'"> &lt; </button>
         <% } %>

		
		<!-- 10개의 페이지 목록 -->
		<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) {%>
			<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;"disabled><%=p %></button>
			<%}else if(s==null){ %>
				<button onclick="location.href='<%=request.getContextPath()%>/notice/list?currentPage=<%=p%>'"><%=p %></button>
			<%} else{%>
				<button onclick="location.href='<%=request.getContextPath()%>/notice/search?currentPage=<%=p%>&searchCondition=<%=searchCondition%>&search=<%=search%>'"><%=p %></button>
			<%} %>
		<%} %>
		<!-- 다음으로(>) -->
		<%if(pi.getCurrentPage() ==pi.getMaxPage()) {%>
		<button disabled>&gt;</button>
		<%}else if(s==null){ %>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/list?currentPage=<%=pi.getCurrentPage()+1 %>'">&gt;</button>
		<%} else{ %>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/search?currentPage=<%=pi.getCurrentPage()+1 %>&searchCondition=<%= searchCondition %>&search=<%=search %>'">&gt;</button>
		<%} %>
		<!-- 맨 끝으로(>>) -->
		<% if(s==null){ %>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/list?currentPage=<%=pi.getMaxPage() %>'">&gt;&gt;</button>
		<%}else{ %>
		<button onclick="location.href='<%=request.getContextPath() %>/notice/search?currentPage=<%=pi.getMaxPage() %>&searchCondition=<%=searchCondition%>&search=<%=search%>'">&gt;&gt;</button>
		<%} %>
		</div>
        </section>

            <section id="notice_area">
           <form action="<%=request.getContextPath()%>/notice/search"method="get"
			onsubmit="return checkSearchCondition();">
				<select id="searchCondition"name="searchCondition">
					<option >----</option>
					<option value="writer" <%=selected[0] %>>작성자</option>
					<option value="title"<%=selected[1] %>>제목</option>
					<option value="content"<%=selected[2] %>>내용</option>
					</select>
				<%if(search !=null){ %>
				<input type="search" name="search" value="<%= search %>">
				<%}else{ %>
				<input type="search" name="search">
				<%} %>
				<button type ="submit" class="article_btn">검색하기</button>
				<!-- 2. 공지사항 글쓰기 기능 : 관리자만 사용하는 기능(로그인 유저가 관리자일 때만 보여줌) -->
				<%if(loginUser!=null&&loginUser.getMembertype()==0) {%>
				<button id="noticeInsert" type="button"class="article_btn">작성하기</button>
				<script>
					//공지사항 작성하기
					const noticeInsert = document.getElementById('noticeInsert');
					noticeInsert.addEventListener('click', function(){
					location.href='<%=request.getContextPath()%>/views/notice/noticeInsert.jsp';
					});
				</script>

				<%} %>
			 </form>
            </section>
       
		<script>
		//3. 공지사항 상세보기 기능(jQuery를 통해 작업)
		
			  $(function(){
			         $("#listTable td").mouseenter(function(){
			            $(this).parent().css({"background":"#f7dede", "cursor":"pointer"});
			         }).mouseout(function(){
			            $(this).parent().css("background", "#f9f1f1");
			         }).click(function(){
			        	 
			          <% if(list.isEmpty()) { %>
						$("#listTable td").off(click);
					  <% } %>
					  
			            var num = $(this).parent().children().eq(1).text();
			          //쿼리 스트링을 이용하여 get방식으로 글 번호를 전달
						
			            location.href="<%= request.getContextPath() %>/notice/detail?aNo=" +num;
			         });
			      });
			// 검색 부분
		      function checkSearchCondition(){
		         if($("#searchCondition option:selected").val() == '----'){
		            return false;
		         }
		         return true;
		      }
		</script>
		
    </section>
</body>
</html>