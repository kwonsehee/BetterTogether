<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");

	String userId=m.getUserId();
	String userPwd=m.getUserPwd();
	String nickName=m.getNickName();
	
	//필수 정보가 아닌 값들은 null로 리턴되므로 ""로 처리
	String phone = (m.getPhone()!= null)?m.getPhone():"";
	String email = (m.getEmail()!= null)?m.getEmail():"";
	int cate = (m.getUser_cate()!=0)?m.getUser_cate():0;
	
	//체크된 체크박스에 해당하는 인덱스에 checked문자열을 담기 
	String[] checkedInterest = new String[8];
		
	switch(cate){
	case 10 : checkedInterest[0] = "checked"; break;
	case 20 : checkedInterest[1] = "checked"; break;
	case 30 : checkedInterest[2] = "checked"; break;
	case 40 : checkedInterest[3] = "checked"; break;
	case 50 : checkedInterest[4] = "checked"; break;
	case 60 : checkedInterest[5] = "checked"; break;
	case 70 : checkedInterest[6] = "checked"; break;
	case 80 : checkedInterest[7] = "checked"; break;
	
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>

	#btSection {
		padding-bottom: 100px;
	}
	
	 .line {
		border: 0.5px solid #937cf790;
	}
        
	 #content-1 p{
     /*        border:solid 1px red;  */
            font-size: 24px;
            text-align: center;
             color : #757575;
   }
   
	#join tr {
		font-family: "Nanum Gothic";
        font-size: 20px;
	}
	
	#updateForm {
		font-family: "Nanum Gothic";
	}
	
	 #join{
            width: 39%;
            height: 80%;
            
            margin-top: 5%;
            margin:auto;
           padding-right:10px;
        }
        
    #join td{
        padding-top:10px;
        padding-bottom:10px;
        padding-left:30px;
        
        }
        #cateArea label{
        margin-right:20px;
        /* padding-left:5px; */
        }
	
	#pwdUpdateBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left:-60%;
	}
	
	#updateBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-left: 100px;
        margin-top:30px;
	}
	
	#deleteBtn {
		font-family: "Nanum Gothic";
        border-radius: 10px;
        border: solid 1px #9e9e9e5b;
        padding:5px 15px 5px 15px;
        background-color: #e6e4e4b6;
        font-size:10px;
        font-weight: bolder;
        margin-top:30px;
        margin-left:200px;
	}
</style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="btSection" class="content_css">
	
	 <section id="content-1">
            <p>개인정보 수정</p>
            <div class="line"></div>
        </section>
	<!-- 1.회원가입  -->
	<!-- 1_1. 회원가입 폼 작성  -->
        <form id="updateForm"action="<%=request.getContextPath() %>/member/update"
			method="post" onsubmit="return updateValidate();">
			<!-- 세션에 저장된 로그인 유저의 객체 가져와서 사용 -->
            <table id="join" style="margin-top:5%;">
                <tr>
                    <td><label for="nickName" class="text_font">닉네임</label></td>
                    <td colspan="2"><input type="text" maxlength="13" name="nickName" value = "<%= nickName%>" required class="input_box"/></td>
                </tr>
                <tr>
                    <td><label for="userid" class="text_font">아이디</label></td>
                    <td colspan="2"><input type="text" maxlength="13" name="userId"  value="<%=userId%>" required class="input_box"readonly/></td>
                   
                </tr>
                <tr>
                    <td><label for="pass" class="text_font">비밀번호</label></td>
                    <td><input type="password" maxlength="15" name="userPwd" value = "<%= userPwd %>" required class="input_box"/></td>
                    <td><button id="pwdUpdateBtn"type="button" class="joinform_btn text_font"style="margin-top: 0px;">비밀번호 변경</button></td>
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
                	<td><label for="cate" class="text_font">관심카테고리</label></td>
                	<td colspan="2" id="cateArea">
                	  <input type="checkbox" id="체중관리" value="10" name="cate" class="check_box" onclick="oneCheckbox(this)" <%=checkedInterest[0] %>><label for="체중관리"><span>체중관리</span></label>
                	  <input type="checkbox" id="운동" value="20" name="cate"class="check_box"onclick="oneCheckbox(this)" <%=checkedInterest[1] %>><label for="운동"><span>운동</span></label>
                	  <input type="checkbox" id="자격증" value="30"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[2] %>><label for="자격증"><span>자격증</span></label>
                	  <input type="checkbox" id="돈관리" value="40"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[3] %>><label for="돈관리"><span>돈관리</span></label>
                	  <br>
                	  <input type="checkbox" id="생활습관" value="50"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[4] %>><label for="생활습관"><span>생활습관</span></label>
                	  <input type="checkbox" id="공부" value="60"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[5] %>><label for="공부"><span>공부</span></label>
                	  <input type="checkbox" id="업무스킬" value="70"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[6] %>><label for="업무스킬"><span>업무스킬</span></label>
                	  <input type="checkbox" id="외국어" value="80"name="cate"class="check_box"onclick="oneCheckbox(this)"<%=checkedInterest[7] %>><label for="외국어"><span>외국어</span></label>
        
                	
                </td>
               
                <tr>
                    <th> <button id="updateBtn" class="text_font joinform_btn">수정하기</button></th>
                    <!--type=button이 없으면 form태그가 submit 되는 상황임  -->
                    <th><button id="deleteBtn" type="button" class="text_font joinform_btn">탈퇴하기</button></th>
                </tr>
            </table>
				
        </form>
   
	</section>
	  <script type="text/javascript">
        function oneCheckbox(a){
            var obj = document.getElementsByName("cate");
            for(var i=0; i<obj.length; i++){
                if(obj[i] != a){
                    obj[i].checked = false;
                }
            }
        }
	   </script>
	<script>
		//1. 메인으로 돌아가기
		const goMainBtn = document.getElementById("goMainBtn");
		goMainBtn.addEventListener('click',function(){
			location.href="<%=request.getContextPath()%>";
		});
		//2. 비밀번호 변경 창 띄우기
		const pwdUpdateBtn = document.getElementById('pwdUpdateBtn');
		pwdUpdateBtn.addEventListener('click',function(){
			window.open("pwdUpdateForm.jsp","비밀번호 변경 창","width=500, height=400");
		});
		
		//2.유효성 검사
		function updateValidate(){
			//아이디 - 영소문자로 시작해서 4~12자 입력(숫자포함가능)
			if(!(/^[a-z][a-z\d]{3,11}$/.test($("#updateForm input[name=userId]").val()))){
				alert('아이디는 영소문자로 시작해서 4~12자 입력(숫자포함가능)');
				$("#updateForm input[name=userId]").select();
				return false;
			}
			
			//닉네임 -한글 값 2~4글자
			if(!(/^[가-힣]{2,4}$/.test($("#updateForm input[name=nickName]").val()))){
				alert("닉네임은 한글값 2자에서 4사이로 입력해주세요!");
				$("#updateForm input[name=nickName]").select();
				return false;
			}
			return true;
		}
		
		//3. 탈퇴하기 버튼 클릭 이벤트
		//*******회원 탈퇴는 membertype=2로 변경해놓음*********8
		const deleteBtn=document.getElementById('deleteBtn');
		deleteBtn.addEventListener('click',function(){
			if(confirm("정말로 탈퇴하시겠습니까?")){
				//get방식 요청
				//기존 form의 action속성을 변경해서 submit
				// location.href="<%= request.getContextPath() %>/member/delete";
				//기존 form에 정의 된 방식으로 submit되며, form 태그 안에 있는 모든 정보 submit
				$("#updateForm").attr("action","<%= request.getContextPath() %>/member/delete");
				$("#updateForm").submit();
			}
		});
	</script>
	
	 <%@ include file="../common/footer.jsp" %>    
</body>
</html>