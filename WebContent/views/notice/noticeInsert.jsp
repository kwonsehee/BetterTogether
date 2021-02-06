<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
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
        
        #mustread{
        	float:right;
        }

    </style>
</head>
<body>

<!-- 모든 페이지에 include할 menubar.jsp 생성하고 포함하기 -->

	<%@ include file="../common/common_ui.jsp" %>
	<form id="article-form" action="<%= request.getContextPath() %>/notice/insert" method="post" enctype="multipart/form-data">
	
	<section id="btSection" class="btSection">
        <table id="writebox">
            <tr>
                <td>
                	<h1 id="title">공지사항 작성</h1>
                </td>
            </tr>
            <tr>
            	<td class="qnaTable"><input type="text" name="title" id="write_title" maxlength="50" placeholder="제목을 입력해주세요."></td>
            </tr>
            <tr>
                <td class="qnaTable">
                	<div class="filebox">
                		<label for="ex_file">파일 첨부</label>
               			<input type="file" name="afile" id="ex_file">
               			<div id="mustread">
               			<label>필독
                		<input type="checkbox" name="mustread" value="2" >
                		</label>
                		</div>
                	</div>                	
                </td>
            </tr>
			<tr>
            	<td class="qnaTable">
            		<textarea cols="50" name="content" id="writeArea" rows="15" placeholder="내용을 입력해주세요."></textarea>
            	</td>
            </tr>
		</table>
		<div id="btnArea">
        	<!-- 등록 버튼 , 나가기 버튼 -->
        	<button type="button" id="back_btn" class="Btn1" onclick="javascript:history.back();" >취소</button>
			<button type="submit" class="Btn1">등록</button>
        </div>
	</section>
	</form>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>