<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list= (ArrayList<Notice>)request.getAttribute("list");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 <style>
        
        #title{
            width: 100%;
        }
        #title h1 {
            font-size: 30px;
            font-family: "Do Hyeon";
            text-align: center;
            padding-top: 10px;
        }
        .article_table {
            font-family: "Do Hyeon";
            font-size: medium;
            margin-top: 20px;
            margin-left:40px;
            width: 90%;
            border-top: 2px solid #ff6064;
            border-collapse: collapse;
        }

        .article_table th,.article_table td {
            border-bottom: 1px solid #444444;
            padding: 10px;
            text-align: center;
        }

        #page_css {
            width: 100%;
            height: 20%;
            float: left;
            padding-top: 50px;
            padding-left: 350px;
        }

        .sr-only,
        .page-link {
            color: black;
            padding-left: 10px;
            font-family: "Do Hyeon";
            height: 40px;
            background-color: #fdc8c6;
        }
        #article_btn {
            font-family: "Do Hyeon";
            width: 170px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            margin: 5px;
            float: right;
            font-size: 20px;
            margin-right: 50px;
        }
        /*페이징 css*/
        .pagination {
            display: inline-block;
        }

        .pagination a {
            font-family: "Do Hyeon";
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
  
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>
	<section id="content" class="content_css">
        <div id="title">
            <h1>공 지 사 항</h1>
        </div>
        <section id="content-1">
            <table class="article_table">
                <thead>
                    <tr>
                        <th>유형</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>날짜</th>
                        <th>번호</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="color: red;">필독</td>
                        <td>
                            <a href="articleView.html">공지합니다</a>
                        </td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <tr>
                        <td style="color: red;">필독</td>
                        <td>
                            <a href="articleView.html">공지합니다</a>
                        </td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <tr>
                        <td style="color: red;">필독</td>
                        <td>
                            <a href="articleView.html">공지합니다</a>
                        </td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <tr>
                        <td style="color: red;">필독</td>
                        <td>
                            <a href="articleView.html">공지합니다</a>
                        </td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <tr>
                        <td>공지</td>
                        <td>공지합니다</td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                    <tr>
                        <td>공지</td>
                        <td>공지합니다</td>
                        <td>manager</td>
                        <td>2020.12.27</td>
                        <td>999</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section id="page_css">
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">&raquo;</a>
            </div>

        </section>

        <form method="POST">
            <section id="content-3">
                <!-- 질문 하기 버튼 -->
                <button id="article_btn"><a href="articleWrite.html">글쓰기</a></button>
            </section>
        </form>

    </section>
</body>
</html>