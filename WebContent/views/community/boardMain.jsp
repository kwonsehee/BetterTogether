<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
	 body {
            width: 1000px;
            height : 1100px;
        }

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

        #con1_title h1{
            /* position: absolute; */
            width: 1000px;  
            text-align: center;
            margin-top: 25px;          
        }

        .h1_title {
           margin-top: 50px;
           text-align: center;
           font-family: "Do Hyeon";
           font-size: 24px;
           color : #757575;
        }

        .line {
            border: 3px solid rgba(255, 96, 100, 0.7);
        }

        /* 게시판 */
        #board_tb {
            width: 100%;
            height: 400px;      
            border-collapse: collapse;
            
        }

        #board_tb th, #board_tb td {
            border-bottom: 1px solid #75757552;
            padding: 2px;
        }

        #tb_title {
            width:70%;
        }
        #tb_author {
            width:10%;
        }
        #tb_date {
            width:10%;
        }
        #tb_views {
            width: 5%;
        }
        #th_title {
            background : rgba(240, 240, 240, 0.7);
            height: 30px;
            font-family: "Do Hyeon";
            font-size: 14px;
            color : #757575;
        }

        #write {
            width:55px;
            color:white;
            font-family: "Do Hyeon";
            margin-top : 20px;
            margin-left : 80%;
        }
        #write a {
            font-size: 14px;
        }

        #mywrite {
            width:100px;
            font-family: "Do Hyeon";
            background: none;
            border : 2px solid  #ff60657e;        
        }
        #mywrite a {
            font-size: 14px;
            color: #ff60657e;
        }

        #board_tb td:hover {
            cursor : pointer;
        }
</style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	 <!-- content -->
    <section id="con1">
        <!-- 세부 카테고리 버튼 -->
        <div id="btnwrap">
            <button class="btn"><a href="boardmain.html">자유게시판</a></button>
            <button class="btn"><a href="reviewmain.html">후기</a></button>
        </div>

        <!-- 타이틀 -->
        <div id="con2_title">
            <h1 class="h1_title">자유게시판</h1>
        </div>
        <div class="line"></div>
        
        <div id="board_div">
            <table id="board_tb">
                <tr id="th_title"><th> </th><th id="tb_title">제목</th><th id="tb_author">글쓴이</th><th id="tb_date">작성일</th><th id="tb_views">조회수</th></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
                <tr onclick="location.href='boardOneView.html'"><td></td><td></td><td></td><td></td><td></td></tr>
            </table>
        </div>

        <!-- 버튼 -->
        <button class="btn" id="mywrite"><a href="myBoard.html">내가 쓴 글 보기</a></button>
        <button class="btn" id="write"><a href='<%= request.getContextPath()%>/board/write'>글쓰기</a></button>
    </section>
	
</body>
</html>