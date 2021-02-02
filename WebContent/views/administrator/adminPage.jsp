<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int board = Integer.parseInt(String.valueOf(request.getAttribute("boardCount")));
	int cafe = Integer.parseInt(String.valueOf(request.getAttribute("cafeCount")));
	int chall = Integer.parseInt(String.valueOf(request.getAttribute("challCount")));
	int notice = Integer.parseInt(String.valueOf(request.getAttribute("noticeCount")));
	int qna = Integer.parseInt(String.valueOf(request.getAttribute("qnaCount")));
	int report = Integer.parseInt(String.valueOf(request.getAttribute("reportCount")));
	int todayJoin = Integer.parseInt(String.valueOf(request.getAttribute("todayJoinCount")));
	int challStart = Integer.parseInt(String.valueOf(request.getAttribute("challStartCnt")));
	int challBefore = Integer.parseInt(String.valueOf(request.getAttribute("challBeforeCnt")));
	int challEndCnt = Integer.parseInt(String.valueOf(request.getAttribute("challEndCnt")));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button id="download" type="button" 
				onclick="location.href='<%= request.getContextPath() %>/administratorPage'">다운로드</button>
</body>
</html>