<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList , studycafe.model.vo.*" %>

<%
	Cafe c = (Cafe)request.getAttribute("Cafe"); 
 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#main {
	position: absolute;
	padding-top: 20px;
	width: 1000px;
	height: 600px;
	margin-top: 5px;
	background-color: #f9f1f1;
	border-radius: 20px;
}

.studycafe_title {
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 18px;
	line-height: 22px;
	position: absolute;
	left: 18%;
	right: 72.54%;
	margin-top: 15px;
}

.studycafe_title2 {
	position: absolute;
	left: 47.27%;
	right: 22.16%;
	margin-top: 90px;
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 18px;
	line-height: 22px;
}

#title {
	position: absolute;
	left: 35.96%;
	right: 36.35%;
	top: 7.33%;
	bottom: 85.06%;
	font-family: Do Hyeon;
	font-style: normal;
	font-weight: normal;
	font-size: 36px;
	line-height: 45px;
}

.input_area input {
	position: absolute;
	left: 26.5%;
	right: 55%;
	margin-top: 150px;
	background: #FFFFFF;
	border-radius: 5px;
}

textarea {
	position: absolute;
	width: 350px;
	height: 150px;
	background: #FFFFFF;
	border-radius: 5px;
}

#btnArea1 {
	position: absolute;
	left: 44.33%;
	right: 45.41%;
	top: 92.53%;
	bottom: 1.44%;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#btnArea2 {
	position: absolute;
	left: 51.74%;
	right: 42%;
	top: 92.53%;
	bottom: 1.44%;
	width: 60px;
	height: 30px;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}

#area5 {
	position: absolute;
	left: 26.6%;
	right: 66.05%;
	top: 33.25%;
	bottom: 62%;
	border-radius: 5px;
}

.photo {
	position: absolute;
	left: 55%;
	right: 37.28%;
	top: 70.03%;
	bottom: 14.08%;
}

.photo3 {
	position: absolute;
	left: 56.77%;
	right: 37.28%;
	top: 86%;
	bottom: 11.21%;
}

#postcodify_search_button {
	position: absolute;
	left: 46.56%;
	right: 48.03%;
	top: 75.29%;
	bottom: 20.98%;
	color: #ff60657e;
	font-family: "Do Hyeon";
	background: #fff;
	border: 2px solid #ff60657e;
	border-radius: 55px;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!--  스터디카페ㅇㅇ -->





	<div id="main">

		<div class="outer">
			<div class="tableArea">
				<h1 id="title">스터디카페 수정</h1>
				<form action="<%=request.getContextPath()%>/cafe/update"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="Cafe_code" value="<%= c.getCafe_code() %>"> 
					
					<input type="hidden" name="Cafe_photo" value="<%= c.getCafe_photo() %>"> 
					<input type="hidden" name="Cafe_photo2" value="<%= c.getCafe_photo2() %>"> 
					<input type="hidden" name="Cafe_photo3" value="<%= c.getCafe_photo3() %>"> 
					

					<h4 class="studycafe_title"
						style="bottom: 65%; margin-bottom: 80px;">카페이름</h4>
					<span class="input_area"> <input type="text"
						name="cafe_name" maxlength="40" required style="margin-top: 9%;"
						value="<%= c.getCafe_name()%>">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 57%; margin-bottom: 80px;">운영시간</h4>
					<span class="input_area"> <input type="text"
						placeholder="ex)9:30-20:30" name="cafe_oh" required
						value="<%= c.getCafe_oh() %>" style="margin-top: 14%;">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 49%; margin-bottom: 80px;">지역</h4>
					<span class="input_area"> <select id="area5"
						name="cafe_area">
							<option value="<%=c.getCafe_area()%>"><%=c.getCafe_area()%></option>
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
					</span>

					<h4 class="studycafe_title"
						style="bottom: 41%; margin-bottom: 80px;">전화번호</h4>
					<span class="input_area"> <input type="text"
						name="cafe_phone" required style="margin-top: 24%;"
						value="<%=c.getCafe_phone()%>">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 33%; margin-bottom: 80px;">휴무일</h4>
					<span class="input_area"> <input type="text"
						value="<%=c.getClosed_day()%>" name="closed_day"
						style="margin-top: 29%;">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 25%; margin-bottom: 80px;">예약가능인원</h4>
					<span class="input_area"> <input type="text" required
						value="<%=c.getCafe_capacity()%>" name="cafe_capacity"
						placeholder="최대8명 ex)6" style="margin-top: 34%;">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 17%; margin-bottom: 80px;">카페홈페이지</h4>
					<span class="input_area"> <input type="text"
						name="cafe_page" value="<%=c.getCafe_page()%>" required
						style="margin-top: 39%;">
					</span>

					<h4 class="studycafe_title"
						style="bottom: 9%; margin-bottom: 80px;">도로명주소</h4>
					<span class="input_area"> <input type="text"
						class="postcodify_address" readonly value="<%=c.getCafe_map()%>"
						name="cafe_map" style="margin-top: 44%;"      >
					<button id="postcodify_search_button" type="button">검색</button>

					</span>
					<h4 class="studycafe_title"
						style="bottom: 1%; margin-bottom: 80px;">상세주소</h4>
					<span class="input_area"><input type="text"
						name="detail_address" value="<%=c.getDetail_address()%>"
						class="postcodify_details" required style="margin-top: 49%;"></span>






					<h4 class="studycafe_title2">카페소개글</h4>
					<textarea name="cafe_info"
						style="resize: none; left: 550px; top: 110px;" maxlength="110"><%=c.getCafe_info()%></textarea>


					<h4 class="studycafe_title2" style="margin-top: 25%;">카페공지글</h4>
					<textarea name="cafe_notice"
						style="resize: none; left: 550px; top: 270px;" maxlength="110"><%=c.getCafe_notice()%></textarea>

					<h4 class="studycafe_title2" style="margin-top: 42%;">대표이미지</h4>
				<div class="photo">
					<input type="file" name="cafe_photo" >
				</div>
				
					<h4 class="studycafe_title2" style="margin-top: 50%;">  </h4>
				<div class="photo">
					<input type="file" name="cafe_photo2" style="margin-top: 42%;">
				</div>
				
				
					<h4 class="studycafe_title2" style="margin-top: 55%;">  </h4>
				<div class="photo">
					<input type="file" name="cafe_photo3" style="margin-top: 85%;">
				</div>

					<!--  업데이트폼에서는 제휴정보는 선택할수 없음. 첨음 등록할때 제휴카페는 결제를 해야하기 때문에 일반 카페에서 제휴 카페로 수정불가. 일반카페에서 제휴카페로 등록하고 싶으면 삭제후 다시 작성 -->

					<div>
						<button type="button" id="btnArea2"
							onclick="javascript:history.back();">취소</button>
						<button type="submit" id="btnArea1">수정</button>
					</div>

				</form>



			</div>
		</div>
		<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<!-- 검색 버튼 클릭 시 팝업 레이어 열리도록 -->
				<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>





	</div>





	<footer> </footer>
</body>
</html>