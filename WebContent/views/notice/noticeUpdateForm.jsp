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
    #title {
	text-align: center;
	font-family: "Nanum Gothic";
	font-size: 24px;
	color: #757575;
}

 .qnaTable {
	border-top: 3px solid #937cf790;
	width: 100%;
}

#writebox {
	width: 80%;
}

#write_title {
	font-family: "Nanum Gothic";
	width: 100%;   
	height: 40px; 
	border: 0px;
	background: none;
	padding-left: 2%;
}

#writeArea {
	width: 100%;
	border: 0px;
	resize: none;
	background: none;
	font-size: 20px;
	font-family: "Nanum Gothic";
	padding-left: 2%;
}

.Btn1 {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	float: right;
	margin-bottom: 2%;
	margin-left: 1%;
}

#btnArea {
	padding-right:10%;
}

.btSection #writebox {
	margin: auto;
}
        
         /* 파일첨부 버튼 css */
		.filebox {
			padding:1.5%;
		}
        .filebox label {
            display: inline-block;
            padding: .1em .75em;
            margin-left: 2px;
            font-size: inherit;
            line-height: normal;
            vertical-align: middle;
            background-color: #937cf790;
            cursor: pointer;
            border: 1px solid #937cf790;
            border-bottom-color: #937cf790;
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
        

    </style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>
	
    <form id="article-form" action="<%= request.getContextPath() %>/notice/update" method="post">
    <input type="hidden" name="ano" value="<%= n.getaNo() %>">
		<section id="btSection" class="btSection">
        	<table id="writebox">		
            	<tr>
            		<td>
                		<h1 id="title">공지사항 수정</h1>
                	<td>
            	</tr>
                <tr>
                	<td class="qnaTable">
                           <input type="text" name="title" id="write_title" value="<%= n.getaTitle() %>">
					</td>
                </tr>
                <tr>
                	<td class="qnaTable">
                    	<div class="filebox">
                        	<label for="ex_file">파일 첨부</label>
                            <input type="file" id="ex_file">
                        </div>
                    </td>
                </tr>
				<tr>
					<td class="qnaTable">
                        <textarea cols="50" name="content" rows="15" id="writeArea"><%= n.getaContent() %></textarea>
                    </td>
                </tr>
            </table>
            
            <div id="btnArea">
                <!-- 등록 버튼 , 나가기 버튼 -->
                <button type="button" id="back_btn" class="Btn1" onclick="javascript:history.back();" >취소</button>
				<button type="submit" class="Btn1">수정하기</button>
            </div>
            
		</section>

	<%@ include file="../common/footer.jsp" %>
	
    </form>
</body>
</html>