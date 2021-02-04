<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA f = (QnA)request.getAttribute("f");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>

.title {
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
	font-family: "Nanum Gothic";
	width: 100%; 
	height: 40px;
	border: 0px;
	background: none;
	padding-left: 2%;
	color: #757575;
}

#contentBox {
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
		<form id="qna-form" action="<%=request.getContextPath()%>/faq/update" method="post">
	<section id="btSection" class="btSection">
			<input type="hidden" name="qnaNo" value="<%=f.getQnaNo()%>">
		
		<table id="writebox">
			<tr>
				<td>
					<h1 class="title">FAQ Update</h1>
				</td>
			</tr>
			<tr>
				<td class="qnaTable"><input type="text" id="write_title"
					name="title" value="<%= f.getQnaTitle() %>" readonly></td>
			</tr>
			<tr>
				<td class="qnaTable"><textarea cols="50" id="contentBox"
						name="content" rows="15"><%=f.getQnaContent()%></textarea></td>
			</tr>


		</table>
		<div id="btnArea">
			<!-- 등록 버튼 , 나가기 버튼 -->
			<button type="button" class="Btn1"
				onclick="javascript:history.back();">취소</button>
			<button type="submit" id="updateBtn" class="Btn1">수정하기</button>
		</div>
	</section>
	</form>
</body>
</html>