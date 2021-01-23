<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<%
	if(request.getAttribute("result")!=null){
		if(request.getAttribute("result").equals("success")){
%>
<script>
	alert("성공적으로 비밀번호를 변경하였습니다.");
	window.close();
</script>
<%} else{ %>
<script>
	alert("비밀번호 변경에 실패하였습니다.");
</script>
<%		}
	}%>
<!-- 스타일  -->
<link rel="stylesheet" href='<%=request.getContextPath()%>/resources/css/menu_style.css'>
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<style>
    #updatePwdForm{
    width : 480px;
    height : 400px;
    border-radius: 20px;
    border: solid 1px  #f9f1f1;
    background-color:  #f9f1f1;
    }
   h3 {
      text-align:center;
   }
   /* 테이블 스타일 */
   #pwdEdit{
      margin:auto;
   }
   #updatePwdForm td {
      text-align:right;
      font-family: 'do Hyeon';
      font-size: 20px;
   }
   /* 버튼 관련 스타일 */
   button:hover {
      cursor:pointer
   }
   .btn_edit{

width: 120px;
height: 40px;
border-radius: 20px;
border: #f7dede;
background-color: #f7dede;
font-family: "Do Hyeon";
font-size: 20px;

}
   
</style>
</head>
<body>
	<form id="updatePwdForm"action="<%=request.getContextPath()%>/member/updatePwd"
	method="post"onsubmit="return checkPwd();">
	<p style="text-align : center;">비밀번호 변경</p>
	<br>

	<table id="pwdEdit">
		<tr>
			<td><label>현재 비밀번호</label></td>
			<td width ="50"></td>
			<td><input type="password"name="userPwd" id="userPwd"maxlength="15"class="input_box"></td>
		</tr>
		<tr>
			<td><label>변경할 비밀번호</label></td>
			<td width ="50"></td>
			<td><input type="password"name="userPwd1" id="userPwd1"maxlength="15"class="input_box"></td>
		</tr>
		<tr>
			<td><label>변경할 비밀번호 확인</label></td>
			<td width ="50"></td>
			<td><input type="password"name="userPwd2" id="userPwd2"maxlength="15"class="input_box"></td>
		</tr>
	
	</table>
	<br><br>
	<div class="btns" align="center">
		<button id="updatePwdBtn" class="btn_edit"><span>변경하기</span></button>
	</div>
	</form>
	
	<script>
		function checkPwd(){
			const userPwd = document.getElementById('userPwd');
			const newPwd = document.getElementById('userPwd1');
			const newPwd2 = document.getElementById('userPwd2');
			
			//3개의 인풋태그에 값이 입력되었는지 확인
			if(userPwd.value==""||newPwd.value==""||newPwd2.value==""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if(newPwd.value!=newPwd2.value){
				alert("새로운 비밀번호와 비밀번호 확인 값이 다릅니다.");
				newPwd2.select();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>