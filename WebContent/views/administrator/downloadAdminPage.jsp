<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	response.setHeader("Content-Type", "application/vnd.ms-xls");
	response.setHeader("Content-Disposition", "inline; filename=adminPage.xls");

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
<style>
	table, th, td {
    	border: 1px solid #bcbcbc;
    	text-aling:center;
  }
  	table {
    	width: 50px;
  }
  
</style>
</head>
<body>
	<table>
		<caption>관리자 페이지</caption>
		<tr>
			<th>카테고리</th>
			<th>오늘 등록 된 게시물</th>
		</tr>
		<tr>
			<td>질문</td>
			<td><%= qna %></td>
		</tr>
		<tr>
			<td>신고</td>
			<td><%= report %></td>
		</tr>
		<tr>
			<td>카페</td>
			<td><%= cafe %></td>
		</tr>
		<tr>
			<td>챌린지</td>
			<td><%= chall %></td>
		</tr>
		<tr>
			<td>자유게시판</td>
			<td><%= board %></td>
		</tr>
	</table>
</body>
</html>