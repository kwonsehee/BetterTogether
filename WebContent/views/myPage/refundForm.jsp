<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");

	String userId=m.getUserId();
	String userPwd=m.getUserPwd();
	int money = m.getPoint();
	System.out.println("비밀번호 "+userPwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"
   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
   crossorigin="anonymous"></script>
<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%=session.getAttribute("msg") %>');
	 opener.parent.location.reload();
	window.close();
</script>
<%
	session.removeAttribute("msg");
 	}
%>
<style>
	.line {
		border: 0.5px solid #937cf790;
	}
	
        .refund_box{
            width: 500px;
            height: 80%;

            padding-left:60px;
           

        }
        #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;

            color : #757575;

        }
        
        #refund, #refund button, #refund tr{
            font-family: "Nanum Gothic";
            font-size: 20px;
        }
        
        #refund td {
        	padding-top:10px;
        padding-bottom:10px;
        padding-left:30px;
        }
        
        
        #refund button{
            font-family: "Nanum Gothic";
	        border-radius: 10px;
	        border: solid 1px #9e9e9e5b;
	        padding:5px 15px 5px 15px;
	        background-color: #e6e4e4b6;
	        font-size:10px;
	        
	        margin-top:20px;
	        margin-left:50px;
        }
        #content-2{
      
            margin-top: 5%;
        }
        .text_font{
        font-family: "Nanum Gothic";
           font-size:16px;
        }
    </style>
</head>
<body>



        <section id="content-1">
            <p>환급 받기</p>
            <div class="line"></div>
        </section> 
        

        <section id="content-2">
            <div class='refund_box'>
                <form id="joinForm"action="<%=request.getContextPath() %>/member/refund"
						method="post"onsubmit="return checkInput();">
                    <table id="refund"style="width : 100%;">
                    	<tr>
                            <td><label for="money" class="text_font">보유 금액</label></td>
                            <td colspan="2"><%=money %></td>
                        </tr>
                        <tr>
                            <td><label for="money" class="text_font">돌려받을 금액</label></td>
                            <td colspan="2"><input type="text" name="money" id="money" class="input_box"/></td>
                            
                        </tr>
                        <tr>
                            <td><label for="bank" class="text_font">은행명</label></td>
                            <td colspan="2"><input type="text" name="bank" id="bank" class="input_box"/></td>
                        </tr>
                        <tr>
                            <td><label for="account" class="text_font">계좌번호 입력</label></td>
                            <td  colspan="2"> <input type="text" name="account" id="account"class="input_box_lag" /></td>
                            
                        </tr>
                 		<tr>
                            <td><label for="pass" class="text_font">비밀번호 확인</label></td>
                            <td><input type="password" name="pass" id="pass"class="input_box" /></td>
                            <td><label id="pwdResult"></label></td>
                        </tr>
          
                        <tr>
                            <td > <button type="reset" class="btn">취소</button></td>
                            <td> <button type="submit" class="btn">환급받기</button></td>
                            <td></td>
                            
                        </tr>
                    </table>    
        
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

       


</body>
</html>