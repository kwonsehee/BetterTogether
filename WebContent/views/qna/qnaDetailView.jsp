<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 뒤로가기 버튼 */
.btn {
	width: 120px;
	font-family: "Do Hyeon";
	height: 30px;
	margin: 5px;
	background: #ff60657e;
	border: none;
	border-radius: 55px;
	color: white;
	font-size: 20px;
	float: right;
	
}

/* 타이틀,라인 */
#con1_title h1 {
	position: absolute;
	width: 1000px;
	text-align: center;
	margin-top: 25px;
}

h1 {
	font-size: 30px;
	text-align: center;
	margin-top: 50px;
}

.line {
	background: rgba(255, 96, 100, 0.7);
	border: 3px solid rgba(255, 96, 100, 0.7);
}

/* 게시물 부분 */
#board_div {
	width: 100%;
	height: 700px;
	margin: auto;
	background: #ff60657e;
}

#board_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #75757552;
	margin: auto;
	text-align: justify;
}

#board_title span {
	font-size: 20px;
	line-height: 50px;
	padding-left: 10px;
	color: #757575;
}

#board_con {
	width: 100%;
	height: 1150px;
	border-bottom: 1px solid #75757552;
	margin: auto;
}

#board_con span {
	padding-left: 10px;
	font-size: 14px;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<section id="con1">


		<!-- 타이틀 -->
		<div id="con2_title">
			<h1>공지사항</h1>
		</div>
		<div class="line"></div>

		<!-- 게시물 내용 -->
		<div id="board_div">
			<div id="board_title">
				<span><%=q.getQnaTitle()%></span>
			</div>
			<div id="board_con">
				<span><%=q.getQnaContent()%></span>
			</div>
		</div>
	
		<!-- 버튼 -->
	</section>
		<div id="btnArea"></div>
			<button type="button" id="deleteBtn" class="btn">삭제하기</button>
			<button type="button" id="updateBtn" class="btn">수정하기</button>
			<button type="button" id="listBtn" class="btn">목록으로</button>
					<!-- form 태그를 POST 방식으로 제출
					nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
					<form id="qnaNoForm" method="post">
					<input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
					</form>
					<script>
					//수정하기 버튼 이벤트
					const updateBtn = document.getElementById('updateBtn');
					updateBtn.addEventListener('click',function(){
						$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/updateForm");
						$("#qnaNoForm").submit();
					});
					
					//삭제하기 버튼 이벤트
					const deleteBtn = document.getElementById('deleteBtn');
					deleteBtn.addEventListener('click',function(){
						$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/delete");
						$("#qnaNoForm").submit();
					});
				</script>
			</div>
	<script>
	//목록으로 버튼 이벤트
	const listBtn = document.getElementById('listBtn');
	listBtn.addEventListener('click',function(){
		location.href='<%=request.getContextPath()%>/qna/list';
		});
	</script>
</body>
</html>