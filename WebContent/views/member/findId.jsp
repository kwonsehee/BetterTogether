<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.Member"%>
<%
	String message=(String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<%
	if(request.getAttribute("msg")!=null){
		if(request.getAttribute("msg").equals("success")){
			ArrayList<Member> idList=(ArrayList<Member>)request.getAttribute("idList");
			String ids="";
			for(Member m:idList){
				ids+="아이디 : "+m.getUserId()+"(가입날짜 : "+m.getJoinDate()+")  ";

			}
			System.out.println(ids);
	
%>
<script type="text/javascript">
var t="<%=ids%>";

alert(t+"가 존재합니다.");

window.close();	
</script>
<%} else{ %>
<script>
	alert("아이디를 찾을수 없습니다.");
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
            /* width: 70px; */
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
  .line{
            float: left;
            width: 100%;
            height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
             
        } 
        .find{
      margin-top:20px;
        font-size:13px;
       
        }
</style>
</head>
<body>
	<section id="btSection" class="content_css">
		
		<!-- 1_1. 로그인 폼 만들기 -->
		<form id="login_css" action="<%= request.getContextPath() %>/member/findId" method="post">
			<div id="loginTitle">아이디 찾기</div>
            <div class="line"></div>
			<div id="loginForm">
                   
                        <label for="userId"><span>이름</span></label>
                        
                        <input type="text" name="name"id="name" class="input_box" required>
                    
                        <label for="userPwd"><span>이메일 입력</span></label>
                        <input type="email" name="email"id="email"class="input_box" required>
                       
                        <button id="JoinBtn" type="reset" class="btn_login" style="margin-top: 30px; margin-left: 8px;" onclick="window.close();">취소</button>
                        
                        <button id="LoginBtn" type="submit" class="btn_login" style="margin-top: 30px; margin-left: 30%;">아이디 찾기</button>
                </div>    

		</form>
		
	</section>
</body>
</html>