<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("q"); 

%>
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
	top: 360px;
}

#writebox {
	position: absolute;
	width: 1000px;
	height: 500px;
	/* border: 1px solid black; */
	margin-top: 92px;
}

#write_title {
	width: 977px;
	height: 40px;
	border: 0px;
	border-bottom: 1px solid #75757552;
	background: none;
	color: #757575;
	padding-left: 2%;
}


textarea {
	width: 977px;
	height: 450px;
	border: 0px;
	resize: none;
	background: none;
	border-bottom: 1px solid #75757552;
	font-size: 20px;
	font-family: "Do Hyeon";
	color: #757575;
	padding-left: 2%;
	padding-top: 1%;
}

.btn {
	width: 130px;
	height: 30px;
	margin: 10px;
	background: #ff60657e;
	border: 0px;
	border-radius: 55px;
	margin-top: 650px;
	margin-left: 30px;
}

.btn a {
	color: white;
	font-family: "Do Hyeon";
	font-size: 16px;
}

#updateBtn {
	width: 60px;
	color: white;
	font-family: "Do Hyeon";
	margin-top: 20px;
	margin-left:800px;
}

#updateBtn a {
	font-size: 14px;
}

#back {
	width: 60px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}

#con{
height: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<section id="con" class="content_css">
		<form id="qna-form" action="<%= request.getContextPath() %>/qna/update" method="post">
			<input type="hidden" name="qnaNo" value="<%= q.getQnaNo() %>">

			<div id="con1_title">
				<h1 class="h1_title">질문 수정</h1>
			</div>
			
			<div class="line"></div>
			
			<div id="writebox">
				
			<input type="text" id="write_title" name="title" value="<%= q.getQnaTitle() %>">
			
			<textarea cols="50" name="content" rows="5" style="resize: none;"><%= q.getQnaContent() %></textarea>
					
			</div>

		
				<!-- 등록 버튼 , 나가기 버튼 -->
				<button type="button" id="back" class="btn" onclick="javascript:history.back();"><a>취소</a></button>
				<button type="submit" id="updateBtn" class="btn"><a>수정하기</a></button>
		</form>
	</section>
</body>
</html>