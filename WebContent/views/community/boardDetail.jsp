<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="community.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("board");
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
        </div>

        <!-- 버튼 -->
        <button class="btn" id="back"><a href='<%= request.getContextPath()%>/board/main'>뒤로가기</a></button>
</body>
</html>