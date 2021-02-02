<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="challenge.model.vo.*, java.util.*, java.util.ArrayList, java.text.SimpleDateFormat, java.text.DateFormat"%>
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
	Date from = ch.getChallStart();
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	String startDate = transFormat.format(from);
	
	String year = startDate.substring(0, 4);
	String month = startDate.substring(5, 7);
	String day = startDate.substring(8, 10);
	
	
	// 오늘 날짜 구하기
	Date date= new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
	
	
	//진행중 : to < today < to + Integer.parseInt(ch.getChallPeriod())*7
	//종료 : today >= to + Integer.parseInt(ch.getChallPeriod())*7
	
	//시작날짜 + 기간
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance();
	cal.setTime(from); // 챌린지 시작일로 세팅 
	cal.add(Calendar.DATE, Integer.parseInt(ch.getChallPeriod())*7); // 챌린지 시작일 + 기간 세팅 
	String period = df.format(cal.getTime()); // 챌린지 시작일 + 기간 
	System.out.println("period(챌린지 끝나는 날): " + period); 
	
	// 시작전 : sysdate < chall_start
	int compare1 = today.compareTo(startDate); 
	// compare1 < 0
	
	// 진행중 : startDate < today(sysdate) < period(챌린지 끝나는 날)
	int compare = startDate.compareTo(today); 
	int compare2 = today.compareTo(period); 
	//compare < 0 && compare2 < 0

	// 종료 : period(챌린지 끝나는 날) <= today(sysdate)
	int compare3= period.compareTo(today);
	// compare3 < 0 

	// chall_status (참여중이면 이미 참여했다고 alert 띄우기)
	int chall_status = 0;
	if ((request.getAttribute("chall_status") != null)) {
		chall_status = Integer.parseInt((String.valueOf(request.getAttribute("chall_status"))));
	}

	int joinPeopleCnt = 0;
	if ((request.getAttribute("joinPeopleCnt") != null)) {
		joinPeopleCnt = Integer.parseInt((String.valueOf(request.getAttribute("joinPeopleCnt"))));
	}
	
	// 쨈 갯수 카운트
	int hits=0;
	if ((request.getAttribute("hits") != null)) {
		hits = Integer.parseInt((String.valueOf(request.getAttribute("hits"))));
	}
	
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
	width: 120px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 20px;
}

#challEnd_btn{
	font-family: "Do Hyeon";
	width: 120px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #aaa3a3;;
	background-color: #aaa3a3;;
	margin-left: 10px;
	margin-top: 10px;
	font-size: 20px;
	color:white;
}

#chall_backBtn {
	font-family: "Do Hyeon";
	width: 120px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	margin-left: 30px;
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
	margin-right: 155px;
}

#btn-form span {
	float: right;
	margin-right: 80px;
	margin-top: -42px;
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

#challEnd{
	font-family: "Do Hyeon";
	font-size: 35px;
	color: #ff6064;
	float:left;
	padding-top:35px;
	padding-left: 400px;
}

#challIng{
	font-family: "Do Hyeon";
	font-size: 35px;
	color: #ff6064;
	float:left;
	padding-top:35px;
	padding-left: 400px;
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
	<%if(compare < 0 && compare2 < 0){ %>
		<section id="countDown_content">
			<span id="challIng">챌린지 진행중</span>
		</section>
		<!-- 카운트 다운  -->
		<%} else if(compare3 < 0){ %>
			<section id="countDown_content">
			<span id="challEnd">챌린지 종료</span>
		</section>
		<% } else { %>
		<section id="countDown_content">
			<img
				src="<%=request.getContextPath()%>/resources/images/countdown.png"
				id="count_img" class="img-size"> <span id="countDown_title">챌린지
				시작까지</span> <span id="countDown"></span>
		</section>
		
		<script>
        // 챌린지 시작일 세팅
        var countDownDate = new Date("<%=month%> <%=day%> <%=year%> 00:00:00").getTime();
      
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
        
        // 카운트 진행중 & 종료 문구 바꾸기
     	
        
        if (distance < 0) {
          clearInterval(x);
          document.getElementById("countDown").innerHTML = "챌린지 오늘 시작";
          
        }
      }, 1000);
      </script>
    <% } %>

		<section id="content-1">
			<!-- width: 400px; height: 330px; -->
			<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 400px;height: 330px;">
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
					<td>방장 : <span><%=ch.getUserId()%></span>
					<%if(!(compare1 < 0)){ %>
					<% } else { %>
					<button id="warning_btn"> 신고하기</button></td>
					<% } %>
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
					<td>챌린지 기간 : <span><%= ch.getChallPeriod() %> 주</span></td>
				</tr>
			</table>
			<hr color=#ff6064 width="450px" id="line">
			
			
		<!-- 인증모아보기 갈때 challeng_no가져가기 -->
			<p id="join_title2">챌린지 인증 방법 
			<!-- 인증보기 버튼 (참여중/종료)일때만 보이기 -->
					<% if((compare < 0 && compare2 < 0) || compare3 < 0){ %>
					<button id="challConfirm_btn">인증보기</button>
					<%} else{%>
					<% } %>
			</p>
			
			
			<table id="join_table2">
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/check.png"
						class="img-size"></td>
					<td>인증 빈도 : <span>주 <%=ch.getChallFrequency() %>회</span>
					</td>
				</tr>
				<tr>
					<td><img
						src="<%=request.getContextPath()%>/resources/images/camera.png"
						class="img-size"></td>
					<td>인증 방법 : <span><%= ch.getChallConfirm() %></span></td>
				</tr>
			</table>

			<section id="btn-form">
				<button id="chall_backBtn">목록으로</button>
				<%if(compare3 < 0){%>
					<button id="challEnd_btn">챌린지 종료</button>
				<% } else{ %>
				<button id="challenge_btn">챌린지 참가</button>
				<%} %>
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
				<span>찜하기 +<%=hits %></span>
			</section>
		</section>

		<!-- 목록으로 -->
		<script>
		// 목록으로 버튼 이벤트 
		const chall_backBtn = document.getElementById('chall_backBtn');
		chall_backBtn.addEventListener('click',function(){
			location.href='<%= request.getContextPath()%>/chall/list';
		});
		

		// 챌린지 참가하기 버튼 이벤트
		<%if(compare3 < 0){%> // 종료일때 
			const challEnd_btn = document.getElementById('challEnd_btn');
			challEnd_btn.addEventListener('click',function(){
				alert('종료된 챌린지 입니다!!');
				location.href="<%= request.getContextPath()%>/chall/join?challNo="+<%=ch.getChallNo()%>;
			});
		<%} else {%> // 시작전, 진행중일때 
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
				location.href="<%= request.getContextPath()%>/chall/join?challNo="+<%=ch.getChallNo()%>;
			<% } if(compare < 0 && compare2 < 0) {%>
				alert('챌린지 진행중입니다!!');
				location.href="<%= request.getContextPath()%>/chall/join?challNo="+<%=ch.getChallNo()%>;
			<%}%>
			});
		<%}%>
			
		
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
		<input type="hidden" name="no" value="<%= ch.getChallNo() %>">
		<input type="hidden" name="reported_id" value="<%= ch.getUserId() %>"> 
		<input type="hidden" name="category" value="챌린지">  
	</form>
	
	<!-- 챌린지 인증보기 폼 태그 -->
	<form id="confirmForm" method="post">
		<input type="hidden" name="cno" value="<%= ch.getChallNo() %>">	
		<input type="hidden" name="title" value="챌린지">  
	</form>
	
	<script>
	const warning_btn = document.getElementById('warning_btn');
	warning_btn.addEventListener('click',function(){
		$("#warningForm").attr("action", "<%= request.getContextPath()%>/report/insertForm");
		$("#warningForm").submit();
	});
	
	</script>
	
	<script>
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
