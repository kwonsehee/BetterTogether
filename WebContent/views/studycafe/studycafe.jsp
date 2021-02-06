<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , studycafe.model.vo.*, common.model.vo.*" %>
    
 <% 
 
 			ArrayList<Cafe> list2 =(ArrayList<Cafe>)request.getAttribute("list2"); // 제후카페 검색용 list 
 
 	       PageInfo pi = (PageInfo)request.getAttribute("pi");
	
 			
 			
 		 	//PageInfo pi2 = (PageInfo)request.getAttribute("pi2"); // 임시 삭제 왜만들었는지 까먹음
 		 	
 		 	 
 		 	Search s = (Search)request.getAttribute("search");
 			String search = "";
 			String searchCondition = "";
 			String[] selected = new String[2];
 			if (s != null) {
 				search = s.getSearch();
 				searchCondition = s.getSearchCondition();
 				if (searchCondition.equals("area")) {
 					selected[0] = "selected";
 				} else if (searchCondition.equals("title")) {
 					selected[1] = "selected";
 				} else {
 				}
 			}
 
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btSection {
	padding-bottom: 100px;
}

/* 바깥 영역 */
.outer {
	width: 100%;
	min-width: 850px;
	font-family: "Nanum Gothic";
	background-color: rgba(219, 219, 219, 0.356);
	margin: auto;
	margin-top: 20px;
	margin-bottom: 70px;
	border-radius: 20px;
	padding-bottom: 100px;
}

.galleryArea {
	padding: 5px;
	width: 980px;
	min-height: 400px;
	margin: auto;
}

#line1 {
	border: 0.5px solid #937cf790;
}

.gallery_list {
	width: 217px;
	border: 1px solid white;
	display: inline-block;
	padding: 5px;
	margin: 7px;
	text-align: center;
	background: #FFFFFF;
}

.gallery_list2 {
	width: 217px;
	display: inline-block;
	padding: 5px;
	margin: 7px;
	text-align: center;
	background: #FFFFFF;
	padding-left: 0px;
}

.gallery_list:hover {
	color: #937cf790;
	opacity: 0.8;
	cursor: pointer;
}

.gallery_list2:hover {
	color: #89a1db;
	opacity: 0.8;
	cursor: pointer;
}

.gallery_title {
	height: 8px;
}

#area {
	width: 90px;
	height: 30px;
	background: #FEFDFD;
	border: 2px solid #9e9b9b;
	box-sizing: border-box;
}

#personnel {
	width: 80px;
	height: 30px;
	background: #FDFDFD;
	border: 2px solid #937cf790;
	box-sizing: border-box;
}

#search {
	width: 250px;
	height: 30px;
	margin-left: 50px;
	background: #FDFDFD;
	border: 2px solid #937cf790;
	box-sizing: border-box;
}

.btnArea {
	text-align: center;
	padding: 30px;
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

#insertBtn {
	width: 25px;
}

.searchArea {
	padding: 10px;
}

button{
 font-family: "Nanum Gothic";
}


.searchArea button {
	width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
}

.searchCondition button {
	width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
}

#insertBtn {
	width: 80px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color:black;
}

.scale {
	width: 217px;
	overflow: hidden;
	margin: 0 auto
}
/*overflow:hidden을 선언해줘야 확대 시 이미지가 밖으로 넘치지 않아요!*/
.scale img {
	transform: scale(1);
	transition: transform 0.5s linear;
}

.scale:hover img {
	transform: scale(1.1); /*  default */
	-webkit-transform: scale(1.1); /*  크롬 */
	-moz-transform: scale(1.1); /* FireFox */
	-o-transform: scale(1.1); /* Opera */
}
</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

		<section id="btSection" class="btSection">




		<div class="galleryArea">
			<label style="margin-left: 10px; font-family: Nanum Gothic;   color:  #757575; "><strong> 지역검색</label><label
				style="margin-left: 185px; font-family: Nanum Gothic;   color:  #757575; ">카페홍보</label><label
				style="margin-left: 330px; font-family: Nanum Gothic;   color:  #757575; ">카페명검색</label> </strong>
			<!-- 지역및 인원선택 -->
			<div class="searchArea">
				<form action="<%=request.getContextPath()%>/cafe/search"
					method="get" style="width: -50px; float: left;">

					<select id="area" name="search"
						style="border: 2px solid #937cf790;  font-family: Nanum Gothic;">
						<%if(searchCondition.equals("area")){ %>
						<option value="<%= searchCondition %>">선택:<%= search %>
						</option>
						<% }%>
						<option value="">전체</option>
						<optgroup label="서초구">
							<option value="방배">방배</option>
							<option value="반포">반포</option>
							<option value="서초">서초</option>
							<option value="잠원">잠원</option>
						</optgroup>

						<optgroup label="강남구">
							<option value="역삼">역삼</option>
							<option value="논현">논현</option>
							<option value="강남">강남</option>
							<option value="신사">신사</option>
						</optgroup>

						<optgroup label="송파구">
							<option value="장지">장지</option>
							<option value="송파">송파</option>
							<option value="문정">문정</option>
							<option value="석촌">석촌</option>
						</optgroup>

						<optgroup label=" 관악구">
							<option value="봉천">봉천</option>
							<option value="남현">남현</option>
							<option value="행운동">행운동</option>
							<option value="신림">신림</option>
						</optgroup>

						<optgroup label="동작구">
							<option value="사당">사당</option>
							<option value="흑성동">흑성동</option>
							<option value="대방동">대방동</option>
							<option value="신대방">신대바</option>
						</optgroup>

						<optgroup label="노원구">
							<option value="수성구">수성구</option>
							<option value="남구">남구</option>
							<option value="북구">북구</option>
							<option value="중구">중구</option>
						</optgroup>

					</select>
					<button id="bt1" type="submit" name="searchCondition" value="area"
						<%= selected[0] %>>검색</button>
				</form>

				<form style="float: left; width: 420px;">
					<MARQUEE DIRECTION="left" style="color: #937cf790; font-family: Nanum Gothic;">제휴카페로
						등록해 카페를 제일먼저 홍보하세요! </MARQUEE>
				</form>

				<form action="<%=request.getContextPath()%>/cafe/search"
					method="get"
					style="left: 55%; right: 10.01%; top: 32%; bottom: 67.1%; float: rigth;">



					<%if(searchCondition.equals("title")){ %>
					<input type="text" id="search" name="search" value="<%= search %>" style="font-family: Nanum Gothic;"
						placeholder="카페명을 검색하세요!">
					<%} else{ %>
					<input type="text" id="search" name="search"  style="font-family: Nanum Gothic;"
						placeholder="카페명을 검색하세요!">
					<% }%>
					<button type="submit" class="img-button" name="searchCondition"
						<%= selected[1] %> value="title"
						 >검색
					</button>


				</form>
			</div>
			<br>



			<!--  경계바 -->
			<div id="line1"></div>



			<%
				if (list2.isEmpty()) {
			%>
			<img
				src="<%=request.getContextPath()%>/resources/Cafeimages/검색결과.jpg "
				style="padding-left: 80px;">

			<%
				} else {
			%>
			<%
				for (Cafe c : list2) {
			%>
			<%
				if (c.getAFFILIATED_CAFE().equals("Y") ) {
			%>
			<div class="gallery_list2"
				style="margin-bottom: 5px; margin-top: 40px;">
				<input type="hidden" value="<%=c.getCafe_code()%>">
				<div class="scale">
					<%
						if (c.getCafe_photo() != null) {
					%>
					<img
						src="<%=request.getContextPath()%>/resources/Cafeimages/<%=c.getCafe_photo()%>"
						width="205px" height="150px">
					<%
						} else {
					%>

					<img
						src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"
						width="205px" height="150px">
					<%
						}
					%>

				</div>

				<h5 class="gallery_title"  style="font-family: Nanum Gothic;">
					<제휴> <strong style="color: #937cf790;"><%=c.getCafe_name()%></strong>
				</h5>
				<h10
					style="margin-top: 0px; margin-bottom: 0px; font-size: 5px; font-family: Nanum Gothic;">
				<strong> #<%= c.getCafe_area() %>#최대인원<%= c.getCafe_capacity() %>#운영<%= c.getCafe_oh() %></strong>
				</h10>
			</div>
			<% } else { %>
			<div class="gallery_list"
				style="margin-bottom: 20px; margin-top: 30px;">
				<input type="hidden" value="<%=c.getCafe_code()%>">
				<div class="scale"
					style="margin-right: 0px; width: 200px; margin-left: 2px;">
					<%
						if (c.getCafe_photo() != null) {
					%>
					<img
						src="<%=request.getContextPath()%>/resources/Cafeimages/<%=c.getCafe_photo()%>"
						width="205px" height="150px">
					<%} else { %>
					<img
						src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"
						width="205px" height="150px">
					<%} %>
				</div>

				<h5 class="gallery_title"
					style="font-family: Nanum Gothic; margin-top: 10px; margin-bottom: 15px;">
					<%=c.getCafe_name()%></h5>
				<h6 style="margin-top: 0px; margin-bottom: 0px; font-size: 5px; font-family: Nanum Gothic;">

					 #<%= c.getCafe_area() %>#최대인원<%= c.getCafe_capacity() %>#운영<%= c.getCafe_oh() %> 
				</h6>
			</div>


			<% } %>
			<% } %>
			<%} %>




			<div id="line1" style="margin-top: 30px;"></div>
			
		


		<!-- 페이징 바 -->
			<div class="pagingArea">

				<!--  처음으로 (<<)-->
				<%if(s == null){ %>
				<button onclick="location.href='<%=request.getContextPath()%>/cafe/list?currentPage=1'"> &lt;&lt;</button>
				<%
					} else {
				%>
					<button onclick="location.href='<%= request.getContextPath() %>/cafe/search?currentPage=1&searchCondition=<%= searchCondition %>&search=<%=search %>'"> &lt;&lt;</button>
				<% } %>
				<!-- 이전으로(<) -->
				<% if (pi.getCurrentPage() == 1) { %>
				<button disabled>&lt;</button>
					<button onclick="location.href='<%= request.getContextPath() %>/cafe/search?currentPage=<%= pi.getCurrentPage() - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
				<% } else if(s ==null) { %>
				<button onclick="location.href='<%=request.getContextPath()%>/cafe/list?currentPage=<%=pi.getCurrentPage() - 1%>'"> &lt;</button>
				<% } else{ %>
				<%  }%>
				
				<!-- 10개의 페이지 목록  -->
				<% for(int p = pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
				<% if(p == pi.getCurrentPage()){ %>
					<button style="background:lightgray;" disabled> <%= p %> </button>
				<%}else if(s == null){ %>
					<button onclick="location.href='<%= request.getContextPath() %>/cafe/list?currentPage=<%= p %>'"> <%= p %> </button>
				<%} else {%>
					<button onclick="location.href='<%= request.getContextPath() %>/cafe/search?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
				<% } %>
				<%} %>

				<!--  다음으로(>) -->
				<%if(pi.getCurrentPage() == pi.getMaxPage()){ %>
				<button disabled> &gt; </button>
				<%} else if(s == null) { %>
				<button onclick="location.href='<%= request.getContextPath() %>/cafe/list?currentPage=<%= pi.getCurrentPage() + 1 %>'"> &gt; </button>
				<%} else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/cafe/search?currentPage=<%= pi.getCurrentPage() + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
				<% } %>
				<!-- 맨끝으로(>>) -->
				<% if(s == null){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/cafe/list?currentPage=<%= pi.getMaxPage() %>'"> &gt;&gt; </button>
				<% } else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/cafe/search?currentPage=<%= pi.getMaxPage() %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
				<% } %>

 				
 				
 				
			</div> 
			
			
				<%-- 로그인 유저만 작성하기 버튼 보이기 --%>
				<% if(loginUser != null) { %>
			<button id="insertBtn" type="button"
				onclick="location.href='<%=request.getContextPath()%>/views/studycafe/cafeInsertForm.jsp'"
				style="margin-left: 895px;">카페등록</button>
			<%
				}
			%>
		</div>
			<script>
				$(function(){
					$(".gallery_list2" ).click(function(){
						var cafe_code = $(this).children().eq(0).val();
						location.href='<%= request.getContextPath() %>/study/detail?cafe_code='+cafe_code; 
					});
						
				});
				$(function(){
					$(".gallery_list" ).click(function(){
						var cafe_code = $(this).children().eq(0).val();
						location.href='<%= request.getContextPath() %>/study/detail?cafe_code='+cafe_code; 
					});
						
				});
			</script>
			
		 
		 

 

	</section>
	 	<%@ include file="../common/footer.jsp" %>
</body>
</html>