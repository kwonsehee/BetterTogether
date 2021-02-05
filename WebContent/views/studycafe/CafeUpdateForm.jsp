<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList , studycafe.model.vo.*" %>

<%
	Cafe c = (Cafe)request.getAttribute("Cafe"); 
 
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title></title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>

.btSection{
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
}

#modal_opne_btn {
	position: absolute;
	left: 61.41%;
	right: 33.18%;
	top: 86.35%;
	bottom: 9.91%;
	font-family: "Nanum Gothic";
	background: #fff;
	border: 2px solid #937cf790;
	height: 33px;
	width: 62px;
	margin-top: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 0px;
	padding-top: 0px;
	padding-right: 0px;
	width: 62px;
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
	margin-left: calc(85% - 100px - 100px);
	margin-top: 5%;
	border-radius: 20px;
}

#modal .modal_content {
	width: 319px;
	height: 347px;
	margin-top: -190px;
	margin-left: -250px;
	background: #fff;
	border: 2px solid #666;
	border-radius: 5px;
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

#btnArea1 {
	width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: white;
	font-size: 10px;
	font-weight: bolder;
}
#btnArea2 {
	width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: white;
	font-size: 10px;
	font-weight: bolder;
}
</style>


</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>


	 <section id="btSection" class="btSection"> 
		<div class="container">

			<form action="<%=request.getContextPath()%>/cafe/update"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="Cafe_code"
					value="<%=c.getCafe_code()%>"> <input type="hidden"
					name="Cafe_code" value="<%=c.getCafe_code()%>">
				<%
					if (c.getCafe_photo() != null) {
				%>
				<input type="hidden" name="Cafe_photo"
					value="<%=c.getCafe_photo()%>">

				<%
					}
				%>

				<%
					if (c.getCafe_photo2() != null) {
				%>
				<input type="hidden" name="Cafe_photo2"
					value="<%=c.getCafe_photo2()%>">
				<%
					}
				%>
				<%
					if (c.getCafe_photo3() != null) {
				%>
				<input type="hidden" name="Cafe_photo3"
					value="<%=c.getCafe_photo3()%>">
				<%
					}
				%>
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="col-sm-3"></div>

						<div class="col-sm-6">
							<h2>better together 스터디수정</h2>
							<form >
								<table class="table table-boardered">
									<tr>
										<th>카페이름</th>
										<td><input type="text" class="form-control"
											name="cafe_name" required placeholder="최대8글자입니다"
											value="<%= c.getCafe_name()%>"></td>
									</tr>
									<tr>
										<th>운영시간</th>
										<td><input type="text" class="form-control"
											name="cafe_oh" required placeholder="ex)9:30-21:30"
											value="<%= c.getCafe_oh() %>"></td>
									</tr>

									<tr>
										<th>지역</th>
										<td><select id="area5" name="cafe_area"
											style="width: 102px; float: left;">
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
										</select></td>
									</tr>

									<tr>
										<th>전화번호</th>
										<td><input type="text" name="cafe_phone" required
											class="form-control" value="<%=c.getCafe_phone()%>"></td>
									</tr>

									<tr>
										<th>휴무일</th>
										<td><input type="text" placeholder="ex)매주화요일"
											name="closed_day" class="form-control"
											value="<%=c.getClosed_day()%>"></td>
									</tr>
									<tr>
										<th>예약가능인원</th>
										<td><input class="form-control" type="text" required
											name="cafe_capacity" placeholder="최대12명 ex)6명"
											value="<%=c.getCafe_capacity()%>"></td>
									</tr>
									<tr>
										<th>카페홈페이지</th>
										<td><input class="form-control" type="text"
											name="cafe_page" placeholder="도메인주소 ex)www.naver.com"
											required value="<%=c.getCafe_page()%>"></td>
									</tr>

									<tr>
										<th>도로명주소</th>
										<td><input type="text" class="postcodify_address"
											readonly name="cafe_map"
											style="width: 308px; height: 26px; float: left;" value="<%=c.getCafe_map()%>">
											<button id="postcodify_search_button" type="button"
												style="float: left;">검색</button></td>
									</tr>

									<tr>
										<th>상세주소</th>
										<td><input class="form-control" type="text"
											name="detail_address" required
											value="<%=c.getDetail_address()%>"></td>
									</tr>




									<tr>
										<th>대표이미지</th>
										<td><input type="file" name="cafe_photo">기존파일:<%= c.getCafe_photo() %></td>
									</tr>

									<tr>

										<th>추가이미지</th>
										<td><input type="file" name="cafe_photo2">기존파일:<%= c.getCafe_photo2() %><input
											type="file" name="cafe_photo3">기존파일:<%= c.getCafe_photo3() %></td>
									</tr>




									<tr>
										<th>카페소개글</th>
										<td><textarea rows="5" cols="40" name="cafe_info"
												class="form-control"><%= c.getCafe_info() %></textarea></td>
									</tr>

									<tr>
										<th>카페공지글</th>
										<td><textarea rows="5" cols="40" name="cafe_notice"
												class="form-control"><%= c.getCafe_notice() %> </textarea></td>
									</tr>

									 



									<tr>
										<td colspan="2">
											<button type="button" id="btnArea2"
												onclick="javascript:history.back();">취소</button>


											<button id="btnArea1">수정</button>

										</td>
									</tr>



								</table>
							</form>
						</div>

					</div>










				</div>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<!-- 검색 버튼 클릭 시 팝업 레이어 열리도록 -->
				<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

			</form>
		</div>
	</section>


	 	<%@ include file="../common/footer.jsp" %>
</body>
</html>