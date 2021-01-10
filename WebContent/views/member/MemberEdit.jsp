<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");

	String userId=m.getUserId();
	String userPwd=m.getUserPwd();
	String nickName=m.getUserName();
	
	//필수 정보가 아닌 값들은 null로 리턴되므로 ""로 처리
	String phone = (m.getPhone()!= null)?m.getPhone():"";
	String email = (m.getEmail()!= null)?m.getEmail():"";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
   #join{
            width: 50%;
            height: 80%;
            /* border: 1px solid black; */
            margin-top: 5%;
            margin-left: 25%;
            padding-left: 5%;
        }
    .text_font{
    font-family: "Do Hyeon";
    font-size: 20px;
	}
	.joinform_btn{
       
    width: 120px;
    height: 40px;
    border-radius: 20px;
    border: #f7dede;
    background-color: #f7dede;
    margin-top: 30px;
   }
   
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
	<!-- 1.회원가입  -->
	<!-- 1_1. 회원가입 폼 작성  -->
        <form id="updateForm"action="<%=request.getContextPath() %>/member/update"
			method="post">
			<!-- 세션에 저장된 로그인 유저의 객체 가져와서 사용 -->
            <table id="join">
                <tr>
                    <td><label for="nickName" class="text_font">닉네임</label></td>
                    <td><input type="text" maxlength="13" name="nickName" value = "<%= nickName%>" required class="input_box"/></td>
                    <!--AJAX(비동기 통신)을 통해 추후에 구현할 예정 -->
                    <td><button id="idCheck"type="button" class="joinform_btn"><span>중복확인</span></button></td>
                </tr>
                <tr>
                    <td><label for="userid" class="text_font">아이디</label></td>
                    <td><input type="text" maxlength="13" name="userId"  value="<%=userId%>" required class="input_box"/></td>
                    <td><button class="joinform_btn"><span>중복확인</span></button></td>
                </tr>
                <tr>
                    <td><label for="pass" class="text_font">비밀번호</label></td>
                    <td><input type="password" maxlength="15" name="userPwd" value = "<%= userPwd %>" required class="input_box"/></td>
                    <td><button id="pwdUpdateBtn"type="button" class="joinform_btn text_font">비밀번호 변경</button></td>
                    <!-- 팝업창 띄워서 별도의 프로세스로 진행 -->
                </tr>
                
                <tr>
                    <td><label for="tel1" class="text_font">전화번호</label></td>
                    <td colspan="2"><input type="tel" name="phone" maxlength="13" value = "<%=phone%>" placeholder="(-포함)010-1234-5678" class="input_box_lag"/></td>
                    

                </tr>
                <tr>
                    <td><label for="email" class="text_font">이메일</label></td>
                    <td colspan="2"><input type="email" name="email" class="input_box_lag" value = "<%=email%>"/></td>
                    
                </tr>
                <tr>
                    <th><button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button></th>
                    <th colspan="2"> <button id="updateBtn" class="text_font joinform_btn">수정하기</button></th>
                </tr>
            </table>

        </form>
   
	</section>
</body>
</html>