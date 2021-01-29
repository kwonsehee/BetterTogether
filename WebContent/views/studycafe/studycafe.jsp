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
/* 바깥 영역 */
.outer {
	width: 100%;
	min-width: 850px;
	font-family: "Do Hyeon";
	background-color: #f9f1f1;
	margin: auto;
	margin-top: 20px;
	margin-bottom: 70px;
	border-radius: 20px;
}

.galleryArea {
	padding: 5px;
	width: 980px;
	min-height: 400px;
	margin: auto;
}

#line1 {
  border: 3px solid rgba(255, 96, 100, 0.7);
}

.gallery_list {
	width: 210px;
	border: 2px solid white;
	display: inline-block;
	padding: 5px;
	margin: 7px;
	text-align: center;
}

.gallery_list2 {
	width: 210px;
	border: 3px solid #fdc8c6;
	display: inline-block;
	padding: 5px;
	margin: 7px;
	text-align: center;
}

.gallery_list:hover {
	color: #88a1db;
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
	border: 2px solid #FF6064;
	box-sizing: border-box;
}

#personnel {
	width: 80px;
	height: 30px;
	background: #FDFDFD;
	border: 2px solid #FF6064;
	box-sizing: border-box;
}

#search {
	width: 250px;
	height: 30px;
	margin-left: 50px;
	background: #FDFDFD;
	border: 2px solid #FF6064;
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
	background: #fdc8c6;
	font-family: "Do Hyeon";
	color: #757575;
}

#insertBtn {
	width: 25px;
}

.searchArea {
	padding: 10px;
}

.searchArea button {
	width: 50px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

	#insertBtn {
	width: 50px;
	height: 35px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
	}
</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<div class="outer">
				
			<label style="color:#FF6064;  margin-left: 25px;" > 지역검색</label><label  style="color:#FF6064;margin-left: 185px;">카페홍보</label><label style="color:#FF6064; margin-left: 350px;">카페명검색</label>	
			<div class="galleryArea">

				<!-- 지역및 인원선택 -->
				<div class="searchArea">
					<form action="<%=request.getContextPath()%>/cafe/search"
						method="get" style="width:-50px;float:left;  ">
							
						<select id="area" name="search"   >
						 <%if(searchCondition.equals("area")){ %> 
						 <option value="<%= searchCondition %>" >선택:<%= search %> </option> 
						 <% }%>
							 <option  value="">전체</option>
							<optgroup label="서초구">  
								<option  value="방배">방배</option>
								<option  value="반포">반포</option>
								<option  value="서초">서초</option>
								<option  value="잠원">잠원</option>
							</optgroup>

							<optgroup label="강남구">
									<option  value="역삼">역삼</option>
									<option  value="논현">논현</option>
									<option  value="강남">강남</option>
									<option  value="신사">신사</option>
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
						<button id="bt1" type="submit" name="searchCondition" value="area" <%= selected[0] %>
							style="width: 60px; height: 25.5px; background: #FEFDFD; ">적용</button> 
						</form>
					 
						<form style=" float:left;width: 420px;" >  <MARQUEE DIRECTION="left" style="text-shadow: 2px 2px 4px gray; color : pink; ">제휴카페로 등록해 카페를 제일먼저 홍보하세요! </MARQUEE></form>
						 
					<form action="<%=request.getContextPath()%>/cafe/search"
						method="get"
						style="  left: 55%; right: 10.01%; top: 32%; bottom: 67.1%;float:rigth; ">
						
						
						
						<%if(searchCondition.equals("title")){ %> 
						<input type="text" id="search"     name="search"  value="<%= search %>"
						placeholder="카페명을 검색하세요!"  >
						<%} else{ %>
						<input type="text" id="search"     name="search"   
						placeholder="카페명을 검색하세요!"  > 
						<% }%>
						<button type="submit" class="img-button" name="searchCondition" <%= selected[1] %>
							value="title"                                
							style="width: 50px; height: 30px; background: #FEFDFD;">검색
						</button>
						
						
					</form>
				</div>
				<br>
				
				
			 
				<!--  경계바 -->
				<hr id="line1">

				
				
				 <%if(list2.isEmpty()){ %>
				 <br>  <br> <br> <br>  <br>
			 		<h1> 등록된 카페가 없습니다!</h1>
			 	<% } else{ %>
				<% for(Cafe c : list2) { %>
				<%if(c.getAFFILIATED_CAFE().equals("Y")){ %>
				<div class="gallery_list2"> 
						<input type="hidden" value="<%= c.getCafe_code()  %>">
					<div>
							<img src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo()  %>"
							width="210px" height="150px">

					</div>

					<h3 class="gallery_title"><%=c.getCafe_name()%></h3>
					<h5 style="margin-top: 0px; margin-bottom: 0px;">

						<(제휴)<%=c.getCafe_area()%>>
					</h5>
				</div>
				<% } else { %> 
				<div class="gallery_list"> 
					<input type="hidden" value="<%= c.getCafe_code() %>">
					<div>

						<img src="<%=request.getContextPath()%>/resources/Cafeimages/<%=  c.getCafe_photo()%>"
							width="210px" height="150px">

					</div>

					<h4 class="gallery_title"><%=c.getCafe_name()%></h4>
					<h6 style="margin-top: 0px; margin-bottom: 0px;">

						<<%=c.getCafe_area()%>>
					</h6>
				</div>
				 
				 
				<% } %>
		 		<% } %> 
		 		<%} %>
				
				
				
	 
				
			</div>
			<hr id="line1">

			<!-- 페이징 바 -->
			<div class="pagingArea">

				<!--  처음으로 (<<)-->
				<%if(s == null){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/cafe/list?currentPage=1'"> &lt;&lt;</button>
				<%} else{ %>
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

 				
 				<%-- 로그인 유저만 작성하기 버튼 보이기 --%>
				<% if(loginUser != null) { %>
				<button id="insertBtn" type="button"
					style="width: 55.99306px; height: 25.99306px;"
					onclick="location.href='<%= request.getContextPath() %>/views/studycafe/cafeInsertForm.jsp'">등록</button>
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
			
			
			
				
		</div>


 


	</section>

</body>
</html>