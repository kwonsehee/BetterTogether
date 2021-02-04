<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	request.setCharacterEncoding("UTF-8");

	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
	String content = (String)request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Answer Form</title>
<style>

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

#writebox {
	width: 80%;
}

#write_title {
	width: 100%;
	border: 0px;
	resize: none;
	background: none;
	font-size: 20px;
	font-family: "Nanum Gothic";
	padding-left: 2%;
	color: #757575;
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

.Btn1 {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	float: right;
	margin-bottom: 2%;
}

#btnArea {
	padding-right:10%;
}

.btSection #writebox {
	margin: auto;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>
	<form action="<%= request.getContextPath() %>/qna/answer" method="POST"
		id="QnA-form">
		<input type="hidden" name="qnaNo" value="<%= qnaNo %>">
		<section id="btSection" class="btSection">
			<table id="writebox">
				<tr>
					<td>
						<h1 id="title">Answer</h1>
					</td> 
				</tr>
				<tr>
					<td class="qnaTable"><textarea cols="50" rows="6" name="title" id="write_title" readonly> <%= content %></textarea></td>
				</tr>
				<tr >
					<td class="qnaTable"><textarea cols="50" id="writeArea" rows="15"
							name="content" placeholder="내용을 입력해주세요."></textarea></td>
				</tr>
			</table>
			<!-- 등록 버튼 , 나가기 버튼 -->
			<div id="btnArea">
				<button type="button" class="Btn1" onclick="javascript:history.back();">뒤로가기</button>
				<button type="submit" class="Btn1">등록하기</button>
			</div>
		</section>

	</form>
	
		<%@ include file="../common/footer.jsp" %>
</body>
</html>