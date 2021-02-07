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
<title>Better Together</title>
<style>

#btSection {
	padding-bottom: 50px;
}


/*챌린지 정보 부분 css*/
#challInfo_content {
	font-family: "Nanum Gothic";
	float: left;
	margin-left: 25%;
	padding-top: 10px;
}

#challInfo_tb {
	width: 160%;
}

#check_img {
	width: 20px;
	height: 20px;
}

#info1 {
	font-size: 15px;
	color: #616161b6;
	font-weight: bolder;
}

#chall_title {
	font-size: 20px;
	font-weight: bolder;
	color: #252525b6;
	padding-top: 1%;
}

#chall_freq {
	font-family: "Nanum Gothic";
	width: 100px;
	height: 30px;
	border-radius: 3px;
	border: solid 1px #e6e4e4b6;
	font-size: 11px;
	color: #616161b6;
	font-weight: bold;
	background-color: #e6e4e4b6;
	margin-top: 2%;
	margin-right: 1%;
}

#chall_period {
	font-family: "Nanum Gothic";
	width: 60px;
	height: 30px;
	border-radius: 3px;
	border: solid 1px #e6e4e4b6;
	font-size: 11px;
	color: #616161b6;
	font-weight: bold;
	background-color: #e6e4e4b6;
	margin-top: 2%;
	margin-right: 2%;
}

#chall_date {
	font-size: 17px;
	color: #937CF7;
	font-weight: bolder;
}

#chall_confirm {
	margin-top: 3%;
	background-color: #808080b6;
	font-size: 18px;
	border: solid 1px #808080b6;
	border-radius: 3px;
	color: white;
}

#challLine {
	margin-top: 4%;
	border: 0.5px solid #937cf790;
	background-color: #937CF7;
}

#chall_ppl {
	color: #252525b6;
	font-size: 20px;
	font-weight: bolder;
	padding-top: 4%;
}

.chall_Icon {
	margin-right: 1%;
	width: 35px;
	height: 35px;
}

#chall_pay {
	padding-top: 2%;
	color: #252525b6;
	font-size: 20px;
	font-weight: bolder;
}

#payBack_content {
	margin-top: 5%;
	background-color: #e6e4e4;
	font-family: "Nanum Gothic";
	padding: 10px;
	width: 100%;
	height: 80%;
	font-size: 15px;
	font-weight: bolder;
}

#challInfo_title {
	padding-top: 2%;
	color: #937CF7;
	font-size: 22px;
	font-weight: bolder;
}

.challinfo1 {
	padding-top: 2%;
	color: #252525b6;
	font-size: 15px;
	font-weight: bolder;
}

/* 버튼 css*/
#challenge_btn {
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 6px 5px 6px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

#challEnd_btn {
	width: 80px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 6px 5px 6px;
	background-color: #aaa3a3;;
	font-size: 10px;
	color: white;
}

#chall_backBtn {
	width: 80px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

#challConfirm_btn {
	width: 60px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #b6a8f5;
	padding: 5px 10px 5px 10px;
	background-color: #b6a8f5;
	font-size: 10px;
	font-weight: bolder;
	color: white;
}

#warning_btn {
	width: 60px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #b6a8f5;
	padding: 5px 10px 5px 10px;
	background-color: #b6a8f5;
	font-size: 10px;
	font-weight: bolder;
	color: white;
}

#call_img {
	margin-left: 25%;
	padding-top: 30px;
}

#chall_intro {
	font-size: 20px;
	text-align: center;
	color: rgb(168, 167, 167);
}


.heart_img {
	width: 25px;
	height: 25px;
}

#hits_btn {
	border: #f9f1f1;
	outline: none;
}

#btn-form div {
	float: right;
}

#btn-form {
	float: left;
	padding-top: 20px;
	margin-left: 60%;
	padding-bottom:20px;
}

#btn-form span{
	font-family: "Nanum Gothic";
	font-size:15px;
	color: #252525b6;
	float:right;
	font-weight:bolder;
}

#line {
	bottom: 50%;
}

#countDown_title {
	font-family: "Nanum Gothic";
	font-size: 20px;
	color: #937CF7;
	padding-left: 15px;
	font-height: bolder;
}

/* 챌린지 진행중 text */
#challIng{
	font-family: "Nanum Gothic";
	font-size: 20px;
	color: #937CF7;
	padding-left: 40%;
	font-height: bolder;
}

/* 챌린지 종료 text */
#challEnd{
	font-family: "Nanum Gothic";
	font-size: 20px;
	color: #808080b6;
	padding-left: 45%;
	font-height: bolder;
}

#count_img {
	margin-left: 170px;
	height: 25px;
	width: 25px;
}

#countDown {
	margin-left: 1%;
	font-height: bolder;
}

#countDown_content {
	background-color: #e6e4e4;
	font-family: "Nanum Gothic";
	width: 55.5%;
	margin-left: 25%;
	padding: 10px;
}

#challenge_btn:focus, #chall_backBtn:focus {
	outline: none;
	border: solid 1px #937CF7;
	background-color: #e0dbf890;
}

#challConfirm_btn:focus, #warning_btn:focus, #challEnd_btn:focus{
	outline:none;
}

#ppl_btn{
	color:#616161b6;
	border:none;
	outline:none;
}

</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

	<section id="btSection" class="content_css">
	
	<!-- 챌린지 모집 이미지 -->
	<%if(compare3 < 0){ %>
	<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 700px;height: 400px; -webkit-filter: grayscale(100%); filter: gray;">
	<%} else { %>
	<img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" id="call_img" style="width: 700px;height: 400px;">
	<%}  %>
	
	<!-- 챌린지 시작일에 맞춤 -->
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

		<section id="challInfo_content">
		<table id="challInfo_tb">
			<tr>
				<td id="info1"><img src="<%=request.getContextPath()%>/resources/images/challCheck.png" id="check_img"> 공식 챌린지</td>
			</tr>
			<tr>
				<td id="chall_title"><%= ch.getChallTitle() %></td>
			</tr>
			<tr>
				<td>
				<button id="chall_freq" disabled>주 <%=ch.getChallFrequency() %>회  <%=ch.getChallConfirm() %></button>
				<button id="chall_period" disabled><%=ch.getChallPeriod() %>주 동안</button>
				<span id="chall_date"><%=ch.getChallStart() %> ~ <%=period %></span>
				</td>
			</tr>
			<tr>
				<td><button id="chall_confirm" disabled>(<%=ch.getChallConfirm() %>) <%=ch.getChallPeriod() %>주 동안, 하루에 인증샷을 한번 찍어야해요!</button></td>
			</tr>
			<tr>
				<td><div id="challLine"></div></td>
			</tr>
			<tr>
				<td id="chall_ppl">
					<img src="<%=request.getContextPath()%>/resources/images/people.png" class="chall_Icon">
					참가인원 : <span style="color:#937CF7; font-size:20px;"><%= joinPeopleCnt %></span> / <span style="color:#252525b6; font-size:20px;"><%= ch.getChallPeople() %></span>명
					<button id="ppl_btn"> > </button>
				</td>
			</tr>
			<tr>
				<td id="chall_pay">
					<img src="<%=request.getContextPath()%>/resources/images/pay.png" class="chall_Icon">
					참가금액 : <%=ch.getChallPay() %> 원
				</td>
			</tr>
			<tr>
				<td>
					<div id="payBack_content">
						<button id="100per" style="background-color:#937cf790;border: solid 1px #937cf790;">100% 성공</button> : <button class="100per" style="background-color:#937cf790;border: solid 1px #937cf790;">전액 페이백 + 상금(85%미만 사람들의 돈 분할)</button><br><br>
						85% 이상 성공 : 전액 페이백<br><br>
						85% 미만 : 페이백 & 상금 둘다 없음 
					</div>
				</td>
			</tr>
			<tr>
				<td><div id="challLine"></div></td>
			</tr>
			<tr>
				<td id="challInfo_title">챌린지 정보</td>
			</tr>
			<tr>
				<td class="challinfo1">방장 : <%=ch.getUserId() %>
				<!-- 시작전만 신고하기 버튼 보이게 -->
				<%if(!(compare1 < 0)){ %>
					<% } else { %>
					<button id="warning_btn"> 신고하기</button></td>
					<% } %>
			</tr>
			<tr>
				<td class="challinfo1">인증 빈도 : 주 <%=ch.getChallFrequency() %>회</td>
			</tr>
			<tr>
				<td class="challinfo1">하루 인증 횟수 : 자유 (단, 모두 1회로 간주)
				<% if((compare < 0 && compare2 < 0) || compare3 < 0){ %>
					<button id="challConfirm_btn">인증보기</button>
					<%} else{%>
					<% } %>
				</td>
			</tr>
			<tr>
				<td class="challinfo1">금액 : <%=ch.getChallPay() %> 원</td>
			</tr>
		</table>

		</section>
		
		
		<!-- 버튼 -->
		
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
					<span>찜하기 +<%=hits %></span>
				</div>
			</section> 

		<!-- 버튼 이벤트-->
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
	
	<script>
	// 참가인원 보기 
	const ppl_btn = document.getElementById('ppl_btn');
	ppl_btn.addEventListener('click',function(){
	 	
		var url = '<%=request.getContextPath()%>/chall/ppl?challNo=<%=ch.getChallNo()%>';
		
		// 팝업 가운데에 띄우기
		var popupWidth = 250;
		var popupHeight = 200;

		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height / 2) - (popupHeight / 2);
		// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
		
		window.open(url , "참가인원 전체 보기",  'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
	});
	
	</script>

	</section>
	
	<%@ include file="../common/footer.jsp" %>
	

</body>
</html>
