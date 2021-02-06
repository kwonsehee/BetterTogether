<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
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
        padding-left:5px;
        }
   
	.joinform_btn{
     font-size:10px;
     font-weight: bolder;
     font-family: "Nanum Gothic";
     border-radius: 15px;
     border: solid 1px #9e9e9e5b;
      padding:5px 15px 5px 15px; 
    background-color: #e6e4e4b6; 
  	margin-left:0;
   }
       #btSection {
	padding-bottom: 100px;
}
  .line{
            float: left;
            width: 100%;
            height: 1px;
            
            background-color:#937cf790;
             border: 0.5px solid #937cf790;
             
        } 
         #joinTitle{
        /*  border:solid 1px black;   */
        font-size: 30px;
        text-align: center;
        padding-top: 35px;
    }
    #du_btn{
    margin-left:20px;
    }
    </style>
</head>
<body>
<!-- 페이지를 이동해도 menubar는 계속 상단에 노출되게끔 -->
	<%@ include file="../common/common_ui.jsp"%>

	<section id="btSection" class="content_css">
	<!-- 1.회원가입  -->
	<!-- 1_1. 회원가입 폼 작성  -->
        <form id="joinForm"action="<%=request.getContextPath() %>/member/insert"
			method="post"onsubmit="return joinValidate();">
			 <p id="joinTitle">회원가입</p>
            <div class="line"></div>
            <table id="join"style="margin-top:5%;">
           		 <tr>
                    <td><label for="name" class="text_font">이름</label></td>
                    <td colspan="2"><input type="text" maxlength="13" name="name" required/></td>
                   
                </tr>
                <tr>
                    <td><label for="nickName" class="text_font">닉네임</label></td>
                    <td colspan="2"><input type="text" maxlength="13" name="nickName" required/></td>
                   
                </tr>
                <tr>
                    <td><label for="userid" class="text_font">아이디</label></td>
                    <td><input type="text" maxlength="13" name="userId" required /></td>
                    <td><button id="idCheck" type="button" class="joinform_btn" id="du_btn">중복확인</button></td>
                </tr>
                <tr>
                    <td><label for="pass" class="text_font">비밀번호</label></td>
                    <td colspan="2"><input type="password" maxlength="15" name="userPwd" required /></td>
             
                </tr>
                <tr>
                    <td><label for="pass1" class="text_font">비밀번호 확인</label></td>
                    <td><input type="password" maxlength="15" name="userPwd2" required /></td>
                    <td><label id="pwdResult"></label></td>
                </tr>
                <tr>
                    <td><label for="tel1" class="text_font">전화번호</label></td>
                    <td colspan="2"><input type="tel" name="phone" maxlength="13" required placeholder="(-포함)010-1234-5678" /></td>
                    

                </tr>
                <tr>
                    <td><label for="email" class="text_font">이메일</label></td>
                    <td colspan="2"><input type="email" name="email" required/></td>
                    
                </tr>
                <tr>
                	<td><label  for="cateArr" class="text_font">관심카테고리</label></td>
                	<td colspan="2" id="cateArea">
                	 <input type="checkbox" id="체중관리" value="10" name="cate" class="check_box" onclick="oneCheckbox(this)" ><label for="체중관리">체중관리</label>
               		 <input type="checkbox" id="운동" value="20" name="cate"class="check_box"onclick="oneCheckbox(this)" ><label for="운동">운동</label>
                	 <input type="checkbox" id="자격증" value="30"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="자격증">자격증</label>
               		 <input type="checkbox" id="돈관리" value="40"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="돈관리">돈관리</label>
                	 <br>
               		 <input type="checkbox" id="생활습관" value="50"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="생활습관">생활습관</label>
                	 <input type="checkbox" id="공부" value="60"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="공부">공부</label>
             	     <input type="checkbox" id="업무스킬" value="70"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="업무스킬">업무스킬</label>
                	 <input type="checkbox" id="외국어" value="80"name="cate"class="check_box"onclick="oneCheckbox(this)"><label for="외국어">외국어</label>
       
                	
                	</td>
                </tr>
                <tr>
                    
                    <th colspan="3"> <button id="joinBtn" type="submit" style="margin-left:43%;margin-top:30px;"class="joinform_btn"disabled>회원가입</button></th>
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
 
	<script>
		<%-- //1.메인으로 돌아가기
		const goMainBtn = document.getElementById('goMainBtn');
		goMainBtn.addEventListener('click',function(){
			location.href='<%=request.getContextPath()%>';
		}); --%>
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
			if( !(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/.test($("#joinForm input[name=nickName]").val()))){
				alert("닉네임은 한글/영문/숫자만 입력 가능합니다!");
				$("#joinForm input[name=nickName]").select();
				return false;
			}
			//이름 -한글 값 2~4글자
			if(!(/^[가-힣]{2,4}$/.test($("#joinForm input[name=name]").val()))){
				alert("이름은 한글값 2자에서 4사이로 입력해주세요!");
				$("#joinForm input[name=name]").select();
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
	 <%@ include file="../common/footer.jsp"%>
</body>
</html>