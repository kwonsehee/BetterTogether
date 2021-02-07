<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member)session.getAttribute("loginUser");

	String userId=m.getUserId();
	String userPwd=m.getUserPwd();
	int money = m.getPoint();
	
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

        
	 #content-1 p{

          font-size: 24px;
          text-align: center;
          color : #757575;
         
   }
        .refund_box{
            width: 500px;
            height: 80%;
            padding-left:80px;
        }

        #refund, #refund button, #refund tr{
            font-family: "Nanum Gothic";
            font-size: 20px;
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
            <p>포인트 충전</p>
            <div class="line"></div>
        </section> 
        

        <section id="content-2">
            <div class='refund_box'>
                <form id="joinForm" action="<%= request.getContextPath() %>/PointpayServlet"
						method="post" onsubmit="return checkInput();">
						
                    <table id="refund"style="width : 100%;">
                    	<tr>
                            <td><label for="money" class="text_font">보유 금액</label></td>
                            <td><%=money %></td>
                        </tr>
                        <tr>
                            <td><label for="money" class="text_font">충전할 금액</label></td>
                            <td><input type="text" name="money" id="money" class="input_box"/></td>
                            
                        </tr>
                        
          
                        <tr>
                            <td > <button type="reset" class="btn">취소</button></td>
                            <td> <button type="submit" class="btn2">충전하기</button></td>
                        
                            
                        </tr>
                    </table>

					 

				</form>
            </div>
            <script>
        	function checkInput(){
				if($("#money").val().trim().length==0){
					alert('충전할을 금액을 입력하세요');
					$("#money").focus();
					return false;
				}
        	}
            </script>
      
        </section>

       
    
</body>
</html>