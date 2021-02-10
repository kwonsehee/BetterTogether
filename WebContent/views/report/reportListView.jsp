<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, report.model.vo.Report, common.model.vo.PageInfo"%>
<%
	ArrayList<Report> reList = (ArrayList<Report>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	System.out.println("jsp list : "+reList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>

.btn1 {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	margin-top: 5%;
	margin-bottom: 1%;
}

#btn1 {
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

#btnArea {
	
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
	margin-top: 30px;
}

#qnaBoard th, #qnaBoard td {
	border-bottom: 1px solid #75757552;
	padding: 2px;
	padding-left: 10px;
	text-align: center;
	color: #757575;
}

#tb_title {
	width: 60%;
}

#tb_author {
	width: 20%;
}

#tb_date {
	width: 10%;
}

#tb_num {
	width: 5%;
	padding-left: 2%;
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
.pagingArea {
	text-align: center;
	padding-left: 6%;
	margin: auto;
}

.pagingArea button {
	width: 25px;
	margin-top: 20px;
	border: 0px;
	color: #757575;
	font-family: "Nanum Gothic";
	font-size: 12px;
}

.pagingArea button:hover {
	cursor: pointer;
}

#board_div {
	width: 80%;
	margin: auto;
}

#btSection {
	padding-bottom: 100px;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	 <section id="btSection" class="btSection">
	 
	 <!-- title -->
        <div id="con2_title">
            <h1 class="h1_title">신 고</h1>
        </div>
        
        <div id="line"></div>
        
        <div id="board_div">
            <table id="qnaBoard">
                <thead>
                    <tr id="th_title">
                        <th id="tb_num">번호</th>
                        <th id="tb_title">제목</th>
                        <th id="tb_author">신고 날짜</th>
                        <th id="tb_date">처리여부</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    	if (reList.isEmpty()) {
                    %>
					<tr>
						<td colspan="6">존재하는 질문이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
						<%
							for (Report r : reList) {
						%>
						<%
							if (r.getReport_Status().equals("N")) {
						%>
						<tr>
							<td><%= r.getReport_no() %></td>
							<td><%= r.getReport_title() %></td>
							<td><%= r.getReport_date() %></td>
							<%if(r.getT_f().equals("F")) {%>
							<td><%= r.getT_f().replace("F", "X") %></td>
							<% } else { %>
							<td><%= r.getT_f().replace("T", "O") %></td>
							<% } %>
						</tr>
							<%} %>
						<%} %>	
					<%} %>
                </tbody>
            </table>
            
            <div id="btnArea">
            	<%-- 로그인 유저만 글쓰기, 내가쓴글보기 버튼 보이기 --%>
				<% if(loginUser != null) { %>
			  		<button class="btn1" id="writenReport"><a href='<%= request.getContextPath()%>/report/mylist'>내가 작성한 신고 보기</a></button>
				<% } %>
    		</div>

            <!-- 페이징 바 -->
			<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<% } %>
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
				<button style="background:lightgray;" disabled> <%= p %> </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= p %>'"> <%= p %> </button>				
				<% } %>
			<%} %>
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/report/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		
        </div>
        
	</section>
	
	<script>
		// 게시판 상세보기 기능
		$(function(){
			$("#qnaBoard td").mouseenter(function(){
				$(this).parent().css({"background":"#937cf755", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background", "none");
			}).click(function(){
				var rNo = $(this).parent().children().eq(0).text();
				
				<% if(reList.isEmpty()) { %>
					$("#qnaBoard td").off(click);
				<% } %>
				
				// 로그인 한 사람만 게시글 상세 페이지 접근 가능하도록
				<% if(loginUser != null) { %>
					location.href='<%= request.getContextPath() %>/report/detail?rNo=' + rNo;
				<% } else { %>
					alert('로그인 해야만 게시글 보기가 가능합니다.');
				<% } %>
			});
		});
	</script>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>