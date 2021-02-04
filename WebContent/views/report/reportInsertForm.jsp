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
<title>Better Together</title>
<style>

#title, .title {
	text-align: center;
	font-family: "Nanum Gothic";
	font-size: 24px;
	color: #757575;
}

.qnaTable {
	border-top: 3px solid #937cf790;
	width: 80%;
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

#reportedName{
	font-family: "Nanum Gothic";
	width: 100%;   
	height: 40px; 
	border: 0px;
	background: none;
	padding-left: 2%;
}

#thArea{
	width: 10%;
	text-align: center;
    font-family: "Nanum Gothic";
    color: #757575;
}

.filebox span, label, #ex_file, #reportedName{
	color: #757575;
	font-size: 15px;
}

/*버튼*/
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

</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

    <form id="report_form" action="<%= request.getContextPath() %>/report/insert" method="post" enctype="multipart/form-data">
		<section id="btSection" class="btSection">
			<table id="writebox">
				<tr>
					<td>
						<h1 id="title" ><input type="hidden" class="title" name="category" value="<%=category%>"
								readonly><%=category%>신고</h1>
					</td>
				</tr>
				<tr>
					<th id="thArea">제목</th>
					<td class="qnaTable"><input type="text" maxlength="50"
						name="title" id="write_title" placeholder="제목을 입력해주세요."></td>
				</tr>
				<tr>
					<th id="thArea"><%=category%>번호</th>
					<td class="qnaTable"><input type="hidden" name="no" value="<%=no%>" id="reportNum" readonly>
						<%=no%></td>
				</tr>
				<tr>
					<th id="thArea">대상 닉네임</th>
					<td class="qnaTable"><input type="text" maxlength="50" name="reported_id" id="reportedName"
						value="<%=reported_id%>" readonly></td>
				</tr>

				<tr>
					<th id="thArea">첨부파일</th>
					<td class="qnaTable">
						<div class="filebox">
							<label for="ex_file">파일 첨부</label> <input type="file"
								id="ex_file" name="ex_file"> <span class="filename">파일을
								선택해주세요.</span>
						</div>
					</td>
				</tr>

				<tr>
					<th id="thArea">내용</th>
					<td class="qnaTable"><textarea cols="50" id="writeArea"
							rows="15" name="content" placeholder="내용을 입력해주세요."></textarea></td>
				</tr>
			</table>

			<div id="btnArea">
                <!-- 등록 버튼 , 나가기 버튼 -->
                <button class="Btn1" id="back_btn" onclick="javascript:history.back();">취소</button>
                <button type="submit" class="Btn1">신고하기</button>
            </div>
            
    	</section>
    </form>
       <script>
								$(document).on("change", "#ex_file",
										function() {
											var filename = $(this).val();
											console.log(filename);
											if (filename == "")
												filename = "파일을 선택해주세요.";
											$(".filename").text(filename);
										})
							</script>
								
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>