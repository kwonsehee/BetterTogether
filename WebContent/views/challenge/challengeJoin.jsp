<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="challenge.model.vo.*, java.util.Date, java.util.ArrayList"%>
<%

   	Challenge ch = (Challenge)request.getAttribute("challenge");   

	// 챌린지 상태 리스트 가져오기
	ArrayList<ChallengeStatus> list = (ArrayList<ChallengeStatus>)request.getAttribute("list");
	
	// 찜 상태 받아오기 
	String hits_status = "";
	if(list != null){
		hits_status = (String)request.getAttribute("hits_status");
		System.out.println("찜 상태 : " + hits_status);
	}
	
	
	// 챌린지 시작일 값 추출 
	String year = ch.getChallStart().substring(0, 4);
	String month = ch.getChallStart().substring(5,7);
	String day = ch.getChallStart().substring(8,10);
	
	System.out.println("인증방법 : " + ch.getChallConfirm());
	
	// 인증 방법 한글로 나타내기 
	String confirmNum = ch.getChallConfirm();
	String confirm[] = new String[3];
	switch(confirmNum){
		case "1" : confirm[0] = "주말"; break; 
		case "2" : confirm[1] = "평일"; break; 
		case "3" : confirm[2] = "상관없음"; break; 
	}
	
	// chall_status (참여중이면 이미 참여했다고 alert 띄우기)
	int chall_status = 0;
	if ((request.getAttribute("chall_status")!=null)){
		chall_status = Integer.parseInt((String.valueOf(request.getAttribute("chall_status"))));
	}
	//int chall_status = Integer.parseInt((String.valueOf(request.getAttribute("chall_status"))));
	
	int joinPeopleCnt = 0;
	if((request.getAttribute("joinPeopleCnt")!=null)){
		joinPeopleCnt = Integer.parseInt((String.valueOf(request.getAttribute("joinPeopleCnt"))));
	}
	// 참여중인 인원 카운트 
	//int joinPeopleCnt = Integer.parseInt((String.valueOf(request.getAttribute("joinPeopleCnt"))));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#content-1 {
	margin-top: 10px;
	padding-top: 5px;
	width: 50%;
	height: 70%%;
	float: left;
}

#content-2 {
	margin-top: 10px;
	width: 50%;
	height: 70%;
	float: left;
}

#challenge_btn {
	font-family: "Do Hyeon";
	width: 130px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 20px;
}

#chall_backBtn {
	font-family: "Do Hyeon";
	width: 130px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	margin-left: 25px;
	margin-top: 10px;
	font-size: 20px;
}

#challConfirm_btn {
	font-family: "Do Hyeon";
	width: 70px;
	height: 30px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	margin-left: 10px;
	margin-top: -15px;
	font-size: 15px;
}

#warning_btn{
	font-family: "Do Hyeon";
	width: 70px;
	height: 30px;
	border-radius: 20px;
	border: solid 1px #ff6064;
	background-color: #ff6064;
	margin-left: 10px;
	margin-top: -15px;
	font-size: 15px;
	color:white;

}

#call_img {
	width: 400px;
	height: 330px;
	padding-left: 50px;
	padding-top: 30px;
}

#chall_title {
	font-size: 25px;
	text-align: center;
}

#chall_intro {
	font-size: 20px;
	text-align: center;
	color: rgb(168, 167, 167);
}

#content-2 p {
	font-size: 25px;
	color: #ff6064;
	padding-left: 30px;
}

#join_title1 {
	bottom: 67%;
}

#join_title2 {
	bottom: 43%;
}

.img-size {
	width: 40px;
	height: 40px;
}

#join_table1 {
	margin-left: 30px;
	font-family: "Do Hyeon";
	font-size: 20px;
}

#join_table2 {
	margin-left: 30px;
	font-family: "Do Hyeon";
	font-size: 20px;
}

#join_table1 td img {
	margin-right: 15px;
}

#join_table2 td img {
	margin-right: 15px;
}

.heart_img {
	width: 40px;
	height: 40px;
}

#hits_btn {
	padding-top: 15px;
	background-color: #f9f1f1;
	border: #f9f1f1;
	outline: none;
}

#btn-form div {
	float: right;
	margin-right: 130px;
}

#btn-form span {
	float: right;
	margin-right: 80px;
	margin-top: -36px;
}

#btn-form {
	padding-top: 40px;
}

#line {
	bottom: 50%;
}

#countDown_title {
	font-family: "Do Hyeon";
	font-size: 35px;
	color: #ff6064;
	padding-left: 15px;
}

#count_img {
	margin-top: 40px;
	margin-left: 170px;
}

#countDown {
	padding-left: 60px;
	font-size: 30px;
}

#countDown_content {
	height: 130px;
	background-color: rgb(236, 232, 232);
	border-top-left-radius: 20px;
	border-top-right-radius: 20px;
}

button:focus {
	outline: none;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		<section id="countDown_content">
			<img
				src="<%=request.getContextPath()%>/resources/images/countdown.png"
				id="count_img" class="img-size"> <span id="countDown_title">챌린지
				시작까지</span> <span id="countDown"></span>
		</section>

		<!-- 카운트 다운  -->
		<script>
        // 챌린지 시작일 세팅
        var countDownDate = new Date("<%= month%> <%=day%>, <%=year%> 00:00:00").getTime();
      
        // 1초마다 카운트 
        var x = setInterval(function() {
      
        // 현재 날짜/시간 가져오기 
        var now = new Date().getTime();
      
        // 챌린지 시작일 - 현재 날짜 
        var distance = countDownDate - now;
      
        // 일,시,분,초 계산
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      
        // 화면에 출력
        document.getElementById("countDown").innerHTML = days + "일 " + hours + "시간 "
        + minutes + "분 " + seconds + "초 ";
        
        // 카운트 끝날시 텍스트 대체
        if (distance < 0) {
          clearInterval(x);
          document.getElementById("countDown").innerHTML = "챌린지 오늘 시작";
          
        }
      }, 1000);
      </script>

		<section id="content-1">
			<img src="<%= ch.getChallFile()%>" id="call_img">
			<p id="chall_title"><%= ch.getChallTitle() %></p>
			<p id="chall_intro"><%= ch.getChallContent() %></p>
		</section>

		<section id="content-2">
			<p id="join_title1">챌린지 정보</p>
			<table id="join_table1">
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/user.png"
						class="img-size"></td>
					<td>방장 : <span><%=ch.getUserId()%></span><button id="warning_btn"> 신고하기</button></td>
				</tr>
				<tr>

					<td><img
						src="<%=request.getContextPath()%>/resources/images/member.png"
						class="img-size"></td>
					<td>참가인원 : <span style="color:#ff6064"><%= joinPeopleCnt %> </span><span style="color:#ff6064">/ </span><span style="color:#ff6064"><%= ch.getChallPeople() %> 명</span>
					</td>
				</tr>
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/payment.png"
						class="img-size"></td>
					<td>챌린지 금액 : <span><%= ch.getChallPay() %> 원</span></td>
				</tr>
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/date.png"
						class="img-size"></td>
					<td>챌린지 기간 : <span><%= ch.getChallPeriod() %></span></td>
				</tr>
			</table>
			<hr color=#ff6064 width="450px" id="line">
			
			
		<!-- 인증모아보기 갈때 challeng_no가져가기 -->
			<form id="confirmForm" method="post">
				<input type="hidden" name="cno" value="<%= ch.getChallNo() %>">	
				<input type="hidden" name="title" value="챌린지">  
			<p id="join_title2">챌린지 인증 방법 
			<!-- 인증보기 버튼 (참여중/종료)일때만 보이기 -->
			<% if(ch.getChallContent().equals("2") || ch.getChallContent().equals("3")){ %>
			<button id="challConfirm_btn">인증보기</button>
			<%} %>
			</p>
			</form>
			
			
			<table id="join_table2">
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/check.png"
						class="img-size"></td>
					<td>인증 빈도 : <span><%=ch.getChallFrequency() %></span></td>
				</tr>
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/camera.png"
						class="img-size"></td>
					<% for(int i = 0; i < confirm.length; i++)  {%>
						<% if(confirm[i] != null) { %>
					<td>인증 방법 : <span><%= confirm[i] %></span></td>
					<% }%>
				<% } %>
				</tr>
			</table>

			<section id="btn-form">
				<button id="chall_backBtn">목록으로</button>
				<button id="challenge_btn">챌린지 참가</button>
				<div>
					<button id="hits_btn">
					<!-- 찜하기 버튼 ('Y'일 경우 -> 찜완료 (채워진 하트)/ 'N'일 경우 다시 찜 삭제 (빈하트))  -->
					<% if(list != null && hits_status.equals("Y")) { %>
						<img
							src="<%=request.getContextPath()%>/resources/images/heart.png"
							class="heart_img">
						<%} else { %>
						<img
							src="<%=request.getContextPath()%>/resources/images/heart2.png"
							class="heart_img">
						<% } %>
					</button>
				</div>
				<span>찜하기</span>
			</section>
		</section>

		<!-- 목록으로 -->
		<script>
		// 목록으로 버튼 이벤트 
		const chall_backBtn = document.getElementById('chall_backBtn');
		chall_backBtn.addEventListener('click',function(){
			location.href='<%= request.getContextPath()%>/chall/list';
		});
		
		// 챌린지 참가하기 버튼 이벤트 (로그인 해야 참여가능)
			const challenge_btn = document.getElementById('challenge_btn');
			challenge_btn.addEventListener('click',function(){
				<% if(loginUser != null && (joinPeopleCnt < ch.getChallPeople())){ %>	
				location.href='<%= request.getContextPath()%>/chall/pay?challNo='+<%=ch.getChallNo()%>;
				<%} if(loginUser == null ) { %>
				alert('로그인 해야만 챌린지 참가가 가능합니다.');
				location.href="<%= request.getContextPath()%>/views/member/MemberLogin.jsp";
			<%} if(joinPeopleCnt == ch.getChallPeople()){%>
				alert('챌린지 인원 마감입니다!!!');
				location.href="<%= request.getContextPath()%>/chall/list";
			<%} if (chall_status == 1) {%>
				alert('이미 참여한 챌린지 입니다!!!');
				location.href="<%= request.getContextPath()%>/chall/list";
			<% } %>
			});
			
		
		//찜하기 버튼 ('Y'일 경우 -> 찜완료 / 'N'일 경우 다시 찜 삭제) 
		const hits_btn = document.getElementById('hits_btn');
		
		<% if(loginUser != null) { %>
		hits_btn.addEventListener('click',function(){
		<% if(list != null && hits_status.equals("Y")) { %>
			alert("찜 취소!");
			location.href='<%= request.getContextPath()%>/chall/hits?challNo='+<%=ch.getChallNo()%>;
		<% } else {%> 
			alert("찜 완료!");
			location.href='<%= request.getContextPath()%>/chall/hits?challNo='+<%=ch.getChallNo()%>;
		<% } %>	
		});
	<%} else {%>
			$("#hits_btn").attr("disabled", true);
	<%}%>
		
		</script> 
		
		<!-- form 태그를 post 방식으로 제출 신고대상, 챌린지번호, "챌린지" 이름을 화면에 드러내지 않고 form을 submit 하면서 넘길 수 있음-->
	<form id="warningForm" method="post">
		<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
		<input type="hidden" name="name" value="<%= ch.getUserId() %>"> 
		<input type="hidden" name="title" value="챌린지">  
	</form>
	
	<script>
	const warning_btn = document.getElementById('warning_btn');
	warning_btn.addEventListener('click',function(){
		$("#warningForm").attr("action", "<%= request.getContextPath()%>/chall/warning");
		$("#warningForm").submit();
	});
	
	//인증리스트보기
	const challConfirm_btn = document.getElementById('challConfirm_btn');
	challConfirm_btn.addEventListener('click',function(){
		$("#confirmForm").attr("action", "<%= request.getContextPath()%>/confirm/list");
		$("#confirmForm").submit();
	});
	</script>

	</section>

</body>
</html>