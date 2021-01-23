<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, community.model.vo.*, common.model.vo.PageInfo"%>
<%
	
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
</head>
<style>
body {
	width: 1000px;
	height: 1100px;
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
	margin: 10px;
	background: #ff60657e;
	border: 0px;
	border-radius: 55px;
}

.btn a {
	color: white;
	font-family: "Do Hyeon";
	font-size: 16px;
}

#con1_title h1 {
	position: absolute;
	width: 1000px;
	text-align: center;
	margin-top: 25px;
}

.h1_title {
	margin-top: 50px;
	text-align: center;
	font-family: "Do Hyeon";
	font-size: 24px;
	color: #757575;
}

.line {
	border: 3px solid rgba(255, 96, 100, 0.7);
}

/* 게시판 */
#board_tb {
	width: 100%;
	/* height: 400px; */
	border-collapse: collapse;
}

#board_tb tr {
	height: 30px;
}

#board_tb th, #board_tb td {
	border-bottom: 1px solid #75757552;
	padding: 2px;
}
#board_tb td{
	height : 30px;
}

#tb_no {
	width: 5%;
}

#tb_title {
	width: 60%;
}

#tb_date {
	width: 15%;
}

#tb_views {
	width: 5%;
}

#tb_updatebtn {
	width: 25%;
}

#th_title {
	background: rgba(240, 240, 240, 0.7);
	height: 30px;
	font-family: "Do Hyeon";
	font-size: 14px;
	color: #757575;
}

.btn2 {
	width: 50px;
	height: 20px;
	background: none;
	text-align: center;
	margin-left: 15px;
	border: 2px solid #ff60657e;
	border-radius: 55px;
	font-family: "Do Hyeon";
	color: #757575;
}

.btn2 a {
	color: #757575;
	font-size: 12px;
}

/* 하단 버튼 */
#write {
	width: 55px;
	color: white;
	font-family: "Do Hyeon";
	margin-top: 20px;
	margin-left: 80%;
}

#write a {
	font-size: 14px;
}

#back {
	width: 100px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}

/* 페이징바 영역 */
.pagingArea {
	text-align: center;
}

.pagingArea button {
	width: 25px;
	margin-top: 20px;
	border: 0px;
	background: #fff;
	font-family: "Do Hyeon";
	color: #757575;
}

.pagingArea button:hover {
	cursor: pointer;
}
</style>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	<!-- content -->
	<section id="con1">
		<!-- 세부 카테고리 버튼 -->
		<div id="btnwrap">
			<button class="btn">
				<a href='<%= request.getContextPath()%>/board/main'>자유게시판</a>
			</button>
			<button class="btn">
				<a href='<%= request.getContextPath()%>/review/main'>후기</a>
			</button>
		</div>

		<!-- 타이틀 -->
		<div id="con2_title">
			<h1 class="h1_title">내가 쓴 글</h1>
		</div>
		<div class="line"></div>

		<!-- 내가 쓴 글 목록 -->
		<div id="board_div">
			<table id="board_tb">
				<tr id="th_title">
					<th id="tb_no"></th>
					<th id="tb_title">제목</th>
					<th id="tb_date">작성일</th>
					<th id="tb_views">조회수</th>
					<th id="tb_updatebtn"></th>
				</tr>
				 <% if(list.isEmpty()) { %>
                <tr>
                	<td colspan="5">조회 된 게시글이 없습니다.</td>
                </tr>
                <% } else { %>
					
	                	<% for(Board bd : list) { %>
	                		<tr>
	                		<td style=text-align:center;><%= bd.getbId() %></td>
	                		<td><%= bd.getbTitle() %></td>
	                		<td style=text-align:center;><%= bd.getCreateDate() %></td>
	                		<td style=text-align:center><%= bd.getbCount() %></td>
	                		<td>
	                		<button class="btn2" id="updateBtn" >수정</button>
							<button class="btn2" id="deleteBtn">삭제</button>
							</td>
	                		</tr>
	                	<% } %>
                <% } %>
			</table>
		</div>
		
		 <script>
			$(function(){
				$("#board_tb #updateBtn").mouseenter(function(){
					$(this).parent().parent().css("background","#f7dede");
				}).mouseout(function(){
					$(this).parent().parent().css("background", "#fff");
				}).click(function(){
					var bId = $(this).parent().parent().children().eq(0).text();
					console.log(bId);
					// 로그인 한 사람만 내가 쓴 글 수정 가능하도록
					<% if(loginUser != null) { %>
						location.href='<%= request.getContextPath() %>/board/updateForm?bId=' + bId;
					<% } else { %>
						alert('로그인 해야만 게시글 보기가 가능합니다.');
					<% } %>
				});
			})
			$(function(){
				$("#board_tb #deleteBtn").mouseenter(function(){
					$(this).parent().parent().css("background","#f7dede");
				}).mouseout(function(){
					$(this).parent().parent().css("background", "#fff");
				}).click(function(){
					var bId = $(this).parent().parent().children().eq(0).text();
					console.log(bId);
					// 로그인 한 사람만 내가 쓴 글 삭제 가능하도록
					<% if(loginUser != null) { %>
						location.href='<%= request.getContextPath() %>/board/delete?bId=' + bId;
					<% } else { %>
						alert('로그인 해야만 게시글 보기가 가능합니다.');
					<% } %>
				});
			})
		</script>
			

		
		<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/myboardView?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/board/myboardView?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} %>	
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" disabled> <%= p %> </button>
				<%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/board/myboardView?currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
			<%} else {%>
				<button onclick="location.href='<%= request.getContextPath() %>/board/myboardView?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/board/myboardView?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		

		<!-- 버튼 -->
		<button class="btn" id="back">
			<a href='<%= request.getContextPath()%>/board/main'>뒤로가기</a>
		</button>
		<button class="btn" id="write">
			<a href='<%= request.getContextPath()%>/views/community/boardWrite.jsp'>글쓰기</a>
		</button>
	</section>
</body>
</html>