<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	// 인증, 자유게시판, 스터디카페, 챌린지모집의 번호를 가져옴
	String category = (String)request.getAttribute("category");

	//신고당할 대상의 user_id도 가져와 reported_id로 세팅한다.
	String reported_id= (String)request.getAttribute("reported_id");
	
	//각 카테고리의 고유번호 가져오기
	int no = Integer.parseInt((String.valueOf(request.getAttribute("no"))));

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고작성하기</title>
    <style>

         /* content 부분 */

         #report-form {
            width: 100%;
            height: 100%;
            float: left;

        }

        #content-1 {
            width: 100%;
            height: 70%;
            padding-top: 8px;
            padding-left: 60px;  /* border : 1px solid red; */
        }

        .report_tb {
        	height : 80%;
            font-family: "Do Hyeon";
            font-size: 19px;
            border-collapse: collapse;
            margin-top : 5%;
            
        }

        .report_tb tr{
            border:1px solid #c2c1c1;
        }

       .report_tb tr > td {
            background-color: white;
        }

        .report_tb th {
            background-color: #ece8e8;
            padding:5px;
            border:1px solid #c2c1c1;
        }

        input[type="file"] {
            font-family: "Do Hyeon";
        }

        #content-2 {
       /*  border : 1px solid black; */
            width: 100%;
            height: 15%;

        }

        .report_btn {
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
        /* border : 1px solid red; */
            width: 99.5%;
            border : 0;
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

   		.line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
        }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

<section id="content" class="content_css">
        <form id="report_form" action="<%= request.getContextPath() %>/report/insert" method="post">
          <section id="title">
                <p> <%=category %> 신고</p>
                 <div class="line"></div>
            </section>
            <section id="content-1">
                <table class="report_tb">
                    <tr>
                        <th>
                            제목
                        </th>
                        <td>
                            <input type="text" name="title" maxlength="50" >
                        </td>
                    </tr>

                    <tr>
                        <th><%=category %>번호</th>
                        <td>
                           <input type="hidden"name="confirm_no"value="<%=no %>" readonly>
                        </td>
                    </tr>

                    <tr>
                        <th>대상 닉네임</th>
                        <td>
                            <input type="text" maxlength="50" name = "reported_id"value="<%=reported_id %>" readonly>
                        </td>
                    </tr>

                    <tr>
                        <th>첨부파일</th>
                        <td>
                            <div class="filebox">
                                <label for="ex_file">파일 첨부</label>
                                <input type="file" id="ex_file" name="ex_file">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea cols="50" rows="15" name="content"></textarea>
                        </td>
                    </tr>
                </table>
                
            </section>

            <section id="content-2">
                <!-- 등록 버튼 , 나가기 버튼 -->
                <button class="report_btn" id="back_btn" onclick="javascript:history.back();">취소</button>
                <button type="submit" class="report_btn">신고하기</button>
            </section>
            
        </form>
    </section>
</body>
</html>