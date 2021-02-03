<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="challenge.model.vo.Challenge"%>
<%
	Challenge ch = (Challenge)request.getAttribute("challenge");   
	Member m = (Member)session.getAttribute("loginUser");
	
	String name = m.getNickName();
	String email = m.getEmail();
	String phone = m.getPhone();
	
	// 참가인원 총 결제 금액
	int pplTotalPay = ch.getChallPay() * ch.getChallPeople();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>

<!-- 결제 연동 jsp 경로 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
/* content 부분 */
#content-1 {
	margin-top: -60px;
	width: 100%;
	height: 85%;
}

#content-1 p {
	margin-left: 10px;
	font-size: 25px;
	color: rgb(156, 154, 154);
	float: left;
}

#content-2 {
	margin-top: -120px;
	width: 100%;
	height: 15%;
}


#sec-1 {
	width: 30%;
	height: 20%;
}

#sec-2 {
	width: 70%;
	float: right;
}

.sec-3 {
	width: 20%;
}

.sec-3 img {
	margin-left: 50px;
	margin-top: -14px;
	width: 50px;
	height: 50px;
}

.sec-4 {
	width: 85%;
	height: 20%;
	float: right;
	margin-top: -100px;
}

#table-1 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-left: 20px;
	margin-top: -120px;
	margin-bottom: 15px;
}

#table-1 tr:nth-child(1) {
	font-size: 30px;
}

#table-2, #table-3, #table-4 {
	font-family: "Do Hyeon";
	font-size: 20px;
	margin-top: 50px;
}

#pay_title {
	width: 100%;
	height: 10%;
	text-align: center;
	font-size: 25px;
	font-weight: bolder;
	color: #252525b6
}

button:focus {
	outline: none;
}


#payBackInfo {
	font-family: "Do Hyeon";
	width: 320px;
	height: 30px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: white;
	font-size: 20px;
}

#challImg {
	width: 100px;
	height: 100px;
}

#sec-1 img {
	margin-left: 50px;
	margin-top: -14px;
	width: 250px;
	height: 150px;
}

.challInfo {
	font-family: "Do Hyeon";
	width: 80px;
	height: 30px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: white;
	font-size: 20px;
	margin-right: 10px;
}

/* 디자인 수정 */

#btSection {
	padding-bottom: 80px;
}

.line {
	border: 0.5px solid #937cf790;
}

#sec1 {
	margin-top: 2%;
	width: 50%;
	height: 100%;
	float: left;
	padding-left:4%;
}

#sec2 {
	margin-top: 2%;
	width: 50%;
	height: 100%;
	float: left;
	color:#616161b6;
	font-weight:bolder;
	padding-left:5%;
}

#sec1_tb {
	margin-left: 7%;
	border-radius: 5px;
	width:94.5%;
}

#chall_title {
	font-size: 15px;
	font-weight: bolder;
	color: #252525b6;
	padding-top: 2%;
	padding-bottom:2%;
	padding-left:3%;
}

#chall_freq {
	font-family: "Nanum Gothic";
	width: 70px;
	height: 30px;
	border-radius: 3px;
	border: solid 1px #e6e4e4b6;
	font-size: 11px;
	color: #616161b6;
	font-weight: bold;
	background-color: #e6e4e4b6;
	margin-top: 2%;
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
}

.challInfo_title{
	color: #937CF7;
	font-size: 20px;
	font-weight: bolder;
	padding-bottom:3%;
}

.chall_Icon{
	width: 25px;
	height: 25px;
	margin-right:1%;
}

#totalPay{
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #e0dbf890;
	padding: 5px 10px 5px 10px;
	background-color: #e0dbf890;
	font-size: 15px;
	font-weight: bolder;
	color: #252525b6;

}

#sec2_tb{
	margin:10px;
}

#payBack_content {
	margin-top: 2%;
	margin-bottom:4%;
	background-color: #e6e4e4;
	font-family: "Nanum Gothic";
	padding: 10px;
	width: 100%;
	height: 80%;
	font-size: 15px;
	font-weight: bolder;
}

#challenge_btn {
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
	
}

#back_btn {
	margin-top:5%;
	margin-left:16%;
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

input[type="radio"]{
	margin:2%;
}

.info{
	padding-bottom:3%;
}

</style>
</head>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>
	
   <section id="btSection" class="content_css">
   <form action="<%=request.getContextPath()%>/order/paySuccess" id="challNoForm" method="post">
      <p id="pay_title">결제정보</p>
      <div class="line"></div>
      
      <section id="sec1">
      <img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" style="width: 550px;height: 330px; margin-left:7%; margin-top:3%;">
      <table id="sec1_tb">
	      <tr>
				<td id="chall_title">[<%=ch.getCateName()%>] <%= ch.getChallTitle() %> <button id="chall_freq" disabled>주 <%=ch.getChallFrequency() %>회  <%=ch.getChallConfirm() %></button>
				<button id="chall_period" disabled><%=ch.getChallPeriod() %>주 동안</button></td>
		  </tr>
       </table>
      </section>
      
      <section id="sec2">
      <table id="sec2_tb">
      	<tr>
      		<td class="challInfo_title">참가 비용 정보</td>
      	</tr>
      	<tr>
      		<td class="info"><img src="<%=request.getContextPath()%>/resources/images/people.png" class="chall_Icon">참가 인원 총 금액  : <%=pplTotalPay %> 원</td>
      	</tr>
      	<tr>
      		<td id="chall_pay" class="info">
	      		<img src="<%=request.getContextPath()%>/resources/images/pay.png" class="chall_Icon">
			  	참가비 : <button id="totalPay" disabled><%= ch.getChallPay() %> 원</button>
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
			<td class="challInfo_title">결제 수단</td>
		</tr>
		<tr>
            <td>
                <form id="challNoForm" method="post">
				     <input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
                 	 <input type="radio" id="APIPay" name="payment" value="1" required>
                     <label>카카오페이</label>
                     <input type="radio" id="pointPay" name="payment" value="2" >
                     <label>포인트 결제</label> 
			    </form>
              </td>
         </tr>
      </table>
      </section>
      <button id="back_btn" type="button" onclick="javascript:history.back();">뒤로가기</button>
      <button type= submit id="challenge_btn">결제하기</button>
      <%-- <section id="content-1">
         <br>
         <section id="sec-1">
            <p>챌린지 정보</p>
            <hr color=#9c9a9a width="970px">
            <br><img src="<%= request.getContextPath()%>/resources/uploadFiles/<%= ch.getChallFile()%>" style="width: 250px;height: 150px;">
         </section>
         <section id="sec-2">
            <table id="table-1">
         		<tr>
         		<td><%=ch.getChallTitle() %></td>
         		</tr>
         		<tr>
         		<td><button class="challInfo"><%=ch.getChallFrequency() %></button><button class="challInfo"><%=ch.getChallPeriod() %></button></td>
         		</tr>
            </table>
         </section>
         <section class="sec-3">
            <p>참가 비용 정보</p>
            <hr color=#9c9a9a width="970px">
            <br> <img src="<%= request.getContextPath()%>/resources/images/member.png">
         </section>
         <section class="sec-4">
            <table id="table-2">
               <tr>
               	  <!-- 현재 참가 인원수 * 참가비 (추후수정) -->
                  <td>참가 인원 총 금액  : <span><%=pplTotalPay %> 원</span></td>
               </tr>
            </table>
         </section>
         
         <section class="sec-3">
            <br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
         </section>
         <section class="sec-4">
            <table id="table-3">
               <tr>
                  <td>참가비 : <button id="totalPay"><%= ch.getChallPay() %> 원</button> * 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
               </tr>
            </table>
         </section>
         
         <!-- 페이백 정보 -->
         <section class="sec-3">
            <br> <img src="<%= request.getContextPath()%>/resources/images/offer.png">
         </section>
         <section class="sec-4">
            <table id="table-3">
               <tr>
                  <td><button id="payBackInfo">달성률 85%만 되어도 참가비 전액 환급!</button></td>
               </tr>
            </table>
         </section>
         
         
         <section class="sec-3">
            <p>결제 수단</p>
            <hr color=#9c9a9a width="970px">
            <br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
         </section>
         <section class="sec-4">
            <table id="table-4">
               <tr>
                  <td>
                  <form id="challNoForm" method="post">
					<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
                 	 <input type="radio" id="APIPay" name="payment" value="1" required>
                     <label>카카오페이</label>
                     <input type="radio" id="pointPay" name="payment" value="2" >
                     <label>포인트 결제</label> 
			    	</form>
                  </td>
               </tr>
            </table>
         </section>
         
      </section>
         <button id="back_btn" type="button" onclick="javascript:history.back();">뒤로가기</button>
         <button type= submit id="challenge_btn">결제하기</button> --%>
         
      </form>
   </section>
 
	<%@ include file="../common/footer.jsp" %>

</body>
</html>