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
<title>Insert title here</title>
<style>
/* 세부 카테고리 버튼 */
         #btnwrap {
            width: 320px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            margin: auto;
        }
        .btn {
            width: 130px;
            height: 30px;
            margin:10px;   
            background: #ff60657e;
            border: 0px;
            border-radius: 55px;       
        }
        .btn a {
            color:white;
            font-family: "Do Hyeon";
            font-size: 16px;
        }

        /* 타이틀,라인 */
        #con1_title h1{
            position: absolute;
            width: 1000px;  
            text-align: center;
            margin-top: 25px;          
        }
        .h1_title {
           margin-top: 50px;
        }
        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        /* 게시물 부분 */
        #board_div {
            width: 100%;
           /*  height: 1200px; */
            margin:auto;
        }

        #board_title {
            width: 100%;
            height:50px;
            border-bottom: 1px solid #75757552;
            margin:auto;
            text-align: justify;
        }
        #btitle{
            font-size: 20px;
            line-height: 50px;
            padding-left: 10px;
            color:#757575;
        }
        
       #bwriter{
         margin-left: 70%;	 
         font-size: 16px;  
         color:#757575;
        } 
        
        #board_con {
            width: 100%;
           /*  height:1150px; */
            border-bottom: 1px solid #75757552;
            margin:auto;
        }
        #board_con p{
            padding-left: 10px;
            font-size: 14px;
        }

        /* 뒤로가기 버튼 */
        #back {
            width:100px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e;        
        }
        #back a {
            font-size: 14px;
            color: #ff60657e;
        }
        #warning_btn {
         background: none;
            border : 2px solid  #ff60657e;   
        	 width:70px;
        	margin-left:795px;
        }
        #warning_btn a {
        	  color: #ff60657e;
        
        }
        .imgAreaInner {
		display:inline-block; 
		text-align:center;
		}
        .addImg {
        width:200px;
		height:180px; 
		
        }
</style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
<!-- content -->
    <section id="con1">
        <!-- 세부 카테고리 버튼 -->
        <div id="btnwrap">
            <button class="btn"><a href='<%= request.getContextPath()%>/board/main'>자유게시판</a></button>
            <button class="btn"><a href='<%= request.getContextPath()%>/review/main'>후기</a></button>
        </div>

        <!-- 타이틀 -->
        <div id="con2_title">
            <h1 class="h1_title"></h1>
        </div>
        <div class="line"></div>
        
        <!-- 게시물 내용 -->
        <div id="board_div">
           <div id="board_title">
           <span id="btitle"><%= b.getbTitle() %></span>
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
</body>
</html>