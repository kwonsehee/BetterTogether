<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="challenge.model.vo.Challenge, member.model.vo.Member"%>
<%
	// 2: 결제 수단 -> 포인트 결제
	int payment = Integer.parseInt((String.valueOf(request.getAttribute("payment"))));

	// 결제할 챌린지 넘버 받기위해
	//int challNo = Integer.parseInt((String.valueOf(request.getAttribute("challNo"))));

	// 해당 챌린지의 결제 정보 알아오기 위해 
	Challenge ch = (Challenge) request.getAttribute("challenge");
	
	Member m = (Member) session.getAttribute("loginUser");

	String userId = m.getUserId();
	String userPwd = m.getUserPwd();
	int money = m.getPoint();

	// 남은 금액 가져오기
	int remainPay = m.getPoint() - ch.getChallPay();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환급페이지</title>
<%
	if(request.getAttribute("msg")!=null){
		if(request.getAttribute("msg").equals("success")){
%>
<script>
alert("챌린지 참여 완료!");
opener.location.href='<%=request.getContextPath()%>/chall/join?challNo=<%=ch.getChallNo()%>';
window.close();
</script>
<%} else{ %>
<script>
	alert("포인트 결제 실패!");
</script>
<%		}
	}%> 
	
<style>

/* 디자인 수정 */
#point_title {
	width: 100%;
	height: 10%;
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
	color: #252525b6
}

.line {
	border: 0.5px solid #937cf790;
}

#joinForm {
	width: 100%;
	height: 100%;
	margin-left: 30%;
	margin-top: 5%;
}

input[type="text"], input[type="password"] {
	height: 20px;
	width: 60%;
	border: solid 1px #9e9e9e5b;
	border-radius: 3px;
}

.tb_content {
	padding-right: 20px;
	padding: 7px;
}

#challPoint_tb {
	font-family: "Nanum Gothic";
	font-size: 13px;
	font-weight: bolder;
	color: #252525b6;
	margin-top: 2%;
}

.point_btn {
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	margin-top: 4%;
}

#pointBtn {
	width: 90px;
}

#back_btn {
	width: 60px;
	margin-left: 11%;
}

#pointBtn:focus, #back_btn:focus {
	outline: none;
	border: solid 1px #937CF7;
	background-color: #e0dbf890;
}
</style>
</head>
<body>

	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->

	<section id="btSection" class="content_css">
			<p id="point_title">포인트 결제</p>
			<div class="line"></div>
				<form id="joinForm" action="<%= request.getContextPath() %>/pay/insert" method="post" onsubmit="return checkInput();">
				<table id="challPoint_tb">
					<tr>
						<td class="tb_content">보유 금액</td>
						<td colspan="2"><%=money%> 포인트</td>
					</tr>
					<tr>
						<td class="tb_content">결제할 금액</td>
						<td><input type="text" id="money" class="input_box" value="<%=ch.getChallPay()%>"> 원</td>
					</tr>
					<tr>
						<td class="tb_content">남은 금액</td>
						<td><input type="text" name="point" id="bank" class="input_box" value="<%=remainPay%>"> 원</td>
					</tr>
					<tr>
						<td class="tb_content">비밀번호 확인</td>
						<td><input type="password" name="pass" id="pass" class="input_box" /></td>
						<td><label id="pwdResult"></label></td>
					</tr>
				</table>

				<!-- 결제 수단 넘겨주기 -->
				<input type="hidden" name="payment" value="<%=payment%>">
				<!-- 챌린지 번호 -->
				<input type="hidden" name="challNo" value="<%=ch.getChallNo()%>">
				
				<button type="button" id="back_btn" class="point_btn" onclick="window.close()">취소</button>
				<%if (money >= ch.getChallPay()) {%>
				<button id="pointBtn" class="point_btn">포인트결제</button>
				<%} else {%>
				<button id="pointBtn" class="point_btn" disabled>포인트결제</button>
				<%}%>
			</form>
				
					<%-- <table id="pointPay" style="width: 100%;">
						<tr>
							<th><label for="money" class="text_font">보유 금액</label></th>
							<td colspan="2"><%=money%> 포인트</td>
						</tr>
						<tr>
							<th><label for="money" class="text_font">결제할 금액</label></th>
							<td colspan="2"><input type="text" id="money"
								class="input_box" value="<%=ch.getChallPay()%>"> 원</td>

						</tr>
						<tr>
							<th><label for="bank" class="text_font">남은 금액</label></th>
							<td colspan="2"><input type="text" name="point" id="bank"
								class="input_box" value="<%=remainPay%>"> 원</td>
						</tr>
						<tr>
							<th><label for="pass" class="text_font">비밀번호 확인</label></th>
							<td><input type="password" name="pass" id="pass"
								class="input_box" /></td>
							<td><label id="pwdResult"></label></td>
						</tr>

						<tr>
							<th>
								<button type="button" class="btn"
									onclick="javascript:history.back();">취소</button>
							</th>
							<th colspan="2">
								<button id="pointBtn" class="btn">포인트결제</button>
							</th>

						</tr>
					</table> --%>

			<script>
			// checkInput함수작성
			function checkInput(){
				
				<%-- //보유금액보다 큰 금액 입력시 alert후 focus 처리->submit X 
				if($("#money").val().trim()> <%=money%>){
					alert('보유 금액보다 더 큰 액수를 입력할수 없습니다.');
					return false;
				} --%>
				if($("#pass").val().trim().length==0){
					alert('비밀번호를 입력하세요');
					$("#pass").focus();
					return false;
				}
				//비밀번호 - 비밀번호 확인 일치여부
				if(<%=userPwd%> != $("#pass").val()){
					$("#pwdResult").text("비밀번호 불일치").css("color","red");
					return false;
				}
				
				
			}
		
			</script>
	</section>

	<!-- 결제버튼  -->
	<%-- <script>
	const pointBtn = document.getElementById('pointBtn');
	<%if (money >= ch.getChallPay()) {%>
	pointBtn.addEventListener('click',function(){
		$("#joinForm").attr("action", "<%=request.getContextPath()%>/pay/insert");
		$("#joinForm").submit();
	});
	<%} else {%>
		$("#pointBtn").attr("disabled", true);
	<%}%>
	
	</script> --%>
</body>
</html>