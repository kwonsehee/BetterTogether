<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 페이지</title>
 <style>
    /* content 부분 */

    #article-form {
            width: 100%;
            height: 100%;
            float: left;

        }

        #content-1 {
            width: 100%;
            height: 70%;
            padding-top: 8px;
            padding-left: 60px;
        }

        .table {
            font-family: "Do Hyeon";
            font-size: 19px;
            border-collapse: collapse;
            margin-top: -15px;
        }

        tr{
            border:1px solid #c2c1c1;
        }

        tr > td {
            background-color: white;
        }

        th {
            background-color: #ece8e8;
            padding:5px;
            border:1px solid #c2c1c1;
        }

        input[type="file"] {
            font-family: "Do Hyeon";
        }

        #content-2 {
            width: 100%;
            height: 15%;

        }

        .article_btn {
            font-family: "Do Hyeon";
            width: 170px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            margin: 5px;
            font-size: 20px;
            float:right;
            margin-top:20px;
        }
        /* 파일첨부 버튼 css */

        .filebox label {
            display: inline-block;
            padding: .1em .75em;
            margin-left: 2px;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #fdc8c6;
            cursor: pointer;
            border: 1px solid #fdc8c6;
            border-bottom-color: #e2e2e2;
            border-radius: .25em;
            font-size: 17px;
        }

        .filebox input[type="file"] {
            /* 파일 필드 숨기기 */
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        input[type="text"]{
            height: 33px;
            width: 762px;
            border: white;
            border-radius: 3px;
        }

        textarea{
            width: 99.5%;
            border:0;
            resize: none; 
        }

        input:focus, textarea:focus{
            outline:none;
        }

        #title{
            width: 100%;
            height: 10%;
        }

        #title p{
            text-align: center;
            font-size: 30px;
        }

        #back_btn{
            margin-right: 60px;
        }
    </style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
	
	<section id="content" class="content_css">
        <form id="article-form" action="<%= request.getContextPath() %>/notice/update" method="post">
        <input type="hidden" name="nno" value="<%= n.getnNo() %>">
			
            <section id="title">
                <p>공지사항 수정</p>
            </section>
            <section id="content-1">
                <table class="table">
                    <tr>
                        <th>
                            제목
                        </th>
                        <td>
                           <input type="text" name="title" value="<%= n.getnTitle() %>">
						</td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <div class="filebox">
                                <label for="ex_file">파일 첨부</label>
                                <input type="file" id="ex_file">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th rowspan="5">내용</th>
                        <td>
                            <textarea cols="50" name="content" rows="15">
                            <%= n.getnContent() %>
                            </textarea>
                        </td>
                    </tr>
                </table>
            </section>

            <section id="content-2">
                <!-- 등록 버튼 , 나가기 버튼 -->
                <button type="button" id="back_btn" class="article_btn" onclick="javascript:history.back();" >취소</button>
				<button type="submit" class="article_btn">수정하기</button>
            </section>
        </form>
    </section>
</body>
</html>