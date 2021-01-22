<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="challenge.model.vo.Challenge"%>
<%
	Challenge ch = (Challenge)request.getAttribute("challenge");   
	Member m = (Member)session.getAttribute("loginUser");
	
	String name = m.getNickName();
	String email = m.getEmail();
	String phone = m.getPhone();

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
   margin-right: 430px;
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
   margin-left: 290px;
}

#list_btn{
   font-family: "Do Hyeon";
   width: 130px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   float: right;
   font-size: 20px;
   margin-right: 280px;
   margin-top: -49px;
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
   margin-top: -110px;
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

</style>
</head>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>

   <section id="content" class="content_css">
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
                  <td>참가 인원 총 금액  :<span> 40,000 원 </span></td>
               </tr>
            </table>
         </section>
         
         <section class="sec-3">
            <br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
         </section>
         <section class="sec-4">
            <table id="table-3">
               <tr>
                  <td>참가비 : <span><%= ch.getChallPay() %> 원</span> * 챌린지가 끝나면 최종 달성률에 비례해 전액/부분 환급 가능!</td>
               </tr>
            </table>
         </section>
         
         <hr color=#ff6064 width="970px">
         
         <section class="sec-3">
            <p>최종 결제</p>
            <br> <img src="<%= request.getContextPath()%>/resources/images/payment.png">
         </section>
         <section class="sec-4">
            <table id="table-4">
               <tr>
                  <td>총 결제 금액 : <span><%= ch.getChallPay() %> 원 </span></td>
               </tr>
            </table>
         </section>
         
      </section>

      <section id="content-2">
         <button id="back_btn" type="button" onclick="javascript:history.back();">뒤로가기</button>
         <!-- 결제 버튼 (API) 추후 수정-->
         <button id="challenge_btn">결제하기</button>
         <button id="list_btn">완료</button>
      </section>
   </section>
   
   <!-- 결제 API -->
   
   <script>
   
   const challenge_btn = document.getElementById("challenge_btn");
   challenge_btn.addEventListener('click',function(){
	   var IMP = window.IMP; // 생략가능
       IMP.init('imp63477997'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
       
       IMP.request_pay({
           pg : 'kakaopay',
           pay_method : 'card',
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : 'Better Together 챌린지 결제',
           amount : <%=ch.getChallPay()%>,
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
                //성공시 이동할 페이지
                //location.href="<%=request.getContextPath()%>/order/paySuccess?challNo="+<%=ch.getChallNo()%>;
          } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
               //실패시 이동할 페이지
               location.href="<%=request.getContextPath()%>/order/payFail";
           } 
           alert(msg);
       });
      
   });
   
   </script>
   
    <!-- form 태그를 post 방식으로 제출 
	challNo를 화면에 드러내지 않고 form을 submit 하면서 넘길 수 있음-->
	<form id="challNoForm" method="post">
		<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>"> 
	</form>
	
	<!-- 결제 후 완료 버튼 누르기 (챌린지현황에 회원 참여중으로 update됨) -->
	<script>
	const list_btn = document.getElementById('list_btn');
	list_btn.addEventListener('click',function(){
		alert("결제완료!");
		$("#challNoForm").attr("action", "<%= request.getContextPath()%>/order/paySuccess");
		$("#challNoForm").submit();
	});
	
	</script>
	

</body>
</html>