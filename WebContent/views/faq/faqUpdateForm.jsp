<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="qna.model.vo.QnA"%>
<%
	QnA f = (QnA)request.getAttribute("f");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
	<section id="content" class="content_css">
		<form id="qna-form" action="<%= request.getContextPath() %>/faq/update" method="post">
			<input type="hidden" name="qnaNo" value="<%= f.getQnaNo() %>">

			<section id="title">
				<p>질문 수정</p>
			</section>
			<section id="content-1">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="<%= f.getQnaTitle() %>"></td>
					</tr>
					<tr>
						<th rowspan="5">내용</th>
						<td><textarea cols="50" name="content" rows="15"><%= f.getQnaContent() %></textarea></td>
					</tr>
				</table>
			</section>

			<section id="content-2">
				<!-- 등록 버튼 , 나가기 버튼 -->
				<button type="button" id="back_btn" class="btn" onclick="javascript:history.back();">취소</button>
				<button type="submit" class="btn">수정하기</button>
			</section>
		</form>
	</section>
</body>
</html>