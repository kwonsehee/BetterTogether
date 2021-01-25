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
<title>Insert title here</title>

<!-- 결제 연동 jsp 경로 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
/* content 부분 */
#content-1 {
   margin-top:-40px;
   width: 100%;
   height: 85%;
}

#content-1 p {
   margin-left: 25px;
   margin-top: -1px;
   font-size: 25px;
   color: #ff6064;
   float: left;
}

#content-2 {
   margin-top:-120px;
   width: 100%;
   height: 15%;
}

#challenge_btn {
   font-family: "Do Hyeon";
   width: 130px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   float: right;
   font-size: 20px;
   margin-right: 370px;
   margin-top:40px;
}

#back_btn{
   font-family: "Do Hyeon";
   width: 130px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   float: left;
   font-size: 20px;
   margin-left: 350px;
   margin-top:40px;
   
}

#sec-1 {
   width: 15%;
   height: 20%;
}

#sec-1 img {
   margin-left: 50px;
   margin-top: -14px;
   width: 50px;
   height: 50px;
}

#sec-2 {
   width: 85%;
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
   margin-top: -70px;
   margin-bottom:15px;
}

#table-2, #table-3, #table-4 {
   font-family: "Do Hyeon";
   font-size: 20px;
   margin-top: 50px;
}


#pay_title{
   font-family: "Do Hyeon";
   font-size: 35px;
   margin-left:435px;
   margin-top:30px;
}

button:focus{
	outline:none;
}

#totalPay{
font-family: "Do Hyeon";
	width: 100px;
	height: 30px;
	border-radius: 10px;
	border: solid 1px  rgb(156, 154, 154);
	background-color: rgb(156, 154, 154);
	font-size: 20px;
	padding-bottom:7px;
	color:white;

}


</style>
</head>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>
	
   <section id="content" class="content_css">
   <form action="<%= request.getContextPath()%>/order/paySuccess" id="challNoForm" method="post">
      <p id="pay_title">결제정보</p>
      <section id="content-1">
         <br>
         <hr color=#ff6064 width="970px">
         <section id="sec-1">
            <p>페이백 정보</p>
            <br><img src="<%= request.getContextPath() %>/resources/images/offer.png">
         </section>
         <section id="sec-2">
            <table id="table-1">
               <tr>
                  <td>100% 성공 : 전액 페이백 + 상금</td>
               </tr>
               <tr>
                  <td>85% 이상 성공 : 전액 페이백</td>
               </tr>
               <tr>
                  <td>85% 미만 성공 : 부분 페이백</td>
               </tr>
            </table>
         </section>
         <hr color=#ff6064 width="970px">
         <section class="sec-3">
            <p>참가 비용 정보</p>
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
         
         <hr color=#ff6064 width="970px">
         
         <section class="sec-3">
            <p>결제 수단</p>
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
         <button type= submit id="challenge_btn">결제하기</button>
      </form>
   </section>
 


</body>
</html>