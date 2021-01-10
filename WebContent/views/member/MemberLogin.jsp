<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login화면</title>

</head>
<body>
	<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="content" class="content_css">
		
		<!-- 1_1. 로그인 폼 만들기 -->
		<form id="login_css" action="<%= request.getContextPath() %>/member/login"
		method="post"onsubmit="return validate();">
			<table style="margin-top: 30px;">
				<tr>
					<td><label for="userId"><span>아이디</span></label></td>
					<td><input type="text" name="userId"id="userId" class="input_box"></td>
				</tr>
				<tr>
					<td><label for="userPwd"><span>비밀번호</span></label></td>
					<td><input type="password" name="userPwd"id="userPwd"class="input_box"></td>
				</tr>
				<tr>
					<th>
						<button id="JoinBtn" type="button" class="btn_join"style="margin-top: 30px; margin-left: 10px;">회원가입</button>
					</th>
					<th>
						<button id="LoginBtn" type="submit" class="btn_login"style="margin-top: 30px; margin-left: 10px;">로그인</button>
					</th>
				</tr>
			</table>

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
			
			// 3. 회원가입 버튼 클릭 이벤트 작성
	         const JoinBtn = document.getElementById('JoinBtn');
	            JoinBtn.addEventListener('click',function(){
	               location.href="<%= request.getContextPath()%>/views/member/MemberJoin.jsp";
	            });
			
		
			</script>
	</section>
</body>
</html>