<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String message=(String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login화면</title>
<%
	if(request.getAttribute("msg")!=null){
		if(request.getAttribute("msg").equals("success")){
%>
<script>
opener.parent.location.reload();
window.close();
	
</script>
<%} else{ %>
<script>
	alert("로그인에 실패하였습니다.");
</script>
<%		}
	}%>
	
<style>
#loginForm{
            padding-left: 10%;
        }
#loginForm label, #loginForm input{
            display: block;
        }
        #loginForm label{
            padding-top: 8%;
        }
        .btn_login{
            font-family: "Nanum Gothic";
            width: 70px;
            height: 30px;
            border-radius: 5px;
            border: solid 1px #9e9e9e5b;
            font-size:14px;
            border : 1px solid #937CF7;
            background-color: #937CF7;
            color: white;
        }
        #loginTitle{
            text-align: center;
            font-size:30px;
            margin-top: 10%;
        }
    .input_box{
    width: 300px;
    height: 30px;
}

</style>
</head>
<body>
	<section id="btSection" class="content_css">
		
		<!-- 1_1. 로그인 폼 만들기 -->
		<form id="login_css" action="<%= request.getContextPath() %>/member/login"
		method="post"onsubmit="return validate();">
			<div id="loginTitle">Log in</div>
            <hr>
			<div id="loginForm">
                   
                        <label for="userId"><span>USERID</span></label>
                        
                        <input type="text" name="userId"id="userId" class="input_box">
                    
                        <label for="userPwd"><span>PASSWORD</span></label>
                        <input type="password" name="userPwd"id="userPwd"class="input_box">
                    
                        <button id="JoinBtn" type="reset" class="btn_login" style="margin-top: 30px; margin-left: 10px;">reset</button>
                        
                        <button id="LoginBtn" type="submit" class="btn_login" style="margin-top: 30px; margin-left: 30%;">Log in</button>
                </div>    

		</form>
		<script>
			//1_2.validate() 함수작성-> 로그인 폼 유효성 검사
			function validate(){
				//아이디, 패스워드 중 입력 되지 않은 값이 있을 시 alert후 focus 처리->submit X 
				if($("#userId").val().trim().length==0){
					alert('아이디를 입력하세요');
					$("#userId").focus();
					return false;
				}
				if($("#userPwd").val().trim().length==0){
					alert('비밀번호를 입력하세요');
					$("#userPwd").focus();
					return false;
				}
				
			}
			
			
		
			</script>
	</section>
</body>
</html>