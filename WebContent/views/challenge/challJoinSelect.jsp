<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, challenge.model.vo.*, common.model.vo.*"%>
<%
	ArrayList<ChallengeStatus> list = (ArrayList<ChallengeStatus>)request.getAttribute("pplList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#challJoin_title{
	width: 100%;
	height: 10%;
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
	color: #252525b6
}

.line{
	border: 0.5px solid #937cf790;
}

#join_Id{
	color: #252525b6;
	text-weight:bolder;
	
}

#user_img{
	width:20px;
	height:20px;
}


</style>
</head>
<body>

<p id="challJoin_title">참여중인 전체 회원 리스트</p>
<div class="line"></div>

<table>
<%for(ChallengeStatus cs : list) { %>
<tr id="join_tr">
	<td>
		<img src="<%=request.getContextPath()%>/resources/images/userId.png" id="user_img">
		<span id="join_Id"><%=cs.getUserId() %></span>
	</td>
</tr>		
<% } %>
</table>

</body>
</html>