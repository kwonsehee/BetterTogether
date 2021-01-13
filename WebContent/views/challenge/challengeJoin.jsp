<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        #content-1 {
            margin-top:10px;
            padding-top: 5px;
            width: 50%;
            height: 70%%;
            float: left;

        }

        #content-2 {
        	margin-top:10px;
            width: 50%;
            height: 70%;
            float: left;
        }

        #challenge_btn {
            font-family: "Do Hyeon";
            width: 170px;
            height: 50px;
            border-radius: 20px;
            border: solid 1px #fdc8c6;
            background-color: #fdc8c6;
            margin-left: 180px;
            margin-top: 10px;
            font-size: 20px;
        }


        #call_img {
            width: 400px;
            height: 330px;
            padding-left: 50px;
            padding-top: 30px;
        }
        
        #chall_title{
        	font-size: 25px;
            text-align: center;
        }
        
        #chall_intro{
        	font-size:20px;
            text-align: center;
         	color:rgb(168, 167, 167);

        }

        #content-2 p {
            font-size: 25px;
            color: #ff6064;
            padding-left: 30px;
        }
        
         #join_title1{
            bottom: 67%;
        }
        
        #join_title2{
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

        #heart_img {
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
            margin-right: 90px;
        }

        #btn-form span {
            float: right;
            margin-right: 40px;
            margin-top: -36px;
        }
        
        #btn-form{
        	padding-top:40px;
        }
        
        #line{
        	bottom:50%;
        }
        
        #countDown_title{
           font-family: "Do Hyeon";
           font-size:35px;
           color: #ff6064;
           padding-left:15px;
        }
        
        #count_img{
        	margin-top:40px;
        	margin-left:170px;
        }
        
        #countDown {
        	padding-left:60px;
        	font-size:30px;
        }
        
        #countDown_content{
        	height:130px;
        	background-color:rgb(236, 232, 232);
        	border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }
        
    </style>
</head>
<body>
<%@ include file="../common/common_ui.jsp"%>

<section id="content" class="content_css">
		<section id="countDown_content">
			<img src="<%=request.getContextPath()%>/resources/images/countdown.png" id="count_img" class="img-size">
			<span id="countDown_title">챌린지 시작까지</span>
			<span id="countDown"></span>
		</section>
		
		<!-- 카운트 다운  -->	
		<script>
		  // 챌린지 시작일 세팅
		  var countDownDate = new Date("Feb 10, 2021 15:37:25").getTime();
		
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
        	<img src="<%=request.getContextPath()%>/resources/images/sample.png" id="call_img">
            <p id="chall_title">6 : 00 기상하기</p>
            <p id="chall_intro">일찍 일어나는 습관을 가져보아요!~</p>
        </section>

        <section id="content-2">
            <p id="join_title1">챌린지 정보</p>
            <table id="join_table1">
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/user.png" class="img-size"></td>
                    <td>방장 : <span>user 1</span></td>
                </tr>
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/member.png" class="img-size"></td>
                    <td>참가인원 : <span>3 </span><span>/ </span><span>4</span> 명</td>
                </tr>
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/payment.png" class="img-size"></td>
                    <td>챌린지 금액 : <span>10,000 원</span></td>
                </tr>
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/date.png" class="img-size"></td>
                    <td>챌린지 기간 : <span>3 주</span></td>
                </tr>
            </table>
            <hr color=#ff6064 width="450px" id="line">
            <p id="join_title2">챌린지 인증 방법</p>
            <table id="join_table2">
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/check.png" class="img-size"></td>
                    <td>인증 빈도 : <span>주 3회</span></td>
                </tr>
                <tr>
                    <td><img src="<%=request.getContextPath()%>/resources/images/camera.png" class="img-size"></td>
                    <td>인증 방법 : <span>세면대 물 틀고 [손 씻는] 사진 찍기 </span></td>
                </tr>
            </table>

            <form method="POST" id="btn-form">
                <button id="challenge_btn"><a href="challengePayment.html">챌린지 참가하기</a></button>
                <div>
                    <button id="hits_btn"><img src="<%=request.getContextPath()%>/resources/images/heart.png" id="heart_img"></button>
                </div>
                <span>찜하기</span>
            </form>
        </section>

    </section>

</body>
</html>