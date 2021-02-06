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
<title>Better Together</title>
<style>
qnaBoard, thead{
	background: white;
}
.Btn1 {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	float: right;
	margin-top: 5%;
	margin-bottom: 1%;
}

#con2_title h1 {
	text-align: center;
	font-family: "Nanum Gothic";
	color: #757575;
	font-size: 24px;
}

#btSection {
	padding-bottom: 40px;
}

#line {
	border: 0.5px solid #937cf790;
	width: 100%;
	margin: auto;
}

/* 게시판 */
#qnaBoard {
	width: 100%;
	/*  height: 400px;      */
	border-collapse: collapse;
}

#qnaBoard th, #qnaBoard td {
	border-bottom: 1px solid #75757552;
	padding: 2px;
	padding-left: 10px;
	text-align: center;
	color: #757575;
}

#tb_title {
	width: 45%;
}

#tb_writer {
	width: 10%;
}

#tb_date {
	width: 15%;
}

#tb_num {
	width: 5%;
	padding-left: 2%;
}

#tb_views{
	width: 10%;
}

#tb_type{
	width: 10%;
}

#th_title {
	background: white;
	/* background : rgba(240, 240, 240, 0.7);*/
	height: 30px;
	font-family: "Nanum Gothic";
	font-size: 14px;
	color: #757575;
}

#write {
	width: 55px;
	color: white;
	font-family: "Nanum Gothic";
	margin-top: 20px;
	margin-left: 80%;
}

#write a {
	font-size: 14px;
}

#mywrite {
	width: 100px;
	font-family: "Nanum Gothic";
	background: none;
	border: 2px solid #ff60657e;
}

#mywrite a {
	font-size: 14px;
	color: #ff60657e;
}

#qnaBoard td:hover {
	cursor: pointer;
}

#qnaBoard #title {
	text-align: center;
}

/* 페이징바 영역 */
#pagingArea {
	text-align: center;
	margin: auto;
	padding-top:2%;
    padding-bottom: 2%;
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

#board_div {
	width: 80%;
	margin: auto;
}

/* 검색하기 영역 */
#searchArea {
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
</style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	
	<section id="btSection" class="btSection">
	
        <div id="con2_title">
            <h1 class="h1_title">공 지 사 항</h1>
        </div>
        
         <div id="line"></div>
        
        <div id="board_div">
            <table id="qnaBoard">
             	<thead>
                    <tr>
                        <th id="tb_type">유형</th>
                        <th id="tb_num">번호</th>
                        <th id="tb_title">제목</th>
                        <th id="tb_writer">작성자</th>
                        <th id="tb_views">조회수</th>
                        <th id="tb_date">날짜</th>
                    </tr>
				</thead>
				<tbody>
                    <!-- 공지사항에 글이 존재하지 않을 수 도 있음
						list는 DAO에서 무조건 객체로 생성 되어 반환하므로 Null이 아님
						list가 비어있는지 아닌지로 판단
					 -->
					<% if(list.isEmpty()) { %>
					<tr>
						<td colspan="6">존재하는 공지사항이 없습니다.</td>
					</tr>
					<% } else { %>
						<% for (Notice n : list) { %>
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
				 </tbody>
            </table>
      		<div id="btnArea">
			
     

		<!-- 페이징 바 -->		
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
       	</div>

           <div id="searchArea">
           <form action="<%=request.getContextPath()%>/notice/search"method="get"
			onsubmit="return checkSearchCondition();">
				<select id="searchCondition"name="searchCondition">
					<option >----</option>
					<option value="writer" <%=selected[0] %>>작성자</option>
					<option value="title"<%=selected[1] %>>제목</option>
					<option value="content"<%=selected[2] %>>내용</option>
					</select>
				<%if(search !=null){ %>
				<input id="searchBox" type="search" name="search" value="<%= search %>">
				<%}else{ %>
				<input type="search" name="search">
				<%} %>
				<button type ="submit" id="searchBtn">검색하기</button>
			 </form>
				<!-- 2. 공지사항 글쓰기 기능 : 관리자만 사용하는 기능(로그인 유저가 관리자일 때만 보여줌) -->
				<%if(loginUser!=null&&loginUser.getMembertype()==0) {%>
				<button id="noticeInsert" type="button" class="Btn1">작성하기</button>
				<%} %>
				</div>
				<script>
					//공지사항 작성하기
					const noticeInsert = document.getElementById('noticeInsert');
					noticeInsert.addEventListener('click', function(){
					location.href='<%=request.getContextPath()%>/views/notice/noticeInsert.jsp';
					});
				</script>
			
       
		<script>
		//3. 공지사항 상세보기 기능(jQuery를 통해 작업)
		
			  $(function(){
			         $("#qnaBoard td").mouseenter(function(){
			            $(this).parent().css({"background":"#937cf790", "cursor":"pointer"});
			         }).mouseout(function(){
			            $(this).parent().css("background", "none");
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
		
            	</div>
    </section>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>