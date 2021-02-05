<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

 

#modal_opne_btn {
	 
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

			<form action="<%=request.getContextPath()%>/cafe/insert"
				method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="col-sm-3"></div>

						<div class="col-sm-6">
							<h2>better together 스터디등록</h2>
							<form>
								<table class="table table-boardered">
									<tr>
										<th>카페이름</th>
										<td><input type="text" class="form-control" name="cafe_name" required
											placeholder="카페명은 최대8글자입니다"  maxlength="8"></td>
									</tr>
									<tr>
										<th>운영시간</th>
										<td><input type="text" class="form-control" name="cafe_oh" required
											placeholder="ex)9:30-21:30"></td>
									</tr>

									<tr>
										<th>지역</th>
										<td><select id="area5" name="cafe_area"
											style="width: 102px; float: left;">
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
										<td><input type="text" name="cafe_phone" required class="form-control" ></td>
									</tr>

									<tr>
										<th>휴무일</th>
										<td><input type="text" placeholder="ex)매주화요일"
											name="closed_day" class="form-control"></td>
									</tr>
									<tr>
										<th>예약가능인원</th>
										<td><input class="form-control" type="text" required
											name="cafe_capacity" placeholder="최대12명 ex)6명"></td>
									</tr>
									<tr>
										<th>카페홈페이지</th>
										<td><input   class="form-control" type="text" name="cafe_page"  placeholder="도메인주소 ex)www.naver.com"  required></td>
									</tr>

									<tr>
										<th>도로명주소</th>
										<td><input type="text" class="postcodify_address"
											readonly name="cafe_map" style="width: 308px;height: 26px;float: left;">
											<button id="postcodify_search_button" type="button"  style=" float: left;"  >검색</button></td>
									</tr>
 
									<tr>
										<th>상세주소</th>
										<td><input   class="form-control" type="text"  name="detail_address" required></td>
									</tr>




									<tr>
										<th>대표이미지</th>
										<td><input type="file" name="cafe_photo"></td>
									</tr>
									
									<tr>
										
										<th>추가이미지</th>
										<td><input type="file" name="cafe_photo2"><input type="file" name="cafe_photo3"></td>
									</tr>
									
									 


									<tr>
										<th>카페소개글</th>
										<td><textarea rows="5" cols="40" name="cafe_info"
												class="form-control">ex)안녕하세요 저희카페 오신걸환영합니다
저희카페에서는 다양한음료와 스낵들이 준비되어있습니다. 
저희카페에서 무료와이파이와 검색을 하실수있는
노트북이 구비되어있습니다.</textarea></td>
									</tr>

									<tr>
										<th>카페공지글</th>
										<td><textarea rows="5" cols="40" name="cafe_notice"
												class="form-control">ex)1.취식물 반입금지(엔터를 처서 입력하세요)
2.반려동물 출입금지
3.5인이상 예약불가
4.마스크 꼭 쓰고있기</textarea></td>
									</tr>

									<tr>
										<th>제휴정보</th>
										<td><select  name="AFFILIATED_CAFE" style="float: left;height: 29px;" >
												<option value="N">일반</option>
												<option value="Y">제휴</option>
										</select>	<input type="button"  value="제휴약관"  id="modal_opne_btn" style="float: left;height: 30px;width: 89px;"> </td>
									</tr>



									<tr>
										<td colspan="2">
											<button type="button" id="btnArea2"
												onclick="javascript:history.back();">취소</button>


											<button id="btnArea1">등록</button>
											
										</td>
									</tr>



								</table>
								
							</form>
						</div>

					</div>
				 <script>
				
						$(document).ready(function() {
						 
							$('#btnArea1').click(function() {

								if( $('select[name=AFFILIATED_CAFE]').val() == 'Y'){
									if(confirm("제휴등록은 결제가필요합니다.약관에 동의하시고 결제하시겠습니까? ")){ 
									}else{
										return false;
										
									}
								}
							});

						});
					</script>




					<!-- 제휴정보 팝업 -->
					<div id="root">
					
					</div>
					<div id="modal">
						<div class="modal_content"
							style="margin-left: 500px;height: 444px;">



							<h4 style="text-align: center; color: #937cf790">BetterTogether제휴
								약관</h4>


							<ul class="join_box"
								style="padding-left: 5px; padding-right: 5px;">
								<pre style="height:271px; white-space:pre-wrap;"> 
여러분을 환영합니다. BetterTogether서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서감사합니다. 본 약관은 다양한 BetterTogether서비스의 이용과 관련하여 Bett
erTogether에서제공하고 이용하는 서비스회원(이하 ‘회원’)의 결제 정보를 알려주면서, 아울러 여러분의 제휴 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
결제는 한번으로 이루어지며 한번의 결제로 무제한 등록이가능합니다.결제 비용은 등록시최초로 3만원이 결제되면 환불은 불가능합니다.
									
BetterTogether 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서
감사합니다. 본 약관은 다양한 BetterTogether 서비스의 이용과 관련하여 BetterTogether에서
제공하고 이용하는 서비스 회원(이하 ‘회원’) 의 결제 정보를 알려주면서, 아울러 여러분의 제휴 서비스 이용에
도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 결제는 한번으로 이루어지며 한번의 결제로 무제한 등록이
가능합니다.결제 비용은 등록시 최초로 3만원이 결제되면 환불은 불가능합니다.
									
BetterTogether 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서
감사합니다. 본 약관은 다양한 BetterTogether 서비스의 이용과 관련하여 BetterTogether에서
제공하고 이용하는 서비스 회원(이하 ‘회원’) 의 결제 정보를 알려주면서, 아울러 여러분의 제휴 서비스 이용에
도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 결제는 한번으로 이루어지며 한번의 결제로 무제한 등록이
가능합니다.결제 비용은 등록시 최초로 3만원이 결제되면 환불은 불가능합니다.							 
									 </pre>

							</ul>

							<ul class="clearfix" style="padding-left: 5px;">
								<h4>제휴 등록시 최초 1회 결제가 필요합니다.</h4>
							</ul>


							<button type="button" id="modal_close_btn"
								style="margin-left: 115px; margin-top: 0px;">확인</button>
						</div>
						<div class="modal_layer"></div>
					</div>



					<script>
						document.getElementById("modal_opne_btn").onclick = function() {
							document.getElementById("modal").style.display = "block";
						}

						document.getElementById("modal_close_btn").onclick = function() {
							document.getElementById("modal").style.display = "none";
						}
					</script>
						<!-- 제휴정보 팝업 -->




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