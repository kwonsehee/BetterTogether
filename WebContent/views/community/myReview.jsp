<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
body {
	width: 1000px;
	height: 1100px;
}

#con1 {
	width: 1000px;
	height: 704px;
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
	top: 420px;
}

/* 후기 목록 */
.reviewdiv_1 {
	width: 90%;
	height: 70px;
	background: #fff;
	margin: auto;
	margin-top: 110px;
}

.reviewdiv {
	width: 90%;
	height: 70px;
	background: #fff;
	margin: auto;
	margin-top: 20px;
}

.btnwrap {
	width: 120px;
	height: 20px;
	margin-left: 84.5%;
	margin-top: 5px;
}

.btn2 {
	width: 50px;
	height: 20px;
	background: none;
	text-align: center;
	border: 2px solid #ff60657e;
	border-radius: 55px;
	font-family: "Do Hyeon";
	font-size: 12px;
}

.btn2 a {
	color: #757575;
	font-size: 12px;
}

#back {
	width: 100px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
	margin-left: 85%;
	margin-top: 150px;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<!-- 후기 -->
	<section id="con1">
		<!-- 세부 카테고리 버튼 -->
		<div id="btnwrap">
			<button class="btn">
				<a href="boardmain.html">자유게시판</a>
			</button>
			<button class="btn">
				<a href="reviewmain.html">후기</a>
			</button>
		</div>

		<!-- 타이틀 -->
		<div id="con1_title">
			<h1 class="h1_title">내가 쓴 후기</h1>
		</div>

		<div class="line"></div>

		<!-- 후기 목록 -->
		<div class="reviewdiv_1"></div>
		<div class="btnwrap">
			<button class="btn2">
				<a href="myReviewUpdate.html">수정</a>
			</button>
			<button class="btn2">
				<a>삭제</a>
			</button>
		</div>

		<div class="reviewdiv"></div>
		<div class="btnwrap">
			<button class="btn2">
				<a href="myReviewUpdate.html">수정</a>
			</button>
			<button class="btn2">
				<a>삭제</a>
			</button>
		</div>
		<div class="reviewdiv"></div>
		<div class="btnwrap">
			<button class="btn2">
				<a href="myReviewUpdate.html">수정</a>
			</button>
			<button class="btn2">
				<a>삭제</a>
			</button>
		</div>

		<button class="btn" id="back">
			<a href='<%= request.getContextPath()%>/views/community/reviewMain.jsp'>뒤로가기</a>
		</button>
	</section>

</body>
</html>