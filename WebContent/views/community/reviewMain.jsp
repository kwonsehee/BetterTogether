<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="community.model.vo.*, java.util.ArrayList, challenge.model.vo.Challenge, common.model.vo.*"%>
<%
	ArrayList<Review> rList = (ArrayList<Review>) request.getAttribute("rList");
	ArrayList<Challenge> cList = (ArrayList<Challenge>)request.getAttribute("cList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 연분홍 배경 */
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
	top: 400px;
}

/* 후기 목록 */
.reviewWrap {margin-top:100px;}

.reviewdiv{
	width: 90%;
	height: 100px;
	background: #fff;
	margin: auto;
	margin-top:15px;
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

/* 후기 쓰기 */
.h2_title {
	margin-left: 48px;
	color: #757575;
	font-family: "Do Hyeon";
	float: left;
	margin-right: 10px;
	margin-top: 35px;
}

#reviewwrite {
	margin: auto;
	width: 900px;
	height: 70px;
}

#reviewWriteArea {
	width: 900px;
	height: 70px;
	resize: none;
	background: none;
	border: 1px solid #75757552;
}

/* 버튼 */
.btn a {
	color: white;
	font-family: "Do Hyeon";
	font-size: 16px;
}

#submit {
	width: 55px;
	color: white;
	font-family: "Do Hyeon";
	margin-top: 40px;
	margin-left: 72%;
}

#submit a {
	font-size: 14px;
}

#myReview {
	width: 120px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
	margin-left: 44px;
}

#myReview a {
	font-size: 14px;
	color: #ff60657e;
}

/* 별점 */
#star a {
	text-decoration: none;
	color: rgb(172, 172, 172);
	font-size: 25px;
	margin-top: 3px;
}

#star a.on {
	color: #ff6064;
}

#challSelect {
	width: 200px;
	height: 30px;
	border: 1px solid #ff60657e;
	text-align: center;
}

#challSelectArea, #starArea {
	display: inline-block;
}

/* 페이징바 영역 */
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

</style>

</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<!-- 후기 -->
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
		<div id="con1_title">
			<h1 class="h1_title">후기</h1>
		</div>

		<div class="line"></div>

		<!-- 후기 목록 -->
		<div class="reviewWrap">
		<% if(rList != null) { %>
		<% for(Review r : rList) { %>
		<div class="reviewdiv">
			<table id="reviewTb">
				<tr>
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
		</div>
		<% } %>
		<% } %>
		</div>
	
		<!-- 페이징 바 -->
		<div class="pagingArea">
			<!-- 맨 처음으로 (<<) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review/main?currentPage=1'"> &lt;&lt; </button>
			
			<!-- 이전 페이지로 (<) -->
			<% if(pi.getCurrentPage() == 1){ %>
				<button disabled> &lt; </button>
			<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/review/main?currentPage=<%= pi.getCurrentPage() - 1 %>'"> &lt; </button>
			<%} %>	
			
			<!-- 10개의 페이지 목록 -->
			<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" disabled> <%= p %> </button>
				<%}else{ %>
					<button onclick="location.href='<%= request.getContextPath() %>/review/main?currentPage=<%= p %>'"> <%= p %> </button>
				<% } %>
			<%} %>
			
			<!-- 다음 페이지로(>) -->
			<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
			<%} else {%>
				<button onclick="location.href='<%= request.getContextPath() %>/review/main?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
			<% } %>
			
			<!-- 맨 끝으로(>>) -->
			<button onclick="location.href='<%= request.getContextPath() %>/review/main?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
		</div>
		
		
		<!-- 후기 쓰기 -->
		
		<h2 class="h2_title">후기 쓰기</h2>
		<div id="challSelectArea">
			<select id="challSelect">
			<% if(cList != null) { %>
				<% for(Challenge c : cList) {%>
				<option value=<%= c.getChallNo() %>><%= c.getChallTitle() %></option>
				<% } %>
			<% } %>
			</select>
		</div>
		<div id="starArea">
		<p id="star">
			<a href="#" value=1>★</a> 
			<a href="#" value=2>★</a> 
			<a href="#" value=3>★</a> 
			<a href="#" value=4>★</a>
			<a href="#" value=5>★</a>
		<p>
		</div>
			
		<div id="reviewwrite">
			<textarea id="reviewWriteArea"></textarea>
		</div>

	
		<button class="btn" id="myReview">
			<a>내가 쓴 후기 보기</a>
		</button>
		<button class="btn" id="submit">
			<a>등록</a>
		</button>
		
		<script>
		// [내가 쓴 글 보기] 버튼 이벤트
		$(function(){
			$("#myReview").click(function(){
				<%if(loginUser != null) {%>
				location.href='<%=request.getContextPath()%>/review/myReview';
				<% } else {%>
				alert('로그인을 해주세요.');
				<% } %>
			})
		})
		</script>
		
		<script>
    	 // 별 색 채워짐 이벤트
        $('#star a').click(function(){ 
            $(this).parent().children("a").removeClass("on"); 
            $(this).addClass("on").prevAll("a").addClass("on"); 
            console.log($(this).attr("value")); 
            star = $(this).attr("value");
        });
 		</script>
 		
 		<script>
    	// [등록] 버튼 클릭 이벤트
        $(function(){
        	$("#submit").click(function(){
        		<%if(loginUser != null) {%>
        		var content = $("#reviewWriteArea").val();
        		var challNo = $("#challSelect").val();
        	 $.ajax({
        			url : "<%= request.getContextPath() %>/review/insert",
        			type : "post",
        			dataType : "json",
        			data : {content : content, challNo : challNo, star : star},
        			success : function(data){
        				window.opener.document.location.reload();
        				// 갱신 된 rList를 후기 div에 적용
        				reviewTable = $("#reviewTb");
        				reviewTable.html("");	// 기존 테이블 정보 초기화
        				
        				// 새로 받아온 갱신된 댓글 리스트들을 for문을 통해 다시 table에 추가
        				for(var key in data){
        					console.log(key);
        					console.log(data[key].createDate);
        					
        					var tr = $("<tr>");
        					var writerTd = $("<td>").text(data[key].nickName);
        					var challTitleTd = $("<td>").text(data[key].challTitle);
        					var gradeTd = $("<td>").text(data[key].rGrade);
        					var createDateTd = $("<td>").text(data[key].createDate);
        					var contentTd = $("<td>").text(data[key].rContent);
        					
        					tr.append(writerTd, challTitleTd, gradeTd, creatdDateTd, contentTd);
        					
        					reviewTable.append(tr);
        					
        					// 댓글 작성 textarea 부분 리셋
        					$("#reviewWriteArea").val("");
        					
        				}
        			},
        			error : function(e){
        				console.log(e);
        			}
        		});
        		
        		<% } else { %>
        		alert('로그인을 해주세요.');
        		<% } %>
        	}) 
        });
        </script>





	</section>
	<footer></footer>
	
</body>
</html>