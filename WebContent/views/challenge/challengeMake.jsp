<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* content 부분 */
#challenge-form {
	width: 100%;
	height: 100%;
	float: left;
}

#content-0 {
	width: 100%;
	height: 10%;
	text-align: center;
}

#content-0 p {
	font-size: 25px;
}

#content-1 {
	width: 100%;
	height: 80%;
	padding-left: 60px;
	float: left;
	margin-top: -20px;
}

.table {
	font-family: "Do Hyeon";
	font-size: 19px;
	border-collapse: collapse;
}

tr {
	border: 1px solid #c2c1c1;
}

tr>td {
	background-color: white;
}

th {
	background-color: #ece8e8;
	padding: 5px;
	border: 1px solid #c2c1c1;
}

input[type="file"] {
	font-family: "Do Hyeon";
}

textarea {
	position: absolute;
	margin-top: 368px;
	padding-right: 522px;
	height: 80px;
	border: white;
	border-radius: 3px;
	resize: none;
}

#content-2 {
	width: 100%;
	height: 10%;
	float: left;
	margin-top: -120px;
}

#challenge_btn {
	font-family: "Do Hyeon";
	width: 170px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	float: right;
	font-size: 20px;
	margin-right: 60px;
}

#back_btn {
	font-family: "Do Hyeon";
	width: 170px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	float: left;
	font-size: 20px;
	margin-left: 580px;
}

input[type="text"], input[type="date"] {
	height: 33px;
	width: 762px;
	border: white;
	border-radius: 3px;
}

tr:nth-child(2) label {
	padding-right: 8px;
}

tr:nth-child(2) input {
	margin-left: 3px;
}

tr:nth-child(4) input {
	margin-left: 3px;
}

input:focus, textarea:focus {
	outline: none;
}

#file_option label {
	display: inline-block;
	background: rgb(156, 154, 154);
	border-radius: 10px;
	color: #fff;
	padding: 0px 15px;
	line-height: 30px;
	cursor: pointer;
	margin: 3px;
	margin-left: 5px;
	font-family: "Do Hyeon";
}

#file_option label:after {
	content: "파일등록";
}

#file_option #file-input {
	display: none;
}

#file_option .filename {
	display: inline-block;
	font-size: 14px;
	color: #757575b7;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<section id="content-0">
			<p>챌린지 개설</p>
		</section>
		<form action="<%=request.getContextPath()%>/chall/insert"
			method="POST" id="challenge-form">
			<section id="content-1">
				<table class="table">
					<tr>
						<th>챌린지 제목</th>
						<td><input type="text" maxlength="50" name="title" required>
						</td>
					</tr>

					<tr>
						<th>카테고리 선택</th>
						<td><input type="radio" id="weight" name="category"
							value="10"> <label>체중관리</label> <input type="radio"
							id="exercise" name="category" value="20"> <label>운동</label>
							<input type="radio" id="certificate" name="category" value="30">
							<label>자격증</label> <input type="radio" id="money" name="category"
							value="40"> <label>돈관리</label> <input type="radio"
							id="habit" name="category" value="50"> <label>생활습관</label>
							<input type="radio" id="study" name="category" value="60">
							<label>공부</label> <input type="radio" id="skill" name="category"
							value="70"> <label>업무스킬</label> <input type="radio"
							id="language" name="category" value="80"> <label>외국어</label>
						</td>
					</tr>

					<tr>
						<th>첨부파일</th>
						<td>
							<div id="file_option">
								<label><input type="file" id="file-input" name="picture"></label> <span
									class="filename">파일을 선택해주세요.</span>
							</div>
						</td>
					</tr>

					<tr>
						<th>인증 방법</th>
						<td><input type="radio" id="weekend" name="confirm" value="1">
							<label>주말</label> <input type="radio" id="weekday" name="confirm"
							value="2"> <label>평일</label> <input type="radio"
							id="both" name="confirm" value="3"> <label>상관없음</label></td>
					</tr>

					<tr>
						<th>인증 빈도</th>
						<td><input type="text" name="frequency" maxlength="50"
							placeholder="예시) 주 2회" required></td>
					</tr>

					<tr>
						<th>챌린지 기간</th>
						<td><input type="text" name="period" maxlength="50"
							placeholder="예시) 2 주" required></td>
					</tr>

					<tr>
						<th>챌린지 시작일</th>
						<td><input type="date" name="startDate" required></td>
					</tr>

					<tr>
						<th>참가비</th>
						<td><input type="text" name="payment" maxlength="50" required>
						</td>
					</tr>

					<tr>
						<th>참가 인원수</th>
						<td><input type="text" name="people" maxlength="50" required>
						</td>
					</tr>

					<tr>
						<th colspan="2">소개</th>
					</tr>

					<tr>
						<p>
							<textarea cols="50" rows="10" name="content"></textarea>
						</p>
					</tr>

				</table>
			</section>

			<!-- 총인증갯수도 숨겨서 보내기 -->
			<!-- <input type="hidden" name="confirmCnt" value="0"> -->

			<section id="content-2">
				<!-- 등록 버튼 -->
				<button type="button" onclick="javascript:history.back();"
					id="back_btn">뒤로가기</button>
				<button type="submit" id="challenge_btn">챌린지 등록</button>
			</section>
		</form>
	</section>

	<script>
		$(document).on("change", "#file-input", function() {
			var filename = $(this).val();
			console.log(filename);
			if (filename == "")
				filename = "파일을 선택해주세요.";
			$(".filename").text(filename);
		})
		
	</script>
	
<!-- 	<!-- 파일첨부 미리보기 -->
	<script>
	$(function(){
		//input type="file"태그에 파일이 첨부될때 동작하는 이벤트
		$("[type=file]").change(function(){
			loadImg(this);
		});
	});
	function loadImg(element){
		//element를 판별해서 알맞은 위치에 preview표현하기
		/* console.log(element.name); */
		
		//input type="file" 엘리먼트에 첨부파일 속성, 첨부파일이 잘 존재하는지 확인
		if(element.files && element.files[0]){
			//파일을 읽어들일 FileReader 객체 생성
			var reader = new FileReader();
			
			//파일 읽기가 다 완료 되었을 때 실행되는 메소드
			reader.onload =function(e){
				var selector;
				var size;
		
				selector = "";
				size = {width: "400px", height: "330px", border:"1px solid black"};
				$(selector).attr("src",e.target.result).css(size);
				console.log(e);
				console.log(e.target);
				console.log(e.target.result);
			}
			//파일 읽기 하는 메소드
			reader.readAsDataURL(element.files[0]);

			
		}
	}
	</script> -->
	
	<!-- width: 400px;
	height: 330px; -->


</body>
</html>