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
<!-- select option 1:주말 2:평일 3:상관없음 -->

<script type="text/javascript">
function Activity(name, list){
    this.name = name; // 주말/평일/상관없음 vlaue
    this.list = list; // 해당되는 select option list 
}

var acts = new Array(); //배열 
    acts[0] = new Activity('주말', ['1', '2']);
    acts[1] = new Activity('평일', ['1', '2', '3', '4', '5']);
    acts[2] = new Activity('상관없음', ['1', '2', '3', '4', '5', '6', '7']);

function updateFreq(str){
    var frm = document.myForm; //입력 폼 name --> myForm 
    var oriLen = frm.frequency.length; //select option "name" 가져오기 --> frequency
    var numActs;

    for (var i = 0; i < acts.length; i++){
        if (str == acts[i].name) { //str: 주말/평일/상관없음 1,2,3
            numActs = acts[i].list.length; // 해당되는 select option 길이 가져와서 담기
            for (var j = 0; j < numActs; j++)
                frm.frequency.options[j] = new Option(acts[i].list[j],
                acts[i].list[j]);
            for (var j = numActs; j < oriLen; j++)
                frm.frequency.options[numActs] = null;
        }
    }
}
</script>

</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<section id="content-0">
			<p>챌린지 개설</p>
		</section>
		<form action="<%=request.getContextPath()%>/chall/insert"
			method="POST" id="challenge-form" name="myForm" enctype="multipart/form-data">
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
						<td><input type="radio" id="weekend" name="confirm" value="주말" onclick="updateFreq(this.value)"><label>주말</label>
							<input type="radio" id="weekday" name="confirm" value="평일" onclick="updateFreq(this.value)"><label>평일</label>
							<input type="radio" id="both" name="confirm" value="상관없음" onclick="updateFreq(this.value)"><label>상관없음</label>
						</td>
					</tr>

					<tr>
						<th>인증 빈도</th>
						<td><select name="frequency">
							<option>---</option>
							</select>
						</td>
					</tr>

					<tr>
						<th>챌린지 기간</th>
						<td><select name="period">
							<option>---</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select></td>
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
	

</body>
</html>