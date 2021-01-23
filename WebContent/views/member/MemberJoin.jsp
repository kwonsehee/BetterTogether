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
                    <td colspan="2"><input type="text" maxlength="13" name="nickName" required class="input_box"/></td>
                   
                </tr>
                <tr>
                    <td><label for="userid" class="text_font">아이디</label></td>
                    <td><input type="text" maxlength="13" name="userId" required class="input_box"/></td>
                    <td><button id="idCheck"type="button" class="joinform_btn"><span>중복확인</span></button></td>
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
                	<td><label for="cateArr" class="text_font">관심카테고리</label></td>
                	<td colspan="2">
                	 <input type="checkbox" id="체중관리" value="10" name="cate" class="check_box" onclick="oneCheckbox(this)" ><label for="체중관리"><span>체중관리</span></label>
               		 <input type="checkbox" id="운동" value="20" name="cate"class="check_box"onclick="oneCheckbox(this)" ><label for="운동"><span>운동</span></label>
                	 <input type="checkbox" id="자격증" value="30"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="자격증"><span>자격증</span></label>
               		 <input type="checkbox" id="돈관리" value="40"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="돈관리"><span>돈관리</span></label>
                	 <br>
               		 <input type="checkbox" id="생활습관" value="50"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="생활습관"><span>생활습관</span></label>
                	 <input type="checkbox" id="공부" value="60"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="공부"><span>공부</span></label>
             	     <input type="checkbox" id="업무스킬" value="70"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="업무스킬"><span>업무스킬</span></label>
                	 <input type="checkbox" id="외국어" value="80"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="외국어"><span>외국어</span></label>
       
                	
                	</td>
                </tr>
                <tr>
                    <th><button id="goMainBtn" type="button" class="text_font joinform_btn">메인으로</button></th>
                    <th colspan="2"> <button id="joinBtn" type="submit" class="text_font joinform_btn"disabled>회원가입</button></th>
                </tr>
            </table>

        </form>
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
			//닉네임 -한글 값 2~4글자
			if(!(/^[가-힣]{2,4}$/.test($("#joinForm input[name=nickName]").val()))){
				alert("닉네임은 한글값 2자에서 4사이로 입력해주세요!");
				$("#joinForm input[name=nickName]").select();
				return false;
			}
			return true;
		}
		
		//아이디 중복 확인
		$(function(){
			//아이디 중복시 false, 아이디 사용가능시 true-->
			var isUsable = false;
			
			$("#idCheck").click(function(){
				var userId = $("#joinForm input[name='userId']");
				
				if(!userId || userId.val().length<4){
					alert("아이디는 최소 4자리 이상이여야합니다.");
					userId.focus();
					
				}else{
					//4자리 이상의 userId값을 입력했을 경우
					//$.ajax()통신
					$.ajax({
						url : "<%=request.getContextPath()%>/member/idCheck",
						type : "post",
						data : {userId : userId.val()},
						success : function(data){
							console.log(data);
							if(data =="fail"){
								alert("사용할 수 없는 아이디입니다.");
								userId.focus();
							}else{
								//alert("사용할 수 있는 아이디입니다.");
								if(confirm("사용가능한 아이디입니다. 사용하시겠습니까? ")){
									userId.prop('readonly', true);//더이상 id입력 공간을 바꿀수 없도록 처리
									isUsable=true;//사용가능한 아이디라는 flag값으로 변경
								}else{
									//confirm창에서 취소를 누를 경우(처음, 또는 반복해서)
									userId.prop("readonly", false);//다시 Id input 태그 수정가능하도록
									isUsable = false;	//사용 불가능한 아이디 flag 
									
								}
									
							}
							//아이디 중복 체크 후 중복이 아니며 사용하겠다고 선택한경우
							//joinBtn disabled 제거
							if(isUsable){
								$("#joinBtn").removeAttr("disabled");
							}else{
								$("#joinBtn").attr("disabled", true);
							}
						},
						error : function(e){
							console.log(e);
						}
					});
				}
			});
			
		});
		
	</script>
	</section>
</body>
</html>