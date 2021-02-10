<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA q = (QnA)request.getAttribute("q");
	QnA a=null;
	if((QnA)request.getAttribute("a")!=null){
		a = (QnA)request.getAttribute("a");		
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
/* 버튼  */
.qnaBtn {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	float: right;
	margin-bottom: 2%;
	margin-top:2%;
	margin-left: 1%;
}

#btnArea {
 margin-right:5%;
}

/* 타이틀,라인 */
.h1_title {
	text-align: center;
	width: 100%;
} 

.line {
	border: 3px solid rgba(255, 96, 100, 0.7);
}

.aline {
	border: 1px solid gray;
	background: gray;
}

#title {
	text-align: center;
	font-family: "Nanum Gothic";
	font-size: 24px;
	color: #757575;
}

.qnaTable {
	border-top: 3px solid #937cf790;
	width: 100%;
	display: inline-flex;
}

#qnaBox {
	width: 90%;
}

#write_title {
	font-family: "Nanum Gothic";
	width: 100%;
	height: 40px;
	border: 0px;
	background: none;
	padding-left: 2%;
}

#writeArea {
	width: 100%;
	border: 0px;
	resize: none;
	background: none;
	font-size: 20px;
	font-family: "Nanum Gothic";
	padding-left: 2%;
	color: #757575;
}

#contentBox{
	border-bottom: 3px solid #937cf790;
}

.btSection #qnaBox {
	margin: auto;
}

#qelement{
    width: 18%;
    text-align: end;
    margin-right: 2%;
    margin-top: 1%;
    font-family: "Nanum Gothic";
    color : #757575;
    font-weight: bold;
}

</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	
	<!-- content -->
	<section id="btSection" class="btSection">
		<table id="qnaBox">
			<tr>
				<td>
					<h1 id="title">Question</h1>
				</td>
			</tr>
			<tr>
				<td class="qnaTable" ><input maxlength="50" id="write_title" placeholder="<%=q.getQnaTitle()%>" readonly>
				<label id="qelement">작성자 : <%= q.getUserId() %></label>
				<label id="qelement">작성일 : <%= q.getQnaDate() %></label>
				</td>
			</tr>
			<tr>
				<td class="qnaTable" id="contentBox"><textarea cols="50" id="writeArea" rows="10" readonly><%=q.getQnaContent()%></textarea></td>
			</tr>
			
			<!-- 답변내용 -->
			<% if (a != null) { %>
			<tr>
				<td>
					<h1 id="title">Answer</h1>
				</td>
			</tr>
			<tr>
				<td class="qnaTable" id="contentBox"><textarea cols="50" id="writeArea" rows="10" readonly><%=a.getQnaContent()%></textarea></td>
			</tr>
			<% } %>
		</table>
			<div id="btnArea">
				<!-- 버튼 -->
				<% if (loginUser.getMembertype() != 0 && loginUser.getNickName().equals(q.getUserId())) { %>
					<button type="button" id="deleteBtn" class="qnaBtn">삭제하기</button>
					<button type="button" id="updateBtn" class="qnaBtn">수정하기</button>
					<button type="button" id="listBtn" class="qnaBtn">목록으로</button>
				<% } else if (loginUser.getMembertype() == 0) { %>
					<% if (a == null) { %>
						<button type="button" id="listBtn" class="qnaBtn">목록으로</button>
						<button type="button" id="deleteBtn" class="qnaBtn">삭제하기</button>
						<button type="button" id="answerBtn" class="qnaBtn">답변하기</button>
					<% } else {%>
						<button type="button" id="listBtn" class="qnaBtn">목록으로</button>
						<button type="button" id="deleteBtn" class="qnaBtn">삭제하기</button>
						<button type="button" id="ansUpdateBtn" class="qnaBtn">수정하기</button>
					<% } %>
				<% } %>
					<form id="qnaNoForm" method="post">
					<input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
					<input type="hidden" name="content" value="<%= q.getQnaContent() %>">
					</form>
					
			</div>
			
			<script>
			//수정하기 버튼 이벤트
			const updateBtn = document.getElementById('updateBtn');
			updateBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/updateForm");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>		
			const deleteBtn = document.getElementById('deleteBtn');
			deleteBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/delete");
				$("#qnaNoForm").submit();
			});
			//삭제하기 버튼 이벤트
			</script>
			<script>
			//답변 수정 이벤트
			const ansUpdateBtn = document.getElementById('ansUpdateBtn');
			ansUpdateBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/qna/ansUpdateForm");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>
			//답변 버튼 이벤트
			const answerBtn = document.getElementById('answerBtn');
			answerBtn.addEventListener('click',function(){
				$("#qnaNoForm").attr("action","<%=request.getContextPath()%>/views/qna/answerForm.jsp");
				$("#qnaNoForm").submit();
			});
			</script>
			<script>
			//목록으로 버튼 이벤트
			const listBtn = document.getElementById('listBtn');
			listBtn.addEventListener('click',function(){
				location.href='<%=request.getContextPath()%>/qna/list';
				});
			</script>
	</section>

			<%@ include file="../common/footer.jsp" %>
			
</body>
</html>