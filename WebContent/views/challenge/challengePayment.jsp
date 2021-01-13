<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* content 부분 */
#content-1 {
	margin-top:-40px;
	width: 100%;
	height: 85%;
}

#content-1 p {
	margin-left: 25px;
	margin-top: -1px;
	font-size: 25px;
	color: #ff6064;
	float: left;
}

#content-2 {
	margin-top:-120px;
	width: 100%;
	height: 15%;
}

#challenge_btn {
	font-family: "Do Hyeon";
	width: 170px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	float: right;
	font-size: 20px;
	margin-right: 340px;
}

#back_btn{
	font-family: "Do Hyeon";
	width: 170px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	float: left;
	font-size: 20px;
	margin-left: 300px;
}

#sec-1 {
	width: 15%;
	height: 20%;
}

#sec-1 img {
	margin-left: 50px;
	margin-top: -14px;
	width: 50px;
	height: 50px;
}

#sec-2 {
	width: 85%;
	float: right;
}

.sec-3 {
	width: 20%;
}

.sec-3 img {
	margin-left: 50px;
	margin-top: -14px;
	width: 50px;
	height: 50px;
}

.sec-4 {
	width: 85%;
	height: 20%;
	float: right;
	margin-top: -100px;
}

#table-1 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-top: -110px;
}

#table-2, #table-3, #table-4 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-top: 50px;
}


#pay_title{
	font-family: "Do Hyeon";
	font-size: 35px;
	margin-left:435px;
	margin-top:30px;
}

</style>
</head>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<p id="pay_title">결제정보</p>
		<section id="content-1">
			<br>
			<hr color=#ff6064 width="970px">
			<section id="sec-1">
				<p>페이백 정보</p>
				<br><img src="<%= request.getContextPath() %>/resources/images/offer.png">
			</section>
			<section id="sec-2">
				<table id="table-1">
					<tr>
						<td>100% 성공 : 전액 페이백 + 상금</td>
					</tr>
					<tr>
						<td>85% 이상 성공 : 전액 페이백</td>
					</tr>
					<tr>
						<td>85% 미만 성공 : 부분 페이백</td>
					</tr>
				</table>
			</section>
			<hr color=#ff6064 width="970px">
			<section class="sec-3">
				<p>참가 비용 정보</p>
				<br> <img src="<%= request.getContextPath()%>/resources/images/member.png">
			</section>
			<section class="sec-4">
				<table id="table-2">
					<tr>
						<td>참가 인원 총 금액  :<span> 40,000 원 </span></td>
					</tr>
				</table>
			</section>
			
			<section class="sec-3">
				<br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
			</section>
			<section class="sec-4">
				<table id="table-3">
					<tr>
						<td>참가비 :<span> 10,000 원 </span> * 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
					</tr>
				</table>
			</section>
			
			<hr color=#ff6064 width="970px">
			
			<section class="sec-3">
				<p>최종 결제</p>
				<br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
			</section>
			<section class="sec-4">
				<table id="table-4">
					<tr>
						<td>총 결제 금액 :<span> 10,000 원 </span></td>
					</tr>
				</table>
			</section>
			
		</section>

		<section id="content-2">
			<button id="back_btn">
				<a href="#">뒤로가기</a>
			</button>
			<!-- 결제 버튼 -->
			<button id="challenge_btn">
				<a href="#">결제하기</a>
			</button>
		</section>
	</section>

</body>
</html>