<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="challenge.model.vo.Challenge, member.model.vo.Member"%>
<%

	// 2: 결제 수단 -> 포인트 결제
	int payment = Integer.parseInt((String.valueOf(request.getAttribute("payment"))));
	
	// 결제할 챌린지 넘버 받기위해
	//int challNo = Integer.parseInt((String.valueOf(request.getAttribute("challNo"))));
	
	// 해당 챌린지의 결제 정보 알아오기 위해 
	Challenge ch = (Challenge)request.getAttribute("challenge");  

	Member m = (Member)session.getAttribute("loginUser");

	String userId=m.getUserId();
	String userPwd=m.getUserPwd();
	int money = m.getPoint();
	
	// 남은 금액 가져오기
	int remainPay = m.getPoint() - ch.getChallPay();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환급페이지</title>
<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%=session.getAttribute("msg") %>');
	
</script>
<%
	session.removeAttribute("msg");
 	}
%>
<style>
        .line{
            float: left;
            width: 100%;
            height: 7px;
            background-color: rgba(255, 96, 100, 0.7);
            margin-top: 15px;
        }
        .pointPay_box{
            width: 560px;
            height: 80%;
            float: left;
        }
        #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 30px;
            text-align: center;
            margin-top: 30px;
        }
        
        #pointPay, #pointPay button, #pointPay tr{
            font-family: "Do Hyeon";
            font-size: 20px;
        }
        #pointPay button{
            width: 120px;
            height: 50px;
            border-radius: 20px;
            border: #f7dede;
            background-color: #f7dede;
            margin-top: 30px;
        }
        #content-2{
            padding-left: 22%;
            margin-top: 12%;
        }
        
        
    </style>
</head>
<body>

<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

<section id="content" class="content_css">

        <section id="content-1">
            <p>포인트 결제</p>
            <div class="line"></div>
        </section> 
        

        <section id="content-2">
            <div class='pointPay_box'>
                <form id="joinForm" method="post"onsubmit="return checkInput();">
                    <table id="pointPay"style="width : 100%;">
                    	<tr>
                            <th><label for="money" class="text_font">보유 금액</label></th>
                            <td colspan="2"><%=money %> 포인트</td>
                        </tr>
                        <tr>
                            <th><label for="money" class="text_font">결제할 금액</label></th>
                            <td colspan="2"><input type="text" id="money" class="input_box" value="<%=ch.getChallPay()%>">원</td>
                            
                        </tr>
                        <tr>
                            <th><label for="bank" class="text_font">남은 금액</label></th>
                            <td colspan="2"><input type="text" name="point" id="bank" class="input_box" value="<%=remainPay%>">원</td>
                        </tr>
                 		<tr>
                            <th><label for="pass" class="text_font">비밀번호 확인</label></th>
                            <td><input type="password" name="pass" id="pass"class="input_box" /></td>
                            <td><label id="pwdResult"></label></td>
                        </tr>
          
                        <tr>
                            <th > <button type="reset" class="btn">취소</button></th>
                            <th colspan="2"> <button id="pointBtn" class="btn">포인트결제</button></th>
                            
                        </tr>
                    </table>  
                    <!-- 결제 수단 넘겨주기 -->
                    <input type="hidden" name="payment" value="<%= payment %>"> 
                    <!-- 챌린지 번호 --> 
                    <input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
                </form>
            </div>
            
            <script>
			// checkInput함수작성
			function checkInput(){
				if($("#money").val().trim().length==0){
					alert('환급받을 금액을 입력하세요');
					$("#money").focus();
					return false;
				}
				//보유금액보다 큰 금액 입력시 alert후 focus 처리->submit X 
				if($("#money").val().trim()> <%=money%>){
					alert('보유 금액보다 더 큰 액수를 입력할수 없습니다.');
					$("#money").focus();
					return false;
				}
				if($("#bank").val().trim().length==0){
					alert('은행명을 입력하세요');
					$("#bank").focus();
					return false;
				}
				if($("#account").val().trim().length==0){
					alert('계좌번호를 입력하세요');
					$("#account").focus();
					return false;
				}
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
    </section>
    
    <!-- 결제버튼  -->
    <script>
	const pointBtn = document.getElementById('pointBtn');
	pointBtn.addEventListener('click',function(){
		alert("챌린지 참여가 되었습니다!!");
		$("#joinForm").attr("action", "<%= request.getContextPath()%>/pay/insert");
		$("#joinForm").submit();
	});
	
	</script>
	
</body>
</html>