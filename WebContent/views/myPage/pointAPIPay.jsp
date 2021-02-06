<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList , refund.model.vo.*, member.model.vo.Member"%>
<%
	
	 
	int money =0;
	 

	//System.out.println("cafe_name1 : " + cafe_name);
	//System.out.println("cafe_phone1 : " + cafe_phone);

	Member m = (Member)session.getAttribute("loginUser");
	
	String userId = m.getUserId();
	String name = m.getNickName();
	String email = m.getEmail();
	String phone = m.getPhone();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%if(request.getAttribute("msg") != null){ 
	if(request.getAttribute("msg").equals("충전성공")){%>
<script>
	alert('포인트 충전이 완료되었습니다.');
	opener.parent.location.reload();
	window.close();
</script>
<%}else if(request.getAttribute("msg").equals("충전실패")){%>
<script>
	alert('포인트 충전에 실패하였습니다.');
	opener.parent.location.reload();
	window.close();
</script>
<%
}
	request.removeAttribute("msg");
}else{
	 money = Integer.parseInt((String.valueOf(request.getAttribute("money"))));
}
%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet"
	href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<style>

#btHeader{
    top: 0px;
}


 

.galleryArea {
	padding: 5px;
	width: 980px;
	min-height: 400px;
	margin: auto;
}





   
:root {
  --color-fur: #ffb141;
  --color-fur-dark: #F5832C;
  --color-spot: #F9584C;
  --color-snout: #544258;
  --color-collar: #3EAB6C;
  --duration: .7s;
  --semi-duration: calc(var(--duration) / 2);
  --easing: cubic-bezier(.5, 0, .5, 1);
  --stagger: calc(-1 * var(--semi-duration) / 2);
}

*, *:before, *:after {
  animation-timing-function: var(--easing) !important;
}

[class=🐕] {
  z-index: 1;
  height: 300px;
  width: 300px;
  display: flex;
  justify-content: center;
  align-items: center;
}
[class=🐕] * {
  position: absolute;
  will-change: transform;
}
[class=🐕]:before {
  content: "";
  position: absolute;
  bottom: 13.3333333333%;
  left: 0;
  width: 120%;
  height: 3.3333333333%;
  background-color: #D3D1D1;
  border-radius: 2px;
  animation: shadow calc(1 * var(--semi-duration)) infinite;
}
@keyframes shadow {
  from, to {
    transform: scaleX(0.75);
  }
  45%, 55% {
    transform: scaleX(0.5);
  }
}

.neck {
  width: 50%;
  height: 100px;
  right: -5px;
  bottom: calc(100% - 10px);
  transform-origin: center bottom;
  transform: rotate(15deg);
  z-index: 2;
}
.neck > .fur {
  border-bottom-left-radius: 10px;
  height: 100%;
  width: 100%;
}
.neck > .fur:before {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  height: 50px;
  width: 100%;
  background-color: var(--color-fur-dark);
  z-index: 1;
  transform-origin: right bottom;
  transform: rotate(15deg);
}

.collar {
  width: calc(100% + 10px);
  height: 15%;
  background-color: var(--color-collar);
  left: -5px;
  bottom: 30px;
  border-radius: 5px;
  animation: collar var(--semi-duration) calc(var(--semi-duration) / 4) infinite;
  z-index: 2;
}
@keyframes collar {
  from, to {
    transform: none;
  }
  50% {
    transform: translateY(-25%);
  }
}
.collar:after {
  content: "";
  width: 18%;
  height: 120%;
  border-radius: 50%;
  background: var(--color-snout);
  position: absolute;
  right: 0%;
  top: 110%;
  transform-origin: center top;
  animation: tag var(--semi-duration) infinite both;
}
@keyframes tag {
  from, to {
    transform: rotate(-15deg);
  }
  50% {
    transform: rotate(-15deg) scaleY(1.5);
  }
}

.head {
  height: 80%;
  width: 145%;
  left: -2%;
  bottom: 50%;
  transform-origin: left center;
  z-index: 2;
  animation: head var(--semi-duration) calc(var(--semi-duration) / 4) infinite;
}
@keyframes head {
  from, to {
    transform: rotate(-10deg);
  }
  50% {
    transform: rotate(-15deg);
  }
}
.head > .fur {
  height: 100%;
  width: 100%;
  border-bottom-right-radius: 80px;
}
.head > .fur:before {
  content: "";
  position: absolute;
  top: -80%;
  left: -30%;
  width: 100%;
  height: 0;
  padding-top: 100%;
  background-color: var(--color-spot);
  z-index: 1;
  border-radius: 50%;
}

.snout {
  --color: var(--color-snout);
  width: 25%;
  height: 0;
  padding-top: 25%;
  background-color: var(--color);
  top: 0;
  right: -5px;
  border-bottom-left-radius: 100%;
  z-index: 1;
}

.ears {
  bottom: 40%;
  height: 100%;
  width: 30%;
  left: 0;
  z-index: -1;
}

.ear {
  --color: var(--color-spot);
  width: 100%;
  height: 100%;
  bottom: 0;
  left: 0;
  transform-origin: left bottom;
  transform: rotate(-10deg);
  animation: ear-front calc(var(--duration) / 2) infinite;
}
@keyframes ear-front {
  50% {
    transform: rotate(-15deg);
  }
}
.ear:before {
  content: "";
  position: absolute;
  height: 25px;
  width: 15px;
  z-index: 2;
  top: -2px;
  right: -7px;
  border-top-left-radius: 100%;
  border-width: 2px;
  border-color: transparent;
  border-style: solid;
  border-left: 2px solid var(--color-snout);
  transform-origin: bottom left;
  animation: ear-mark var(--semi-duration) calc(-1 * var(--semi-duration)) infinite;
}
@keyframes ear-mark {
  from, to {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(25deg);
  }
}
.ear > .fur {
  border-top-left-radius: 100%;
  height: 100%;
  width: 100%;
}
.ear:nth-child(2) {
  left: 15px;
  bottom: 5px;
  transform: rotate(-5deg);
  --color: var(--color-fur);
  z-index: -1;
  animation: ear-back calc(var(--duration) / 2) infinite both;
}
@keyframes ear-back {
  from, to {
    transform: rotate(0deg);
  }
  50% {
    transform: rotate(-10deg);
  }
}

.eye {
  --size: 6%;
  --color: var(--color-snout);
  width: var(--size);
  height: 0;
  padding: var(--size);
  left: 35%;
  top: 20%;
  border-radius: 50%;
  background-color: var(--color);
  z-index: 1;
}
.eye:before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border-radius: 50%;
  background-color: var(--color);
  z-index: 1;
}
.eye:after {
  content: "";
  width: 100%;
  height: 100%;
  position: absolute;
  left: -50%;
  top: -50%;
  border-top-left-radius: 100%;
  border-width: 2px;
  border-color: var(--color);
  border-style: solid;
  border-bottom-color: var(--color-spot);
  border-right-color: var(--color-spot);
  transform: scale(1.25);
  z-index: 0;
}

.torso {
  width: 56.6666666667%;
  height: 33.3333333333%;
  animation: torso var(--semi-duration) both infinite;
}
@keyframes torso {
  from, to {
    transform: none;
  }
  50% {
    transform: translateY(15%);
  }
}
.torso > .fur {
  height: 100%;
  width: 185px;
  border-top-left-radius: 40px;
  transform-origin: left center;
  transform: rotate(-20deg) translateY(10px);
  z-index: 1;
}
.torso > .fur:after {
  height: 100%;
  width: 100%;
  border-bottom-left-radius: 200px 85px;
  border-bottom-right-radius: 100px;
}
.torso > .legs {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
.torso .spot {
  width: 120px;
  height: 120px;
  bottom: 40px;
  left: -20px;
  border-radius: 50%;
  background-color: var(--color-spot);
  z-index: 1;
  animation: spot var(--duration) calc(-1 * var(--semi-duration)) both infinite;
}
@keyframes spot {
  from, 66%, to {
    transform: none;
  }
  33% {
    transform: translateX(10px);
  }
}
.torso .spot:after {
  content: "";
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background-color: inherit;
  position: absolute;
  bottom: -10px;
  right: 5px;
}
.torso > .tail {
  --color: var(--color-spot);
  bottom: calc(100% - 15px);
  left: 0;
  transform-origin: center bottom;
  transform: rotate(-45deg);
}

.tail {
  height: 15px;
  width: 20px;
  background-color: var(--color);
  border-top-right-radius: 10px 100%;
  border-top-left-radius: 10px 100%;
  animation: tail var(--semi-duration) infinite;
}
@keyframes tail {
  from, to {
    transform: rotate(-45deg) translateX(-15%);
  }
  50% {
    transform: rotate(-25deg) translateX(15%);
  }
}
.tail > .tail {
  bottom: calc(90%);
  transform-origin: bottom left;
  transform: rotate(-10deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  animation: tail-inner var(--semi-duration) var(--stagger) infinite;
}
@keyframes tail-inner {
  from, to {
    transform: rotate(-10deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  }
  50% {
    transform: rotate(5deg) translateY(50%) scaleX(0.8) scaleY(0.9);
  }
}

.legs > .leg {
  bottom: 5px;
  --color: var(--color-fur);
}
.legs > .leg:nth-child(1), .legs .leg:nth-child(3) {
  right: 15px;
}
.legs > .leg:nth-child(3), .legs > .leg:nth-child(4) {
  --color: var(--color-fur-dark);
  z-index: -1;
}
.legs > .leg:nth-child(1), .legs .leg:nth-child(4) {
  --delay: 0s;
}
.legs > .leg:nth-child(2), .legs > .leg:nth-child(3) {
  --delay: calc(-1 * var(--duration) / 2 ) ;
}
.legs > .leg:nth-child(2) {
  left: 0;
}
.legs > .leg:nth-child(4) {
  left: 0;
}

.leg {
  position: absolute;
  height: 65px;
  width: 45px;
  background-color: var(--color);
  transform-origin: center 5px;
  animation: leg infinite var(--duration) var(--delay, 0s);
}
.leg > .leg-inner {
  animation: leg-inner infinite var(--duration) calc(var(--delay));
  transform: rotate(90deg);
}
@keyframes leg-inner {
  from, to {
    transform: none;
  }
  33% {
    transform: rotate(70deg);
  }
  76% {
    transform: none;
  }
}
@keyframes leg {
  from, to {
    transform: none;
  }
  33% {
    transform: rotate(-55deg);
  }
  66% {
    transform: rotate(-20deg);
  }
}
.leg > .fur {
  width: 144.4444444444%;
  height: 100%;
}
.leg > .fur:after {
  width: 45px;
  bottom: 0;
  top: initial;
  transform: rotate(15deg);
}

.fur {
  position: absolute;
  overflow: hidden;
}
.fur:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 150%;
  top: 0;
  left: 0;
  background-color: var(--color, var(--color-fur));
  transform-origin: center bottom;
}

.leg-inner {
  position: absolute;
  height: 65%;
  width: 100%;
  top: calc(100%);
  transform-origin: center top;
}
.leg-inner:before {
  content: "";
  width: 45px;
  height: 45px;
  background-color: var(--color);
  position: absolute;
  border-radius: 50%;
  top: -22.5px;
}
.leg-inner > .fur {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  overflow: hidden;
}
.leg-inner > .fur:after {
  content: "";
  position: absolute;
  width: 100%;
  height: 150%;
  top: 0;
  left: 0;
  background-color: var(--color);
  transform-origin: center top;
  transform: rotate(15deg);
}

html,
body {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  background-color: #E3E3E3;
}

body {
  display: flex;
  justify-content: center;
  align-items: center;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  position: relative;
}
</style>
</head>
<body>
 
	
	<section id="btSection" class="btSection">
	
	
	<div class="galleryArea" >
	
	 <br><br>
	 <h1 style="text-align: center">포인트 결제가 진행중입니다 잠시만 기달려주세요</h1>
	 <MARQUEE DIRECTION="right" style="height:500px;   ">
	  <div class="🐕"    style="height: 430px;">
        <div class="torso">
          <div class="fur">
            <div class="spot"></div>
          </div>
          <div class="neck">
            <div class="fur"></div>
            <div class="head">
              <div class="fur">
                <div class="snout"></div>          
              </div>
              <div class="ears">
                <div class="ear">
                  <div class="fur"></div>
                </div>
                <div class="ear">
                  <div class="fur"></div>
                </div>
              </div>
              <div class="eye"></div>
            </div>
            <div class="collar">
              
            </div>
          </div>
          <div class="legs">
            <div class="leg">
              <div class="fur"></div>
              <div class="leg-inner">
                <div class="fur"></div>
              </div>
            </div>
            <div class="leg">
              <div class="fur"></div>
              <div class="leg-inner">
                <div class="fur"></div>
              </div>
            </div>
            <div class="leg">
              <div class="fur"></div>
              <div class="leg-inner">
                <div class="fur"></div>
              </div>
            </div>
            <div class="leg">
              <div class="fur"></div>
              <div class="leg-inner">
                <div class="fur"></div>
              </div>
            </div>
          </div>
          <div class="tail">
            <div class="tail">
              <div class="tail">
                <div class="tail -end">
                  <div class="tail">
                    <div class="tail">
                      <div class="tail">
                        <div class="tail"></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</MARQUEE>

  
</div>
		
      
	</section> 

        <script>
	
	$(function(){
		 var IMP = window.IMP; // 생략가능
	       IMP.init('imp37495715'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       
	       IMP.request_pay({
	           pg : 'kakaopay',
	           pay_method : 'card',
	           merchant_uid : 'merchant_' + new Date().getTime(),
	           name : 'Better Together 포인트충전',
	           amount : <%= money  %>,
	           buyer_email : '<%=email%>',
	           buyer_name : '<%=name%>',
	           buyer_tel : '<%=phone%>',
	           buyer_addr : '',
	           buyer_postcode : '123-456',
	           //m_redirect_url : 'http://www.naver.com'
	       }, function(rsp) {
	    	   console.log(rsp);
	          if (rsp.success) { 
	                  var msg = '결제가 완료되었습니다.';
	                  msg += '\n고유ID : ' + rsp.imp_uid;
	                  msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                  msg += '\n결제 금액 : ' + rsp.paid_amount;
	                  msg += '\n카드 승인번호 : ' + rsp.apply_num;
	                 location.href="<%=request.getContextPath()%>/point/charging?money=<%=money%>&userId=<%= userId %>";
	                 
	              
	          } else {
	               var msg = '결제에 실패하였습니다.';
	               msg += '에러내용 : ' + rsp.error_msg;
	               //실패시 이동할 페이지 
	               <%--  location.href="<%=request.getContextPath()%>/commu/main";  --%>
	              window.close();
	           } 
	           alert(msg);
	       });		
		
	});
	
 

</script>
       
   
       
       
	


</body>
</html>