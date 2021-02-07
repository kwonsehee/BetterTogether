<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, qna.model.vo.QnA, common.model.vo.Search, common.model.vo.PageInfo"%>
<%
	ArrayList<QnA> list = (ArrayList<QnA>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	Search s = (Search) request.getAttribute("search");
	String search = "";
	if (s != null) {
		search = s.getSearch();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
#btSection {
	padding-bottom: 50px;
}

#con1_title h1 {
	text-align: center;
	margin-top: 25px;
}

.h1_title {
	margin-top: 50px;
	text-align: center;
	font-size: 24px;
	color: #757575;
}

.line {
	width:100%;
	border: 0.5px solid #937cf790;
}

#none {
	display: none;
}
/* 자주묻는질문 */
.recruit {
	width: 100%;
	border: none;
}

.recruit td {
	padding-left: 10px;
	border-top: 2px solid #937cf790;
	border-bottom: none;
	border-left: none;
}

.hide {
	display: none;
}

.show {
	display: table-row;
	height: 100px;
	font-size: 20px;
	background-color: #9e9e9e5b;
	font-family: "Nanum Gothic";
}

.question td {
	cursor: pointer;
	height: 80px;
	font-size: 20px;
	background-color: white;
	font-family: "Nanum Gothic";
	padding-right: 5%;
}

/* 검색창 */
#search-area {
	width: 80%;
	height: 100px;
	position: relative;
	padding-top: 5%;
	padding-left: 3.5%;
	padding-bottom: 5%;
	margin: auto;
}

#search-form {
	height: 40%;
	padding-top: 6%;
	padding-right: 2%;
	position: absolute;
	top: 0;
	bottom: -50px;
	left: 50%;
	right: 0;
}

#searchArea {
	width: 80%;
	float: left;
}

#search-input{
	width: 98%;
	height: 98%;
	border:1px solid rgba(219, 219, 219, 0.356);
	padding-left:20px;
	margin-left:25px;
}


/* 버튼 css */
.btn1 {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	text-decoration: none;
	margin-left:-30px;
}

td .btn1 {
	float: right;
}

#content1 {
	width: 80%;
	height: 25%;
	margin:auto;
}

#content-2 {
	width: 80%;
	height: 70%;
	padding-bottom: 40px;
    margin: auto;
}	
}

.content {
	width: 100%;
	height: auto;
	margin-top: 5px;
	border-radius: 20px;
	border: solid 1px #f9f1f1;
	background-color: #f9f1f1;
	float: left;
}

/* 페이징바 영역 */
.pagingArea {
	text-align: center;
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

#search-btn{
	margin-left:25px;
}


</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="btSection" class="btSection">
		<div id="con2_title">
			<h1 class="h1_title">자주 묻는 질문</h1>
		</div>

		<div class="line"></div>
		
		<section id="content1">
		
			<!-- 작성 수정 삭제 버튼 -->
			<div id="search-area">
				<div id="btnArea">
					<% if (loginUser != null && loginUser.getMembertype() == 0) { %>
					<button class="btn1" type="button"
						onclick="location.href='<%=request.getContextPath()%>/views/faq/faqInsertForm.jsp'">FAQ작성</button>
					<% } %>
				</div>

				<!-- 검색창 -->
				<form action="<%=request.getContextPath()%>/faq/search" method="get"
					id="search-form">
					<div id="searchArea">
						<input type="search" id="search-input" name="search"
							value="<%=search%>">
					</div>
					<div id="search-btn-area">
						<button type="submit" class="btn1" id="search-btn">검색</button>
					</div>
				</form>
			</div>


		<!-- 아코디언 -->
		<section id="content-2">
			<table cellspacing="0" border="1" class="recruit" id="faqBoard">
				<tbody>
					<% if (list.isEmpty()) { %>
					<tr>
						<td colspan="6">존재하는 FAQ가 없습니다.</td>
					</tr>
					<% } else { %>
					<% for (QnA f : list) { %>
					<% if (f.getQnaType().equals("F")) { %>
					<tr class="question">
						<td id="none"><%=f.getQnaNo()%></td>
						<td>Q . <%=f.getQnaTitle()%> 
						<% if (loginUser.getMembertype() == 0) { %>
							<button type="button" class="btn1" id="updateBtn"
								onclick="location.href='<%=request.getContextPath()%>/faq/updateForm?qnaNo=<%=f.getQnaNo()%>'">관리</button>
							<% } %>
						</td>
					</tr>
					<tr class="hide">
						<td>A . <%=f.getQnaContent()%></td>
					</tr>
					<% } %>
					<% } %>
					<% } %>
				</tbody>
			</table>
		</section>

		<script> 
            $(function(){
                var article = (".recruit .show"); 
                $(".recruit .question  td").click(function() { 
                    var myArticle =$(this).parents().next("tr"); 
                    if($(myArticle).hasClass('hide')) { 
                        $(article).removeClass('show').addClass('hide'); 
                        $(myArticle).removeClass('hide').addClass('show'); 
                    } 
                    else { 
                        $(myArticle).addClass('hide').removeClass('show'); 
                    } 
                }); 
            });
    	</script>
    	
		</section>
		
		<script>
		// 수정 삭제 기능
		$(function(){
			$("#faqBoard td").parent().children().eq(0).text().(function())
				
				location.href='<%=request.getContextPath()%>/faq/delete';
		
				});
			});
		</script>
		
		<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<%if (s == null) {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=1'">
				&lt;&lt;</button>
			<%} else {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/search?currentPage=1&search=<%=search%>'">
				&lt;&lt;</button>
			<%}%>

			<!-- 이전 페이지로 (<) -->
			<%if (pi.getCurrentPage() == 1) {%>
			<button disabled>&lt;</button>
			<%} else if (s == null) {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=<%=pi.getCurrentPage() - 1%>'">
				&lt;</button>
			<%} else {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/search?currentPage=<%=pi.getCurrentPage() - 1%>&search=<%=search%>'">
				&lt;</button>
			<%}%>

			<!-- 10개의 페이지 목록 -->
			<%for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) {%>
			<%if (p == pi.getCurrentPage()) {%>
			<button style="background: lightgray;" disabled>
				<%=p%>
			</button>
			<%} else if (s == null) {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=<%=p%>'">
				<%=p%>
			</button>
			<%} else {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/search?currentPage=<%=p%>&search=<%=search%>'"><%=p%></button>
			<%}%>
			<%}%>

			<!-- 다음 페이지로(>) -->
			<%if (pi.getCurrentPage() == pi.getMaxPage()) {%>
			<button disabled>&gt;</button>
			<%} else if (s == null) {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=<%=pi.getCurrentPage() + 1%>'">
				&gt;</button>
			<%} else {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/search?currentPage=<%=pi.getCurrentPage() + 1%>&search=<%=search%>'">
				&gt;</button>
			<%}%>

			<!-- 맨 끝으로(>>) -->
			<%if (s == null) {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=<%=pi.getMaxPage()%>'">
				&gt;&gt;</button>
			<%} else {%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/faq/list?currentPage=<%=pi.getMaxPage()%>&search=<%=search%>'">
				&gt;&gt;</button>
			<%}%>
		</div>



		

	</section>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>