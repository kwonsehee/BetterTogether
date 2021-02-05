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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.btSection {
	padding-bottom: 100px;
}

.Btn1 {
		width: 55px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-weight: bolder;
	font-size: 10px;
	color:black;
 
}

th{
font-family: "Nanum Gothic";
}
 .line {
           border: 0.5px solid #937cf790;
        }
</style>
</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<form id="report_form"
		action="<%=request.getContextPath()%>/report/insert" method="post"
		enctype="multipart/form-data">

		<section id="btSection" class="btSection">
			<h2 style="color: #757575; font-family: Nanum Gothic; text-align: center;"><%=category%>신고	</h2>
						
		<div class="line"></div>
			<div class="container">

				<div class="row">
					<div class="col-sm-12 text-center">
						<div class="col-sm-3"></div>

						<div class="col-sm-6">
						
							<table class="table table-boardered">
							 
								<input type="hidden" class="title" name="category"
									value="<%=category%>" readonly> 

								<tr>
									<th id="thArea">제목</th>
									<td><input type="text" maxlength="50" class="form-control"
										name="title" id="write_title" placeholder="제목을 입력해주세요." style=" float: left;"></td>
								</tr>
								<tr>
									<th id="thArea"><%=category%>번호</th>
									<td><input type="hidden" name="no" class="form-control"
										value="<%=no%>" id="reportNum" readonly style="float: left;"><input
										type="text" value="<%=no%>" readonly 
										style="border-top-width: 0px; padding-left: 0px; padding-bottom: 0px;
										 border-bottom-width: 0px; border-left-width: 0px; 
										 padding-right: 0px; border-right-width: 0px; float: left;
										background-color:rgba(255,255,255,0);">
									</td>
								</tr>
								<tr>
									<th id="thArea">대상 닉네임</th>
									<td ><input type="text" maxlength="50" 
										name="reported_id" id="reportedName" value="<%=reported_id%>"
										readonly style="border-top-width: 0px; padding-left: 0px; padding-bottom: 0px;
										 border-bottom-width: 0px; border-left-width: 0px; 
										 padding-right: 0px; border-right-width: 0px; float: left;
										background-color:rgba(255,255,255,0);"></td>
								</tr>


								<tr>
									<th>첨부파일</th>
									<td><input type="file" name="ex_file"></td>
								</tr>





								<tr>
									<th id="thArea">내용</th>
									<td><textarea rows="5" cols="40" name="content"
											placeholder="내용을 입력해주세요." class="form-control"></textarea></td>
								</tr>




							</table>

							<div id="btnArea">
								<!-- 등록 버튼 , 나가기 버튼 -->
								<button class="Btn1" id="back_btn"
									onclick="javascript:history.back();">취소</button>
								<button type="submit" class="Btn1">신고</button>
							</div>



						</div>

					</div>


				</div>
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

	<%@ include file="../common/footer.jsp"%>

</body>
</html>