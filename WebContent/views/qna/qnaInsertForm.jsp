<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/qnaStyle.css'>--%>
<style>
body {
	width: 1000px;
	height: 1100px;
}
/* 연분홍 배경 */
#con1 {
	width: 1000px;
	height: 704px;
	background: #F9F1F1;
	border-radius: 20px;
	margin: auto;
	margin-top: 15px;
}

#con1_title h1 {
	position: absolute;
	width: 1000px;
	text-align: center;
	margin-top: 25px;
}

#title {

	text-align: center;
	font-family: "Do Hyeon";
	font-size: 24px;
	color: #757575;
}

.line {
	border: 3px solid rgba(255, 96, 100, 0.7);
	position: absolute;
	width: 990px;
}

.qnaTable {
	border-top: 3px solid rgba(255, 96, 100, 0.7);
	width: 990px;
}

#writebox {
	position: absolute;
	width: 1000px;
	height: 500px;
}

#write_title {
	width: 996px;
	height: 40px;
	border: 0px;
	background: none;
}

#writeArea {
	width: 996px;
	height: 450px;
	border: 0px;
	resize: none;
	background: none;
	font-family: "Do Hyeon";
	font-size: 20px;
	
}


.btn {
	width: 130px;
	height: 30px;
	margin: 10px;
	background: #ff60657e;
	border: 0px;
	border-radius: 55px;
	float: right;
}

.btn a {
	color: white;
	font-family: "Do Hyeon";
	font-size: 16px;
}

#submit {
	width: 55px;
	color: white;
	font-family: "Do Hyeon";
	margin-top: 20px;
	margin-left: 80%;
}

#submit a {
	font-size: 14px;
}

#back {
	width: 100px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<form action="<%= request.getContextPath() %>/qna/insert" method="POST"
		id="QnA-form">
		<section id="con1">
			<table id="writebox">
				<tr>
					<td>
						<h1 id="title">Q & A</h1>
					</td>
				</tr>
				<tr>
					<td class="qnaTable"><input type="text" maxlength="50" name="title" id="write_title" placeholder="제목을 입력해주세요."></td>
				</tr>
				<tr >
					<td class="qnaTable"><textarea cols="50" id="writeArea" rows="15"
							name="content" placeholder="내용을 입력해주세요."></textarea></td>
				</tr>
			</table>
		</section>

		<!-- 등록 버튼 , 나가기 버튼 -->
		<div>
		<button type="button" class="btn" id="backBtn">
			<a>뒤로가기</a>
		</button>
		<button type="submit" class="btn">
			<a>등록하기</a>
		</button>

		<script>
		// 뒤로가기
		const backBtn = document.getElementById('backBtn');
		backBtn.addEventListener('click',function(){
			location.href='<%=request.getContextPath()%>/qna/list';
		});
		</script>
		</div>
	</form>
</body>
</html>