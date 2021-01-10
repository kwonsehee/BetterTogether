<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
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
        <form id="joinForm"action="<%=request.getContextPath() %>/member/insert"
			method="post"onsubmit="return joinValidate();">
            <table id="join">
                <tr>
                    <td><label for="nickName" class="text_font">닉네임</label></td>
                    <td><input type="text" maxlength="13" name="nickName" required class="input_box"/></td>
                    <!--AJAX(비동기 통신)을 통해 추후에 구현할 예정 -->
                    <td><button id="idCheck"type="button" class="joinform_btn"><span>중복확인</span></button></td>
                </tr>
                <tr>
                    <td><label for="userid" class="text_font">아이디</label></td>
                    <td><input type="text" maxlength="13" name="userId" required class="input_box"/></td>
                    <td><button class="joinform_btn"><span>중복확인</span></button></td>
                </tr>
                <tr>
                    <td><label for="pass" class="text_font">비밀번호</label></td>
                    <td><input type="password" maxlength="15" name="userPwd" required class="input_box"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td><label for="pass1" class="text_font">비밀번호 확인</label></td>
                    <td><input type="password" maxlength="15" name="userPwd2" required class="input_box" /></td>
                    <td><label id="pwdResult"></label></td>
                </tr>
                <tr>
                    <td><label for="tel1" class="text_font">전화번호</label></td>
                    <td colspan="2"><input type="tel" name="phone" maxlength="13" placeholder="(-포함)010-1234-5678" class="input_box_lag"/></td>
                    

                </tr>
                <tr>
                    <td><label for="email" class="text_font">이메일</label></td>
                    <td colspan="2"><input type="email" name="email" class="input_box_lag"/></td>
                    
                </tr>
                <tr>
                    <th><button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button></th>
                    <th colspan="2"> <button id="joinBtn" type="submit" class="text_font joinform_btn">회원가입</button></th>
                </tr>
            </table>

        </form>
       <!-- jQuery가 포함된 상태에서 postcodify스크립트 포함 -->
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<!-- 검색 버튼 클릭시 팝업 레이어 열리도록 -->
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	
	<script>
		//1.메인으로 돌아가기
		const goMainBtn = document.getElementById('goMainBtn');
		goMainBtn.addEventListener('click',function(){
			location.href='<%=request.getContextPath()%>';
		});
		//2.유효성 검사
		function joinValidate(){
			//아이디 - 영소문자로 시작해서 4~12자 입력(숫자포함가능)
			if(!(/^[a-z][a-z\d]{3,11}$/.test($("#joinForm input[name=userId]").val()))){
				alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자포함가능)');
				$("#joinForm input[name=userId]").select();
				return false;
			}
			//비밀번호 - 비밀번호 확인 일치여부
			if($("#joinForm input[name=userPwd]").val() != $("#joinForm input[name=userPwd2]").val()){
				$("#pwdResult").text("비밀번호 불일치").css("color","red");
				return false;
			}
			//이름 -한글 값 2글자 이상 입력
			if(!(/^[가-힣]{2,}$/.test($("#joinForm input[name=nickName]").val()))){
				alert("이름은 한글로 2글자 이상 입력");
				$("#joinForm input[name=userName]").select();
				return false;
			}
			return true;
		}
	</script>
	</section>
</body>
</html>