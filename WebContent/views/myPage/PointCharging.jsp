<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%if(session.getAttribute("msg") != null){ %>
<script>
	alert('<%=session.getAttribute("msg") %>');
	
</script>
<%
	session.removeAttribute("msg");
 	}
%>
<style>
     .line {
		border: 0.5px solid #937cf790;
	}
	
	#btSection {
		padding-bottom: 100px;
	}
        
	 #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;
   }
        .refund_box{
            width: 560px;
            height: 80%;
            float: left;
            margin-left: 250px;
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
	        font-weight: bolder;
	        margin-top:20px;
	        margin-left:50px;
        }
        #content-2{
            padding-left: 22%;
            margin-top: 5%;
        }
    </style>
</head>
<body>

<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

<section id="btSection" class="content_css">

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
                            <th><label for="money" class="text_font">보유 금액</label></th>
                            <td colspan="2"><%=money %></td>
                        </tr>
                        <tr>
                            <th><label for="money" class="text_font">충전할 금액</label></th>
                            <td colspan="2"><input type="text" name="money" id="money" class="input_box"/></td>
                            
                        </tr>
                        
          
                        <tr>
                            <th > <button type="reset" class="btn">취소</button></th>
                            <th colspan="2"> <button type="submit" class="btn2">충전하기</button></th>
                        
                            
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

       
    </section>
    
    <%@ include file="../common/footer.jsp" %>
</body>
</html>