<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="challenge.model.vo.Challenge, member.model.vo.Member"%>
<%
	// 1:카카오페이 받기위해 
	int payment = Integer.parseInt((String.valueOf(request.getAttribute("payment"))));
	
	// 결제할 챌린지 넘버 받기위해
	//int challNo = Integer.parseInt((String.valueOf(request.getAttribute("challNo"))));
	
	// 해당 챌린지의 결제 정보 알아오기 위해 
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet"
	href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<style>
#listbtn {
	font-family: "Do Hyeon";
	width: 150px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	font-size: 20px;
	margin-top: 20px;
}

#msg_content {
	padding-top: 20px;
	font-size: 30px;
	font-family: "Do Hyeon";
}

button:focus {
	outline: none;
}

#pay_content {
	margin-top: 50px;
	height: 420px;
	width: 420px;
	background-color: #fdc8c6;
	border-radius: 20px;
}

#pay_table tr {
	font-family: "Do Hyeon";
	font-size: 15px;
}

#pay_table td {
	padding: 10px;
}

#pay_table {
	background-color: white;
	padding: 20px;
	border-radius: 20px;
}

.pay_img {
	margin-right: 10px;
	margin-left: 10px;
	width: 20px;
	height: 20px;
}

#paySuccessBtn {
	font-family: "Do Hyeon";
	width: 130px;
	height: 50px;
	border-radius: 20px;
	border: solid 1px #fdc8c6;
	background-color: #fdc8c6;
	float: left;
	font-size: 20px;
	margin-left: 430px;
	margin-top: 40px;
}
</style>
</head>
<body>
	<%@ include file="../common/common_ui.jsp"%>

<%-- 	<form method="POST" id="payForm">
		<input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
		<input type="hidden" name="payment" value="<%= payment %>">
	</form>
 --%>
	<section id="content" class="content_css">
	</section> 


	<script>
	$(function(){
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
		              location.href="<%=request.getContextPath()%>/pay/insert?challNo=<%= ch.getChallNo()%>&payment=<%= payment%>";
	          } else {
	               var msg = '결제에 실패하였습니다.';
	               msg += '에러내용 : ' + rsp.error_msg;
	               //실패시 다시 메인페이지로 이동
	               location.href="<%= request.getContextPath()%>/commu/main";
	           } 
	           alert(msg);
	       });		
		
	});
	
	// response.sendRedirect(request.getContextPath() + "/chall/join?challNo="+challNo);


</script>

<%-- 
	<script>
	const paySuccessBtn = document.getElementById('paySuccessBtn');
	paySuccessBtn.addEventListener('click',function(){
		alert("챌린지 참여가 되었습니다!!");
		$("#payForm").attr("action", "<%= request.getContextPath()%>/pay/insert");
		$("#payForm").submit();
	});
	
	</script> --%>


</body>
</html>