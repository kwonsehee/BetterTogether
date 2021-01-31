<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="community.model.vo.*, java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
	ArrayList<Review> rList = (ArrayList<Review>) request.getAttribute("rList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
body {
	width: 1000px;
	height: 1100px;
}

#con1 {
	width: 1000px;
	background: #F9F1F1;
	border-radius: 20px;
	margin: auto;
	margin-top: 15px;
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
	position: absolute;
	width: 994px;
	top: 420px;
}

/* 후기 목록 */
.reviewWrap {margin-top:100px;}

.reviewdiv{
	width: 90%;
	height: 100px;
	background: #fff;
	margin: auto;
	margin-top:35px;
}

#reviewTb {
	width: 100%;
	height: 100px;
}
 #reviewTb tr:nth-child(1) {height:20%; margin-top:5px;}

#nickname, #starArea, #createDate, #challName {
	display: inline-block;
	margin-left: 10px;
}

#starArea {
	margin-left: 10px;
	color: rgba(255, 96, 100, 0.7);
}

#createDate {
	 margin-left: 550px; 
}

#contentArea {
	margin-left: 10px;
	margin-top: 3px;
	margin-right: 10px;
}

/* 페이징 바 */
#pagenum {
	width: 200px;
	height: 30px;
	margin: auto;
	margin-top: 20px;
	text-align: center;
}

#pagenum a {
	font-family: "Do Hyeon";
	font-size: 18px;
	padding: 5px;
	color: #757575;
}

.pagingArea {
	text-align: center;
}

.pagingArea button {
	width: 25px;
	margin-top: 20px;
	border: 0px;
	background:#fff;
	font-family: "Do Hyeon";
	color: #757575;
}

.pagingArea button:hover {
	cursor: pointer;
}

.btnwrap {
	width: 120px;
	height: 20px;
	margin-left: 84.5%;
	margin-top: 5px;
}

.btn2 {
	width: 50px;
	height:20px;
	background: none;
	text-align: center;
	border: 2px solid #ff60657e;
	border-radius: 55px;
	font-family: "Do Hyeon";
	font-size: 12px;
	
}

.btn2 a {
	color: #757575;
	font-size: 12px;
}

#back {
	width: 100px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
	margin-left: 85%;
	margin-top: 150px;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<!-- 후기 -->
	<section id="con1">
		<!-- 세부 카테고리 버튼 -->
		<div id="btnwrap">
			<button class="btn">
				<a href="boardmain.html">자유게시판</a>
			</button>
			<button class="btn">
				<a href="reviewmain.html">후기</a>
			</button>
		</div>

		<!-- 타이틀 -->
		<div id="con1_title">
			<h1 class="h1_title">내가 쓴 후기</h1>
		</div>

		<div class="line"></div>

		
		<div class="reviewWrap">
		<% if(rList != null) { %>
		<% for(Review r : rList)  {%>
		
		<div class="reviewdiv">
			<table id="reviewTb">
				<tr>
					<input type="hidden" id="rId" name="rId" value="<%=r.getrId()%>">
					<td id="nickname"><%= r.getNickName() %></td>
					<td id="challName"><%= r.getChallTitle() %></td>
					<td id="starArea"><%if(r.getrGrade() == 5) { %> ★★★★★ 
									  <% } else if(r.getrGrade() == 4) { %>★★★★
									  <% } else if(r.getrGrade() == 3) { %>★★★
									  <% } else if(r.getrGrade() == 2) { %>★★
									  <% } else { %>★<% } %>
					</td>
					<td id="createDate"><%= r.getCreateDate() %></td>
				</tr>
				<tr>
					<td id="contentArea"><%= r.getrContent() %></td>
				</tr>
			</table>
			
				<button class="btn2" id="updateBtn" onclick="window.open('<%= request.getContextPath() %>/review/updateForm?rId=<%=r.getrId()%>', '댓글 수정 창', 'width=1000, height=300')">수정</button>
		
				<button class="btn2" onclick="location.href='<%= request.getContextPath() %>/review/delete?rId=<%=r.getrId()%>'">
				삭제
				</button>
		</div>
		
		<% } %>
		<% } %>
		
		</div>
		
		
		<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review/myReview?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/review/myReview?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} %>	
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" disabled> <%= p %> </button>
				<%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/review/myReview?currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
			<%} else {%>
				<button onclick="location.href='<%= request.getContextPath() %>/review/myReview?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review/myReview?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		
		<!-- 뒤로가기 버튼 -->
		<button class="btn" type="button" onclick="javascript:history.back();" id="back">뒤로가기</button>
	</section>

</body>
</html>