<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
         #title{
            width: 100%;
        }
        #title h3 {
            font-size: 30px;
            font-family: "Do Hyeon";
            text-align: center;
            padding-top: 10px;
        }


        .challenge_table {
            font-family: "Do Hyeon";
            font-size: medium;
            margin-top: 20px;
            margin-left: 40px;
            width: 90%;
            border-top: 2px solid #ff6064;
            border-collapse: collapse;
        }

        .challenge_table th,
        .challenge_table td {
            border-bottom: 1px solid #444444;
            padding: 10px;
            text-align: center;
        }
        


        #challenge_btn {
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
        
         #content-2 {
            width: 100%;
            height: 20%;
            float: left;
            padding-top: 50px;
            padding-left: 350px;
        }
    </style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
  <section id="content" class="content_css">
        <section id="title">
            <h3>챌린지 모집 게시판</h3>
        </section>
        <section id="content-1">
            <table class="challenge_table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>모집인원수</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>찜 횟수</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>6</td>
                        <td><a href="challengeJoin.html">6:00 기상하기</a></td>
                        <td>2/4명</td>
                        <td>user6</td>
                        <td>2020-12-27</td>
                        <td>3</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td><a>7시 전 저녁 먹기</a></td>
                        <td>[모집마감]</td>
                        <td>user5</td>
                        <td>2020-12-27</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td><a>제목 4</a></td>
                        <td>3/4명</td>
                        <td>user4</td>
                        <td>2020-12-27</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td><a>제목 3</a></td>
                        <td>2/4명</td>
                        <td>user4</td>
                        <td>2020-12-27</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td><a>제목 2</a></td>
                        <td>2/4명</td>
                        <td>user2</td>
                        <td>2020-12-27</td>
                        <td>5</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td><a>제목 1</a></td>
                        <td>1/4명</td>
                        <td>user1</td>
                        <td>2020-12-27</td>
                        <td>10</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section id="content-2">
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
                <!-- 버튼 -->
                <button id="challenge_btn" type="button"><a href="challengeMake.html">챌린지 개설</a></button>
            </section>
        </form>

    </section>

</body>
</html>