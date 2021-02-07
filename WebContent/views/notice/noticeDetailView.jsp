<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n=(Notice)request.getAttribute("notice");
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
	padding-right:10%;
}

/* 타이틀,라인 */
.h1_title {
	font-family: "Nanum Gothic";
	text-align: center;
	width: 100%;
	color: #757575;
	font-size: 24px;
} 

.line {
	border: 3px solid rgba(255, 96, 100, 0.7);
	width: 100%;
	margin: auto;
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
	width: 80%;
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

#nelement{
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
					<h1 id="title">공지사항</h1>
				</td>
			</tr>
			<tr>
				<td class="qnaTable" ><input maxlength="50" id="write_title" placeholder="<%= n.getaTitle() %>" readonly>
					<label id="nelement">작성자 : <%= n.getUser_id() %></label>
					<label id="nelement">작성일 : <%= n.getaDate() %></label>
				</td>
			</tr>
			<tr>
				<td class="qnaTable" id="contentBox"><textarea id="writeArea" rows="10" readonly><%= n.getaContent() %></textarea>
					<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= n.getaFile() %>"  style="width: 600px; height: 350px;">
				</td>
			</tr>
		</table>
		<div id="btnArea">
			<button type="button" id="listBtn" class="qnaBtn">목록으로</button>
			<!--관리자 멤버타입은 3임!!!!!!! -->
			<% if (loginUser != null && loginUser.getMembertype() == 0) { %>
			<button type="button" id="updateBtn" class="qnaBtn">수정하기</button>
			<button type="button" id="deleteBtn" class="qnaBtn">삭제하기</button>

			<!-- form 태그를 POST 방식으로 제출
			nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
			<form id="nnoForm" method="post">
				<input type="hidden" name="ano" value="<%=n.getaNo()%>">
			</form>
			<script>
					//수정하기 버튼 이벤트
					const updateBtn = document.getElementById('updateBtn');
					updateBtn.addEventListener('click',function(){
						$("#nnoForm").attr("action","<%=request.getContextPath()%>/notice/updateForm");
						$("#nnoForm").submit();
					});
					
					//삭제하기 버튼 이벤트
					//*******삭제하기 위해서는 article_type 추가 필요함!!!!!!!!
					const deleteBtn = document.getElementById('deleteBtn');
					deleteBtn.addEventListener('click',function(){
						$("#nnoForm").attr("action","<%=request.getContextPath()%>/notice/deleteForm");
						$("#nnoForm").submit();
					});
					
					</script>
			<% } %>
		</div>


	</section>
	<script>
		//목록으로 버튼 이벤트
		const listBtn = document.getElementById('listBtn');
		listBtn.addEventListener('click', function() {
			location.href = '<%=request.getContextPath()%>/notice/list';
	});
	</script>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>