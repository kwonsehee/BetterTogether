<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, community.model.vo.*, common.model.vo.PageInfo"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	Search s = (Search)request.getAttribute("search");
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
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
	 body {
            width: 1000px;
            height : 1100px;
        }

         /* 세부 카테고리 버튼 */
         #btnwrap {
            width: 320px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            margin: auto;
        }

        .btn {
            width: 130px;
            height: 30px;
            margin:10px;  
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;       
        }

        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        #con1_title h1{
            /* position: absolute; */
            width: 1000px;  
            text-align: center;
            margin-top: 25px;          
        }

        .h1_title {
           margin-top: 50px;
           text-align: center;
           font-family: "Do Hyeon";
           font-size: 24px;
           color : #757575;
        }

        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        /* 게시판 */
        #board_tb {
            width: 100%;
            height: 400px;      
            border-collapse: collapse;
            
        }

        #board_tb th, #board_tb td {
            border-bottom: 1px solid #75757552;
            padding: 2px;
        }

        #tb_title {
            width:70%;
        }
        #tb_author {
            width:10%;
        }
        #tb_date {
            width:10%;
        }
        #tb_views {
            width: 5%;
        }
        #th_title {
            background : rgba(240, 240, 240, 0.7);
            height: 30px;
            font-family: "Do Hyeon";
            font-size: 14px;
            color : #757575;
        }
        
        /* 버튼 */
        .btnArea {
        	border:1px solid black;
        	margin-top:-10px;
        }
        #write {
            width:55px;
            color:white;
            font-family: "Do Hyeon";
            margin-top : 20px;
            margin-left : 80%;
        }
        #write a {
            font-size: 14px;
        }

        #mywrite {
            width:100px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e;        
        }
        #mywrite a {
            font-size: 14px;
            color: #ff60657e;
        }

        #board_tb td:hover {
            cursor : pointer;
        }
        
        /* 페이징바 영역 */
		.pagingArea {
			text-align:center;
		}
		.pagingArea button {
			width:25px;
			margin-top:20px;
			border : 0px;
			background:#fff;
			font-family: "Do Hyeon";
			color : #757575;
		}
		
		.pagingArea button:hover {
			cursor:pointer;
		}
        
        /* 검색하기 영역 */
		.searchArea {
			width : 100%;
			text-align:center;
			padding:20px;
		}
		
		#searchBtn {
			width:60px;
			height:30px;
            color: #ff60657e;
            font-family: "Do Hyeon";
            background : #fff;
            border:2px solid #ff60657e;
            border-radius:55px;
		}
		#searchBtn:hover {
			cursor:pointer;
		}
		
		#searchBox {
			width:300px;
			border:1px solid #ff60657e;
		}
		
		#searchCondition {
			width:70px;
			height:30px;
			border:1px solid #ff60657e;
			text-align:center;
		}
</style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	 <!-- content -->
    <section id="con1">
        <!-- 세부 카테고리 버튼 -->
        <div id="btnwrap">
            <button class="btn"><a href='<%= request.getContextPath()%>/board/main'>자유게시판</a></button>
            <button class="btn"><a href='<%= request.getContextPath()%>/review/main'>후기</a></button>
        </div>

        <!-- 타이틀 -->
        <div id="con2_title">
            <h1 class="h1_title">자유게시판</h1>
        </div>
        <div class="line"></div>
        
        <!-- 게시판 목록 -->
        <div id="board_div">
            <table id="board_tb">
                <tr id="th_title">
	                <th id="tb_bNo"> </th>	<!-- 글번호 -->
	                <th id="tb_title">제목</th>
	                <th id="tb_author">글쓴이</th>
	                <th id="tb_date">작성일</th>
	                <th id="tb_views">조회수</th>
                </tr>
                <% if(list.isEmpty()) { %>
                <tr>
                	<td colspan="5">조회 된 게시글이 없습니다.</td>
                </tr>
                <% } else { %>
                	<% for(Board b : list) { %>
                	<tr>
                		<td style=text-align:center;><%= b.getbId() %></td>
                		<td><%= b.getbTitle() %></td>
                		<td style=text-align:center;><%= b.getNickName() %></td>
                		<td style=text-align:center;><%= b.getCreateDate() %></td>
                		<td style=text-align:center;><%= b.getbCount() %></td>
                	</tr>
                	<% } %>
                <% } %>
              
            </table>
        </div>
        
		<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<% if(s == null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/board/main?currentPage=1'"> &lt;&lt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/board/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt;&lt; </button>
			<% } %>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%}else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/board/main?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/board/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/board/main?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button onclick="location.href='<%= request.getContextPath() %>/board/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
			<%} else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/board/main?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/board/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<% if(s == null){ %>
			<button onclick="location.href='<%= request.getContextPath() %>/board/main?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
			<% } else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/board/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
			<% } %>
		</div>
		<!-- 검색 -->
		<div class="searchArea">
			<form action="<%= request.getContextPath() %>/board/search" method="get">
				<select id="searchCondition" name="searchCondition">
					<option>----</option>
					<option value="writer" <%= selected[0] %>>작성자</option>
					<option value="title" <%= selected[1] %>>제목</option>
					<option value="content" <%= selected[2] %>>내용</option>
				</select>
				<input id="searchBox" type="search" name="search" value="<%= search %>">
				<button type="submit" id="searchBtn">검색하기</button>
				
			</form>
			
		</div>
		<%-- 로그인 유저만 글쓰기, 내가쓴글보기 버튼 보이기 --%>
		<% if(loginUser != null) { %>
			  <button class="btn" id="mywrite"><a href="myBoard.html">내가 쓴 글 보기</a></button>
			  <button class="btn" id="write"><a href='<%= request.getContextPath()%>/board/write'>글쓰기</a></button>
		<% } %>
				
    </section>
    
    <!-- 게시판 상세보기 -->
    <script>
		$(function(){
			$("#board_tb td").mouseenter(function(){
				$(this).parent().css("background","#f7dede");
			}).mouseout(function(){
				$(this).parent().css("background", "#fff");
			}).click(function(){
				var bId = $(this).parent().children().eq(0).text();
				console.log(bId);
				// 로그인 한 사람만 게시글 상세 페이지 접근 가능하도록
				<% if(loginUser != null) { %>
					location.href='<%= request.getContextPath() %>/board/detail?bId=' + bId;
				<% } else { %>
					alert('로그인 해야만 게시글 보기가 가능합니다.');
				<% } %>
			});
		})
	</script>
    
	
</body>
</html>