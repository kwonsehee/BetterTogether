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
<title>better together</title>
<style>
#btHeader {
	top: 0px;
}
/* 바깥 영역 */
.content_css {
	width: 100%;
	height: 950px;
	background-color: rgba(219, 219, 219, 0.356);
	z-index: -3;
}

.outer {
	width: 1000px;
	min-width: 850px;
	font-family: "Nanum Gothic";
	margin: auto;
	margin-top: 20px;
	margin-bottom: 70px;
	border-radius: 20px;
	z-index: -2;
}

.galleryArea {
	position: absolute;
	padding: 5px;
	width: 1000px;
	height: 950px;
	min-height: 400px;
	margin: auto;
	z-index: 0;
}

.content_css button {
	width: 60px;
	height: 30px;
	color: #9e9e9e5b;
	font-family: "Nanum Gothic";
	background-color: #c7bdf2;
	border: solid 1px #b6a8f5;
	border-radius: 5px;
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
	height: 450px;
	left: 500px;
	width: 450px;
}

#cafeimg {
	width: 425px;
	height: 425px;
	padding-top:20px;
}

.rvt {
	position: absolute;
	left: 55.76%;
	right: 4.1%;
	top: 4.37%;
	bottom: 54.2%;
	font-family: "Nanum Gothic";
	background: white;
	border-radius: 20px;
	 
}

.inf {
	position: absolute;
	left: 4%;
	right: 4%;
	top: 52.3%;
	bottom: 2.13%;
	font-family: "Nanum Gothic";
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
left: 47.31%;
right: 19.8%;
top: 23.91%;
bottom: 5.37%;

	
	border-radius: 36px;
	border-radius: 20px;
	z-index: 0;
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
	margin: 10px;
}

#modal button {
	display: inline-block;
	width: 110px;
	margin-left: calc(100% - 100px - 100px);
	margin-top: 30%;
	border-radius: 8px;
}

#modal .modal_content {
	width: 319px;
	height: 347px;
	margin-top: -190px;
	margin-left: -250px;
	background: #fff;
	border: 2px solid #666;
	border-radius: 8px;
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
	left: 52%;
	right: 47.41%;
	top: 600px;
	width: 60px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 7px 5px 7px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color: black;
}

#btnArea3 {
	position: absolute;
	left: 55%;
	right: 40.41%;
	top: 600px;
	width: 60px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 7px 5px 7px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color: black;
}

.button {
	width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color: black;
}

#updateBtn {
	position: absolute;
	width: 60px;
	height: 33px;
	top: 550px;
	left: 845px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color: black;
}

#deleteBtn {
	position: absolute;
	width: 60px;
	height: 33px;
	left: 930px;
	top: 550px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color: black;
}

#t1 {
	position: absolute;
	width: 610px;
	height: 85px;
	left: 36.42px;
	top: 25.02px;
	background: #C4C4C4;
}

dl, dt, dd, ol, ul, li, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
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

blockquote:before, blockquote:after, q:before, q:after {
	content: '';
	content: none;
}

strong{
font-family: "Nanum Gothic";

}

table {
	border-collapse: collapse;
	border-spacing: 0;
}

ul {
	list-style: none;
}

.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	height: 450px;
	width: 450px;
	padding-right: 0px;
	padding-left: 0px;
	border-radius: 2px;
	position: relative;
	background-color: rgba(219, 219, 219, 0.356);
	overflow: hidden;
}

.slider {
	display: flex;
	position: absolute;
	top: 0;
	left: 0;
}

.item {
	width: 450px;
	height: 450px;
	border-radius: 20px;
	font-size: 35px;
	text-align: center;
}

.prev {
	position: absolute;
	left: 0%;
	right: 98.39%;
	top: 20.88%;
	bottom: 77.17%;
}

.next {
	position: absolute;
	top: 30%;
	right: -3%;
	color: black;
}

.container ul {
	-webkit-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
	-o-transition: all 0.25s cubic-bezier(1, .01, .32, 1);
	transition: all 0.25s cubic-bezier(1, .01, .32, 1);
}

#cafe_title{
     margin-top: 20px;
     text-align: center;
     font-size: 24px;
     color : #757575;
}

.cafe_info{
	font-size:15px;
	margin-left:10px;
}



 

</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css" style="height: 1100px;">
		<div class="outer">
			<div class="galleryArea" style="top: 150px;"> 
				<p id="cafe_title">  <a style="font-weight:bolder;">  better together-스터디카페</a>    </p>
				<h4 style="margin-left: 365px;   font-family: Nanum Gothic; color:#797878; font-size:17px;">
				 #<%=c.getCafe_area()%>#수업#다목적#공간#스터디룸 
				</h4>
				<div class="cafe" style="top: 120px; left: 35px;">


					<!-- 도서이미 불러오기-->
					<div class="container"
						style="background-color: rgba(255, 255, 255, 0);">
						<ul class="slider"
							style="width: 1350px; left: 0px; padding-left: 0px; height: 450px; margin-left: 10px;"">
							<%
								if (c.getCafe_photo() != null) {
							%>
							<li class="item"><img id='cafeimg' style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/<%=c.getCafe_photo()%>"
								align="bottom"></li>
							<%
								} else {
							%>
							<li class="item"><img id='cafeimg' style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"
								align="bottom"></li>
							<%} %>

							<%if(c.getCafe_photo2() != null  ) {%>
							<li class="item"><img id='cafeimg' style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo2()  %>"
								align="bottom"></li>
							<%} else    { %>
							<li class="item"><img id='cafeimg' style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"
								align="bottom"></li>
							<%} %>


							<%if(c.getCafe_photo3() != null  ) {%>
							<li class="item"><img id='cafeimg'  style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/<%= c.getCafe_photo3()  %>"
								align="bottom"></li>
							<%} else{ %>
							<li class="item"><img id='cafeimg'  style="width: 430px;"
								src="<%=request.getContextPath()%>/resources/Cafeimages/이미지준비중.jpg"
								align="bottom"></li>
							<%} %>
						</ul>
					</div>
					<div class="btn">
						<a class="prev" style="text-decoration: none; top: 200px;">&#10094;</a>
						<a class="next" style="text-decoration: none; top: 200px;">&#10095;</a>
					</div>
					<td><br>
					<tr>
					</tr>
					</td>
				</div>

				<!-- 카페 정보 및 예약-->
				<div class="rvt"
					style="top: 140px;left: 550px;width: 422px;height: 402px;">
					<span><a style="font-size: 25px; font-family: NanumGothic;">&nbsp&nbsp&nbsp <p style="margin-left:40%;"><%=c.getCafe_name()%></p>
					</a> </span>
					<table id="info">
						<td>
						<tr>
							<p class="cafe_info" style="font-family: NanumGothic;" > &nbsp 지역: <%=c.getCafe_area()%>
							</p>
						</tr>
						<br>
						<tr>
							<p class="cafe_info" style="font-family: NanumGothic;"> &nbsp 예약가능 인원: <%=c.getCafe_capacity()%>
							</p>
						</tr>
						<br>
						<tr>
							<p class="cafe_info" style="font-family: NanumGothic;"> &nbsp 이용시간: <%=c.getCafe_oh()%>
							</p>
						</tr>
						<br>
						</td>
						<tr>
							<p class="cafe_info" style="font-family: NanumGothic;"> &nbsp 상세주소: <%= c.getCafe_map() %> <%= c.getDetail_address() %>
							</p>
						</tr>


						<ul id="navi">
							<li>
								<!--문의하기 팝업-->
								<div id="root">
									<button class="nav_btn" id="modal_opne_btn"
										style="position: absolute; width: 120px; height: 40px; left: 70px; top: 320px; background: #b6a8f5; color: white;">
										<a style="font-family: NanumGothic;">문의하기</a>
									</button>
								</div>

								<div id="modal">

									<div class="modal_content">
										<hr
											style="left: -245px; width: 310px; top: 230px; border: 0.5px solid #937cf790;">
										<h2 style="text-align: center; font-family: NanumGothic; font-size:20px;">
											<br style="font-family: NanumGothic;">
											<%=c.getCafe_name()%></h2>
										<br>
										<h5 style="font-family: NanumGothic; font-size:15px; padding:20px;">
											&nbsp&nbsp" better together를 통해 연락드렸어요 ~" 라고 말씀하시면 다양한 혜택과
											서비스를 받으실수있어요. :) <br> <br>

										</h5>

										<h2 style="text-align: center;">
											<br> <p> <%= c.getCafe_phone() %></p>
										</h2>
										<button type="button" id="modal_close_btn"
											style="background: #937cf790; color: white; margin-top: 5px; width: 100px; margin-left: 110px;">닫기</button>
									</div>
									<div class="modal_layer"></div>
								</div>

							</li>
							<li>
								<button class="nav_btn" id="bt2"
									style="top: 320px; background: #b6a8f5; color: white; left: 200px; width: 120px; height: 40px;"
									onclick="window.open('https://<%= c.getCafe_page() %>')">
									<a style="font-family: NanumGothic; ">예약하기</a>
								</button>
							</li>
						</ul>
					</table>
				</div>

				<button type="button" id="btnArea2"
					style="margin-left: 550px; margin-top: 445px;">목록</button>
				<% if(loginUser != null) { %>
				<button type="button" id="btnArea3"
					style="margin-left: 580px; margin-top: 0px; top: 552px; left: 40px;">신고</button>

				<%} %>

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

					function plusSlides(n) {
						showSlides(slideIndex += n);
					}

					function currentSlide(n) {
						showSlides(slideIndex = n);
					}

					var nextBtn = document.querySelector('.next');
					var prevBtn = document.querySelector('.prev');

					nextBtn.addEventListener('click', function() {
						plusSlides(1);
					});
					prevBtn.addEventListener('click', function() {
						plusSlides(-1);
					});
				</script>











				<script>
				
				const btnArea2 = document.getElementById("btnArea2");
				btnArea2.addEventListener('click',function(){
				location.href="<%= request.getContextPath()%>/cafe/list";
				});
				</script>



				<%
					if (loginUser != null && loginUser.getUserId().equals(c.getUserId())) {
				%>
				<button id="updateBtn">수정</button>
				<button id="deleteBtn" style="left: 910px;">삭제</button>

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


				<div id="line1" style="top: 570px;width: 1000px;left: 0px;border: 0.5px solid #937cf790;margin-top: 10px;"></div>
					 
				<!-- 카페 정보,약도-->
				<div class="inf" style="top: 590px; width: 1200px; left: 0px;">
					<br>
					<table id="info2">
						<td>
						<tr>
							<span style="display: block; width: 480px; height: 100px;">
								<p>&nbsp&nbsp공간소개 </p> <pre
									style="font-size: 16px; white-space: pre-wrap;  font-family:NanumGothic; height:
								 110px;width: 550px;margin-left: 10px;border-top-width:
								  0px;border-bottom-width: 0px;border-left-width:
								   0px;border-right-width: 0px; background-color:rgba(255,255,255,0); white-space:pre-wrap;"><%=c.getCafe_info()%></pre>
							</span>
						</tr>
						</td>
						<td>
						<tr>
							<span
								style="display: block;width: 480px;height: 100px;margin-top: 70px;">
								<div id="line1" style="left: 0px;top: 150px;width: 550px;border: 0.5px solid #937cf790;margin-top: 10px;margin-bottom: 15px;"></div>
								<p> &nbsp&nbsp유의사항 </p> <pre
									style="font-size: 16px;white-space: pre-wrap;  height: 150px; width: 550px; font-family:
									NanumGothic; 
									 margin-left: 10px; border-left-width: 0px; 
									 border-top-width: 0px; border-bottom-width:
									  0px; background-color:rgba(255, 255, 255, 0); 
									  border-right-width: 0px;"background-color:rgba(255,255,255,0);"><%=c.getCafe_notice()%></pre>
							</span>
						</tr>
						</td>
						<br>

						<h3 style="margin-top: -260px;">
							<p style="margin-left: 570px;">오시는길</p>
						</h3>
						<br>
						<br>
						

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

			</div>


			<script>
           
				document.getElementById("modal_opne_btn").onclick = function() {
					document.getElementById("modal").style.display = "block";
				}

				document.getElementById("modal_close_btn").onclick = function() {
					document.getElementById("modal").style.display = "none";
					}
				</script>



		</div>

	</section>

	 <%@ include file="../common/footer.jsp" %>
</body>
 
</html>