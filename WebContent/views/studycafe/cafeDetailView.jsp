<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList , studycafe.model.vo.*" %>
<% 
	 Cafe c= (Cafe)request.getAttribute("Cafe");

 	//ArrayList<Cafe> fileList =(ArrayList<Cafe>)request.getAttribute("fileList"); // 제후카페 검색용 list 
 	

 	//PageInfo pi2 = (PageInfo)request.getAttribute("pi2"); // 임시 삭제 왜만들었는지 까먹음
 	
 	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 바깥 영역 */
#main {
	position: absolute;
	padding-top: 20px;
	width: 1000px;
	height: 600px;
	margin-top: 5px;
	background-color: #f9f1f1;
	border-radius: 20px;
}

.content_css button {
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

hr {
	position: absolute;
	left: 4%;
	right: 4%;
	top: 45.%;
	bottom: 49%;
	border: 1px solid #FF6064;
}

.cafe {
	position: absolute;
 
	left: 4.75%;
	right: 47.43%;
	top: 4.4%;
	bottom: 52.15%;
	
}

#cafeimg {
	width: 500px;
	height: 250px;
	border-radius: 20px;

}

.rvt {
	position: absolute;
	left: 55.76%;
	right: 4.1%;
	top: 4.37%;
	bottom: 54.2%;
	font-family: "Do Hyeon";
	background: rgba(253, 200, 198, 0.25);
	border-radius: 20px;
}

.inf {
	position: absolute;
	left: 4%;
	right: 4%;
	top: 52.3%;
	bottom: 2.13%;
	font-family: "Do Hyeon";
	background: rgba(253, 200, 198, 0.25);
	border-radius: 20px;
}

#bt1 {
	position: absolute;
	width: 150px;
	height: 40px;
	left: 30px;
	top: 190px;
}

#bt2 {
	position: absolute;
	width: 150px;
	height: 40px;
	left: 210px;
	top: 190px;
}

.map {
	position: absolute;
	left: 55.41%;
	right: 4.24%;
	top: 8.05%;
	bottom: 9.67%;
	border-radius: 36px;
	border-radius: 20px;
	z-index:0;
}

#maps {
	width: 400px;
	height: 220px;
	border-radius: 5px;
}

#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 70px;
	margin-left: calc(100% - 100px - 100px);
	margin-top: 30%;
	border-radius: 20px;
}

#modal .modal_content {
	width: 300px;
	height: 200px;
	margin-top: -50px;
	margin-left: -250px;
	background: #fff;
	border: 2px solid #666;
	background-image:
		url('<%=request.getContextPath()%>/resources/images/전화번호.png'); 
	border-radius: 20px;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#btnArea2 {
	position: absolute;
	left: 46.33%;
	right: 47.41%;
	top: 615.5px;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#btnArea3 {
	position: absolute;
	left: 38.33%;
	right: 40.41%;
	top: 615.5px;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

.button {
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#updateBtn {
	position: absolute;
	width: 63px;
	height: 33px;
	left: 805px;
	top: 615.5px;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#deleteBtn {
	position: absolute;
	width: 63px;
	height: 33px;
	left: 874.5px;
	top: 615.5px;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#t1 {
	position: absolute;
	width: 610px;
	height: 85px;
	left: 36.42px;
	top: 25.02px;
	background: #C4C4C4;
}



 
 
dl, dt, dd, ol, ul, li, 
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
 
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
} 
ul{
    list-style:none;
}
.wrapper{
    display: flex;
    justify-content: center;
    align-items: center;
}
.container{
 	width: 500px;
	height: 250px;
	border-radius: 20px;
    position: relative;
 	background-image:
	url('<%=request.getContextPath()%>/resources/Cafeimages/이미지준비2.jpg');    


    overflow: hidden;
}
.slider{
    display: flex;
    position:absolute;
    top:0;
    left:0;
}
.item{
  	width: 500px;
	height: 250px;
	border-radius: 20px; 
    font-size: 35px;
    text-align: center;
}
 
.btn{
    font-size: 50px;
}
.prev{
    position:absolute;
    top:30%;
    left:0;
    color:white;
}
.next{
    position:absolute;
    top:30%;
    right:-3%;
     color:white;
}
.container ul{
    -webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
    -o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
    transition: all 0.25s cubic-bezier(1, .01, .32, 1);
}
</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<div id="main">
			<div class="cafe">
			
			
				<!-- 도서이미 불러오기--> 
				<div class="container">
					<ul class="slider">
						<%if(c.getCafe_photo() != null ) {%>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo()  %>"align="bottom"></li>
						<%} else { %>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"align="bottom"></li>
						<%} %>
						
						<%if(c.getCafe_photo2() != null  ) {%>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo2()  %>"align="bottom"></li>
						<%} else    { %>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"align="bottom"></li>
						<%} %>
						
						
						<%if(c.getCafe_photo3() != null  ) {%>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo3()  %>"align="bottom"></li>
						<%} else{ %>
						<li class="item"><img id='cafeimg'src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"align="bottom"></li>
						<%} %>
					</ul>
				</div>
				<div class="btn">
					<a class="prev" style="text-decoration: none;">&#10094;</a> <a
						class="next" style="text-decoration: none;">&#10095;</a>
				</div>
				<td><br>
				<tr>
				</tr>
				</td>
			</div>

			<!-- 카페 정보 및 예약-->
			<div class="rvt" style="border: 1px solid #229ed8;">
				<span><a style="font-size: 25px;">&nbsp&nbsp&nbsp <%=c.getCafe_name()%>
				</a> </span><br> <br>
				<table id="info">
					<td>
					<tr>
						&nbsp 지역:
						<%=c.getCafe_area()%>
					</tr>
					<br>
					<br>
					<tr>
						&nbsp 이용가능한 최대 인원:
						<%=c.getCafe_capacity()%>
					</tr>
					<br>
					<br>
					<tr>
						&nbsp 이용시간:
						<%=c.getCafe_oh()%>
					</tr>
					<br>
					<br>
					</td>
					<ul id="navi">
						<li>
							<!--문의하기 팝업-->
							<div id="root">
								<button class="nav_btn" id="modal_opne_btn"
									style="position: absolute; width: 150px; height: 40px; left: 30px; top: 190px;">
									<a>문의하기</a>
								</button>
							</div>
							<div id="modal">

								<div class="modal_content">
									
									<h2 style="text-align: center; color: black; font-family:"DoHyeon";">
										<br>
										<%= c.getCafe_name() %></h2>
 										<h4>BetterTogether에서 보고 연락드렸다고 말하세요!</h4>
									<h2 style="text-align: center;">
										<br>

										<%= c.getCafe_phone() %></h2>
									<button type="button" id="modal_close_btn">닫기</button>
								</div>
								<div class="modal_layer"></div>
							</div>

						</li>
						<li>
							<button class="nav_btn" id="bt2"
								onclick="window.open('https://<%= c.getCafe_page() %>')">
								<a>예약하기</a>
							</button>
						</li>
					</ul>
				</table>
			</div>


		
				 <script>
				 
				 
				 
				 
				 
				 
				 var slideWrapper = document.querySelector('.container');
				 var slides = document.querySelectorAll('.item');
				 var totalSlides = slides.length; // item의 갯수


				 var sliderWidth = slideWrapper.clientWidth; // container의 width
				 var slideIndex = 0;
				 var slider = document.querySelector('.slider');

				 slider.style.width = sliderWidth * totalSlides + 'px';


				 function showSlides(n) {
				     slideIndex = n;
				     if (slideIndex == -1) {
				         slideIndex = totalSlides - 1;
				     } else if (slideIndex === totalSlides) {
				         slideIndex = 0;
				     }
				     slider.style.left = -(sliderWidth * slideIndex) + 'px';
				 }

				 function plusSlides(n){
				     showSlides(slideIndex += n);
				 }
				   
				 function currentSlide(n) {
				     showSlides(slideIndex = n);
				 }

				 var nextBtn = document.querySelector('.next');
				 var prevBtn = document.querySelector('.prev');

				 nextBtn.addEventListener('click', function () {
				     plusSlides(1);
				 });
				 prevBtn.addEventListener('click', function () {
				     plusSlides(-1);
				 });
				 
				 
				 
				 </script>














				<div class="btnArea" id="btnArea">

					<button type="button" id="btnArea2">목록</button>


					<script>
				
				const btnArea2 = document.getElementById("btnArea2");
				btnArea2.addEventListener('click',function(){
				location.href="<%= request.getContextPath()%>/cafe/list";
				});
				</script>

					<% if(loginUser != null) { %>
					<button type="button" id="btnArea3">신고</button>

					<%} %>

					<%
						if (loginUser != null && loginUser.getUserId().equals(c.getUserId())) {
					%>
					<button id="updateBtn">수정</button>
					<button id="deleteBtn">삭제</button>

					<!-- 수정/삭제를 위한 form -->
					<form action="" id="Cafe_codeForm" method="post">
						<input type="hidden" name="Cafe_code"
							value="<%= c.getCafe_code() %>">
					</form>

					<script>
				 
				
				// 수정하기 버튼 이벤트
				const updateBtn = document.getElementById('updateBtn');
				updateBtn.addEventListener('click', function(){
					$("#Cafe_codeForm").attr("action", "<%=request.getContextPath()%>/cafe/updateForm");
					$("#Cafe_codeForm").submit();
				});
				
				// 삭제하기 버튼 이벤트
				const deleteBtn = document.getElementById('deleteBtn');
				deleteBtn.addEventListener('click', function(){
					$("#Cafe_codeForm").attr("action", "<%=request.getContextPath()%>/CafeDeleteServlet");
					$("#Cafe_codeForm").submit();
					});
					</script>
					<%
						}
					%>
				</div>


				<script>
           
				document.getElementById("modal_opne_btn").onclick = function() {
					document.getElementById("modal").style.display = "block";
				}

				document.getElementById("modal_close_btn").onclick = function() {
					document.getElementById("modal").style.display = "none";
				}
				</script>

				<hr>
				<!-- 카페 정보,약도-->
				<div class="inf">
					<br>
					<table id="info2">
						<td>
						<tr>
							<span style="display: block; width: 480px; height: 50px;">
								카페 소개: <a style="font-size: 16px;"> &nbsp<%=c.getCafe_info()%></a>
							</span>
						</tr>
						</td>

						<br>
						<br>
						<span style="display: block; width: 480px;"> 카페 공지사항: <a
							style="font-size: 16px;"> &nbsp<%=c.getCafe_notice()%>
						</a>
						</span>
						<br>

						<br>
						<span style="display: block; width: 480px;"> 상세주소 : <a
							style="font-size: 16px;"> &nbsp<%=c.getCafe_map()%> <%=c.getDetail_address()%>
						</a>
						</span>
						<br>
						<br>






					</table>
					<!-- 신고 -->
					<form id="warningForm" method="post">
						<input type="hidden" name="no" value="<%=c.getCafe_code()%>">
						<input type="hidden" name="reported_id" value="<%=c.getUserId()%>">
						<input type="hidden" name="category" value="카페">
					</form>

					<script>
				const btnArea3 = document.getElementById('btnArea3');
				btnArea3.addEventListener('click',function(){
					$("#warningForm").attr("action", "<%=request.getContextPath()%>/report/insertForm");
					$("#warningForm").submit();
				});
	
			 
				</script>






					<div class="map" id="map"></div>

					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a95ee7a1128986556c900264fb3694d2&libraries=services,clusterer,drawing"></script>
					<script>
					var mapContainer = document.getElementById('map'),  
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667),  
						level :4
				  
					};

					  
					var map = new kakao.maps.Map(mapContainer, mapOption);

				 
					var geocoder = new kakao.maps.services.Geocoder();

				 
					geocoder
							.addressSearch(
									'<%= c.getCafe_map()  %>',
									function(result, status) {

										 
										if (status === kakao.maps.services.Status.OK) {

											var coords = new kakao.maps.LatLng(
													result[0].y, result[0].x);

											 
											var marker = new kakao.maps.Marker(
													{
														map : map,
														position : coords
													});

											 
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div style="width:150px;text-align:center;padding:6px 0;"><%= c.getCafe_name() %></div>'
													});
											infowindow.open(map, marker);

										 
											map.setCenter(coords);
										}
									});
				</script>

				</div>
				</div></section>
	 
</body>
</html>