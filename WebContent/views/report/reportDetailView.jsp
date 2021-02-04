<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="report.model.vo.Report"%>
<%
	Report r = (Report)request.getAttribute("r");
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
}

#btnArea {
	padding:10%;
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

#reported{
	color : red;
    margin-top : 10%;
    font-size : 35px;
    font-family: "Nanum Gothic";
    text-align : center;
    padding-top:5%;
    padding-bottom:5%;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<!-- content -->
	<section id="btSection" class="btSection">

		<table id="qnaBox">
		<!-- 타이틀 -->
		<tr>
			<td>
				<h1 class="h1_title">신 고</h1>
			</td>
		</tr>

		<!-- 게시물 내용 -->
			<tr>
				<td class="qnaTable"><input maxlength="50" id="write_title" placeholder="<%= r.getReport_title() %>" readonly></td>
			</tr>
			<tr>
				<td class="qnaTable" id="contentBox"><textarea cols="50" id="writeArea" rows="10" readonly><%= r.getReport_content() %></textarea></td>
			</tr>
			<tr>
				<td id="report_Img">
					<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= r.getReport_file() %>"  style="width: 700px;height: 700px;">
				</td>
			</tr>
			<%if(r.getT_f().equals("T")) { %>
				<tr>
					<td id="reported">
						<a>신고가 정상 처리 되었습니다.</a>
					</td>
				</tr>
			<%} %>
		</table>
		<div id="btnArea">	
	<%if(loginUser.getUserId().equals(r.getUser_id())) { %>
	<button type="button" id="deleteBtn" class="qnaBtn">삭제하기</button>
	<button type="button" id="listBtn" class="qnaBtn">목록으로</button>
	
	<script>				
			//삭제하기 버튼 이벤트
			const deleteBtn = document.getElementById('deleteBtn');
			deleteBtn.addEventListener('click',function(){
				$("#reportForm").attr("action","<%=request.getContextPath()%>/report/delete");
				$("#reportForm").submit();
			});
	</script>		
	<% } %>
	
	<%if(loginUser.getMembertype() == 0 && r.getT_f().equals("F")) { %>
	<!-- 신고철회버튼 누르면 신고삭제되게 해버리기 -->
	<button type="button" id="cancleBtn" class="qnaBtn">신고철회</button>
	<button type="button" id="report_btn" class="qnaBtn">신고처리</button>
	</div>
	</section>
	
	<!-- 버튼 -->
	<!-- form 태그를 POST 방식으로 제출 nno를 화면에 드러내지 않고 form을 submit하면서 넘길 수 있음 -->
	<form id="reportForm" method="post">
		<input type="hidden" name="rNo" value="<%= r.getReport_no() %>">
		<input type="hidden" name="list" value="list">
	</form>
	
	
		<script>
		//신고 철회 버튼 이벤트
		const cancleBtn = document.getElementById('cancleBtn');
		cancleBtn.addEventListener('click',function(){
			$("#reportForm").attr("action","<%=request.getContextPath()%>/report/delete");
			$("#reportForm").submit();
		});

		//신고처리 이벤트
		const report_btn = document.getElementById('report_btn');
		report_btn.addEventListener('click',function(){
			$("#reportForm").attr("action","<%=request.getContextPath()%>/report/processing");
			$("#reportForm").submit();
		});
		</script>	
	<%} %>

	
	<script>		
			//목록으로 버튼 이벤트
			const listBtn = document.getElementById('listBtn');
			listBtn.addEventListener('click',function(){
				location.href='<%=request.getContextPath()%>/report/list';
				});
	</script>
	

	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>