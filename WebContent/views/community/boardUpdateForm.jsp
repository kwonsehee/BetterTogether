<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="community.model.vo.*, java.util.ArrayList" %>
<%
	Board b = (Board)request.getAttribute("b");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");	

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
	width: 996px;
	height: 40px;
	border: 0px;
	border-bottom: 1px solid #75757552;
	background: none;
	color: #757575;
}

#write_option {
	width: 1000px;
	height: 40px;
	border-bottom: 1px solid #75757552;
}

#write_file {
	
}

textarea {
	width: 996px;
	height: 450px;
	border: 0px;
	resize: none;
	background: none;
	border-bottom: 1px solid #75757552;
}

.btn {
	width: 130px;
	height: 30px;
	margin: 10px;
	background: #ff60657e;
	border: 0px;
	border-radius: 55px;
	margin-top: 650px;
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
	width: 100px;
	font-family: "Do Hyeon";
	background: none;
	border: 2px solid #ff60657e;
}

#back a {
	font-size: 14px;
	color: #ff60657e;
}

#write_option label {
	display: inline-block;
	background: #ff60657e;
	border-radius: 55px;
	color: #fff;
	padding: 0px 15px;
	line-height: 30px;
	cursor: pointer;
	margin-top: 5px;
	margin-left: 5px;
	font-family: "Do Hyeon";
}

#write_option label:after {
	content: "파일등록";
}

#write_option .file-input {
	display: none;
}

#write_option .filename {
	display: inline-block;
	padding-left: 10px;
	font-size: 14px;
	color: #757575b7;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<section id="con1">
		<!-- 타이틀 -->
		<div id="con1_title">
			<h1 class="h1_title">글쓰기</h1>
		</div>
		<div class="line"></div>

		<!-- 글쓰기 박스 -->
		<form action="<%= request.getContextPath() %>/board/update" method="post">
			<input type="hidden" name="bId" value="<%=b.getbId()%>">
			<div id="writebox">
				<!-- 제목 입력-->
				<input type="text" id="write_title" name="title" maxlength="30"
					value="<%=b.getbTitle()%>" required>
				<!-- 파일 첨부, 이미지, 동영상 등 -->
				<div id="write_option">
					<label><input type="file" class="file-input"></label>
					<span class="filename">파일을 선택해주세요.</span>
				</div>
				<!-- 글 입력-->
				<textarea rows="5" name="content" style="resize: none;"><%=b.getbContent()%></textarea>
			</div>
			<script>
				$(document).on("change", ".file-input", function() {
					var filename = $(this).val();
					console.log(filename);
					if (filename == "")
						filename = "파일을 선택해주세요.";
					$(".filename").text(filename);
				})
			</script>

			<!-- 버튼 -->
			<button class="btn" id="back">
				<a href="<%=request.getContextPath()%>/board/myboardView">뒤로가기</a>
			</button>
			<button class="btn" id="updateBtn" type="submit"><a>수정 완료</a></button>
		</form>
		
		
		
</body>
</html>