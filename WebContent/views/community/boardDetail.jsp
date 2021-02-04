<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
#btSection {
	padding-bottom: 100px;
}

/* 타이틀,라인 */
#con1_title h1 {
	text-align: center;
	margin-top: 25px;
}

.h1_title {
	margin-top: 50px;
	text-align: center;
	font-size: 24px;
	color: #757575;
}

.line {
	border: 0.5px solid #937cf790;
}

/* 게시물 부분 */
#board_div {
	width: 80%;
	margin: auto;
}

#board_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #75757552;
	margin: auto;
	text-align: justify;
}

#btitle {
	line-height: 50px;
	padding-left: 10px;
	color: #757575;
	font-size: 14px;
}

#bcreatedate {
	font-size: 12px;
	color: #757575;
	margin-left: 70%;
}

#bwriter {
	font-size: 12px;
	color: #757575;
	margin-left: 15px;
}

#board_con {
	width: 100%;
	/*  height:1150px; */
	border-bottom: 1px solid #75757552;
	margin: auto;
}

#board_con p {
	padding-left: 10px;
	font-size: 14px;
}

/* 뒤로가기 버튼 */
#back {
	width: 100px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	margin-left: 10%;
	margin-top: 20px;
	font-size: 10px;
}

#warning_btn {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	margin-left: 69%;
	margin-top: 20px;
	font-size: 10px;
}

.imgAreaInner {
	display: inline-block;
	text-align: center;
}

.addImg {
	width: 200px;
	height: 180px;
}
</style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
<!-- content -->
    <section id="btSection">

        <!-- 타이틀 -->
        <div id="con2_title">
            <h1 class="h1_title"></h1>
        </div>
        <div class="line"></div>
        
        <!-- 게시물 내용 -->
        <div id="board_div">
           <div id="board_title">
           <span id="btitle"><%=b.getbTitle()%></span>
           <span id="bcreatedate"><%=b.getCreateDate() %></span>
           <span id="bwriter">글쓴이 : <%= b.getNickName() %></span>
           </div>
           <div id="board_con"><p><%= (b.getbContent()).replace("\n", "<br>") %></p></div>
           
           <div id="imgAreaOuter">
           	<% for(int i = 0; i < fileList.size(); i++) { %>
           	<div class="imgAreaInner">
           	<img class="addImg"
					src="<%= request.getContextPath() %><%= fileList.get(i).getFilePath() %><%= fileList.get(i).getChangeName() %>">
           	</div>
           	<% } %>
           </div>
        </div>

		<!-- 신고 버튼 누르면 bId, 신고대상, "자유게시판" 넘기기 -->
		<form id="warningForm" method="post">
		<input type="hidden" name="no" value="<%= b.getbId() %>">
		<input type="hidden" name="reported_id" value="<%= b.getUserId() %>"> 
		<input type="hidden" name="category" value="자유게시판">  
		</form>
		
        <!-- 버튼 -->
        <button type="button" class="btn" id="back" onclick="javascript:history.back();" id="back">뒤로가기</button>
        <button class="btn" id="warning_btn">신고</button>
        
        <script>
        const warning_btn = document.getElementById('warning_btn');
    	warning_btn.addEventListener('click',function(){
    		$("#warningForm").attr("action", "<%= request.getContextPath()%>/report/insertForm");
    		$("#warningForm").submit();
    	});
        </script>
        
        </section>
        <%@ include file="../common/footer.jsp" %>
   
</body>
</html>