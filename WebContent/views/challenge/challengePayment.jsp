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
	margin-top:-140px;
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
	margin: 30px;
	float: right;
	font-size: 20px;
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

#table-1 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-top: -110px;
}

#table-2 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-top: 50px;
}

#sec-3 {
	width: 15%;
}

#sec-3 img {
	margin-left: 50px;
	margin-top: -14px;
	width: 50px;
	height: 50px;
}

#sec-4 {
	width: 85%;
	height: 20%;
	float: right;
	margin-top: -100px;
}

#sec-5 {
	width: 100%;
	height: 8%;
}


.pay-img {
	width: 50px;
	height: 50px;
	margin: 25px;
}

#sec-6 span {
	border: 1px solid #e0dddd;
	background-color: #e0dddd;
	border-radius: 7px;
	padding: 10px;
	padding-left: 20px;
	padding-right: 20px;
	position: absolute;
	margin-top: 25px;
	margin-left: 40px;
}

#challenge_btn {
	margin: 20px;
	margin-right: 400px;
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
			<section id="sec-3">
				<p>참가 비용</p>
				<br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
			</section>
			<section id="sec-4">
				<table id="table-2">
					<tr>
						<td><span>10,000 원 </span>* 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
					</tr>
				</table>
			</section>
			
			<hr color=#ff6064 width="970px">
			
			<section id="sec-3">
				<p>최종 결제</p>
				<br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
			</section>
			<section id="sec-4">
				<table id="table-2">
					<tr>
						<td><span>10,000 원 </span>* 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
					</tr>
				</table>
			</section>
			
			<section id="sec-3">
				<br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
			</section>
			<section id="sec-4">
				<table id="table-2">
					<tr>
						<td><span>10,000 원 </span>* 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
					</tr>
				</table>
			</section>
			
			
		</section>

		<section id="content-2">
			<!-- 결제 버튼 -->
			<button id="challenge_btn">
				<a href="#">결제하기</a>
			</button>
		</section>
	</section>

</body>
</html>