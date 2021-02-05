<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="challenge.model.vo.*, java.util.Date, java.util.ArrayList, java.text.SimpleDateFormat"%>
<%
   Challenge ch = (Challenge)request.getAttribute("challenge"); 

   String cateName = null;
   String selectedCategory[] = new String[8];
         
   if(ch.getCateName() != null){
      // 회원이 선택한 카테고리 담기 (1개)
      cateName = ch.getCateName();
      switch(cateName){
      case "체중관리" : selectedCategory[0] = "checked"; break;
      case "운동" : selectedCategory[1] = "checked"; break;
      case "자격증" : selectedCategory[2] = "checked"; break;
      case "돈관리" : selectedCategory[3] = "checked"; break;
      case "생활습관" : selectedCategory[4] = "checked"; break;
      case "공부" : selectedCategory[5] = "checked"; break;
      case "업무스킬" : selectedCategory[6] = "checked"; break;
      case "외국어" : selectedCategory[7] = "checked"; break;
      }
   }
   
   // 회원이 선택한 인증방법 담기 
   String challConfirm = null;
   String selectedConfirm[] = new String[3];
   
   if(ch.getChallConfirm() != null){
      // 회원이 선택한 인증방법 담기 (1개)
      challConfirm = ch.getChallConfirm();
      switch(challConfirm){
      case "주말" : selectedConfirm[0] = "checked"; break;
      case "평일" : selectedConfirm[1] = "checked"; break;
      case "상관없음" : selectedConfirm[2] = "checked"; break;
      }
   }
   

   // 회원이 선택한 챌린지 기간 세팅
   String period = "";
   String selectedPeriod[] = new String[4];
         
   if(ch.getChallPeriod() != null){
      // 회원이 선택한 카테고리 담기 (1개)
      period = ch.getChallPeriod();
      switch(period){
      case "1" : selectedPeriod[0] = "selected"; break;
      case "2" : selectedPeriod[1] = "selected"; break;
      case "3" : selectedPeriod[2] = "selected"; break;
      case "4" : selectedPeriod[3] = "selected"; break;
      }
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Better Together</title>
<style>
/* content 부분 */

#btSection {
	padding-bottom: 100px;
}


#challenge-form {
	width: 100%;
	height: 100%;
	margin-left:30%;
}

#challMake_tb{
	font-family: "Nanum Gothic";
	font-size:17px;
	color : #757575;
	margin-top:2%;
}

#challTitle {
	margin-top: 50px;
    text-align: center;
    font-size: 24px;
    color : #757575;
	
}



.challMake_tb {
	font-size: 19px;
	border-collapse: collapse;
}

.tb_content{
	padding-right:20px;
	padding:15px;
}


input[type="file"] {
	font-family: "Nanum Gothic";
}

input[type="radio"]{
	margin:7px;
}


#btn_content{
	margin-top:3%;
	width: 100%;
	height: 10%;
	margin-left:17%;
}

#challenge_btn {
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

#back_btn {
	width: 90px;
	font-family: "Nanum Gothic";
	border-radius: 10px;
	border: solid 1px #9e9e9e5b;
	padding: 5px 15px 5px 15px;
	background-color: #e6e4e4b6;
	font-size: 10px;
	font-weight: bolder;
}

/* 입력 부분 css */
input[type="text"], input[type="date"] {
	height: 35px;
	width: 100%;
	border: solid 1px #9e9e9e5b;
	border-radius: 3px;
}

select{
	height:35px;
	width:100%;
	border: solid 1px #9e9e9e5b;
}


#chall_textArea{
	height: 200px;
	border: white;
	border-radius: 3px;
	width: 100%;
	resize:none;
}

/**/

input:focus, textarea:focus {
	outline: none;
} 

#file_option label {
	display: inline-block;
	background: #e0dbf890;
	border-radius: 10px;
	color: #252525b6;
	padding: 0px 15px;
	line-height: 30px;
	cursor: pointer;
	margin: 3px;
	margin-left: 5px;
}

#file_option label:after {
	content: "파일등록";
}

#file_option #file-input {
	display: none;
}

#file_option .filename {
	display: inline-block;
	font-size: 14px;
	color: #757575b7;
}

.line {
	border: 0.5px solid #937cf790;
}

#challenge_btn:focus, #back_btn:focus {
	outline: none;
	border: solid 1px #937CF7;
	background-color: #e0dbf890;
}

</style>
<!-- select option 1:주말 2:평일 3:상관없음 -->

<script type="text/javascript">
function Activity(name, list){
    this.name = name; // 주말/평일/상관없음 vlaue
    this.list = list; // 해당되는 select option list 
}

var acts = new Array(); //배열 
    acts[0] = new Activity('주말', ['1', '2']);
    acts[1] = new Activity('평일', ['1', '2', '3', '4', '5']);
    acts[2] = new Activity('상관없음', ['1', '2', '3', '4', '5', '6', '7']);

function updateFreq(str){
    var frm = document.myForm; //입력 폼 name --> myForm 
    var oriLen = frm.frequency.length; //select option "name" 가져오기 --> frequency
    var numActs;

    for (var i = 0; i < acts.length; i++){
        if (str == acts[i].name) { //str: 주말/평일/상관없음 1,2,3
            numActs = acts[i].list.length; // 해당되는 select option 길이 가져와서 담기
            for (var j = 0; j < numActs; j++)
                frm.frequency.options[j] = new Option(acts[i].list[j],
                acts[i].list[j]);
            for (var j = numActs; j < oriLen; j++)
                frm.frequency.options[numActs] = null;
        }
    }
}
</script>

</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>

   <section id="btSection" class="content_css">
         <p id="challTitle">챌린지 개설 수정</p>
         <div class="line"></div>
      <form action="<%=request.getContextPath()%>/chall/update"
         method="POST" id="challenge-form" name="myForm" enctype="multipart/form-data">
          <!-- challNo / 사진 hidden으로 넘겨주기-->
              <input type="hidden" name="challNo" value="<%= ch.getChallNo() %>">
              <%
					if (ch.getChallFile() != null) {
				%>
				<input type="hidden" name="picture"
					value="<%=ch.getChallFile()%>">

				<% } %>
            <table id="challMake_tb">
               <tr>
                  <td class="tb_content">챌린지 제목</td>
                  <td><input style="color:#252525b6;font-size:15px; font-weight:bolder;" type="text" maxlength="50" class="chall_text" name="title" value="<%= ch.getChallTitle()%>" >
                  </td>
               </tr>

               <tr>
                  <td class="tb_content">카테고리 선택</td>
                  <td><input type="radio" id="weight" name="category" value="10" <%=selectedCategory[0] %>>
                     <label>체중관리</label>
                     <input type="radio" id="exercise" name="category" value="20" <%=selectedCategory[1] %>>
                     <label>운동</label>
                     <input type="radio" id="certificate" name="category" value="30" <%=selectedCategory[2] %>>
                     <label>자격증</label>
                     <input type="radio" id="money" name="category" value="40" <%=selectedCategory[3] %>>
                     <label>돈관리</label>
                     <br>
                     <input type="radio" id="habit" name="category" value="50" <%=selectedCategory[4] %>>
                     <label>생활습관</label>
                     <input type="radio" id="study" name="category" value="60" <%=selectedCategory[5] %>>
                     <label>공부</label>
                     <input type="radio" id="skill" name="category" value="70" <%=selectedCategory[6] %>>
                     <label>업무스킬</label>
                     <input type="radio" id="language" name="category" value="80" <%=selectedCategory[7] %>>
                     <label>외국어</label>
                  </td>
               </tr>

               <tr>
                  <td class="tb_content">첨부파일</td>
                  <td>
                     <div id="file_option">
                        <label><input type="file" id="file-input" name="picture"></label> <span
                           class="filename" style="color:#252525b6;font-size:15px; font-weight:bolder;"><%=ch.getChallFile() %></span>
                     </div>
                  </td>
               </tr>

               <tr>
                  <td class="tb_content">인증 방법</td>
                  <td>
                     <input type="radio" id="weekend" name="confirm" value="주말" onclick="updateFreq(this.value)" <%=selectedConfirm[0] %>><label>주말</label>
                     <input type="radio" id="weekday" name="confirm" value="평일" onclick="updateFreq(this.value)" <%=selectedConfirm[1] %>><label>평일</label>
                     <input type="radio" id="both" name="confirm" value="상관없음" onclick="updateFreq(this.value)" <%=selectedConfirm[2] %>><label>상관없음</label>
                  </td>
               </tr>
               
               <tr>
                  <td class="tb_content">인증 빈도</td>
                  <td><select name="frequency" style="color:#252525b6;font-size:15px; font-weight:bolder;">
                     <option><%=ch.getChallFrequency() %></option>
                     </select>
                  </td>
               </tr>

               <tr>
                  <td class="tb_content">챌린지 기간</td>
                  <td><select name="period" style="color:#252525b6;font-size:15px; font-weight:bolder;">
                     <option>---</option>
                     <option value="1" <%=selectedPeriod[0] %>>1</option>
                     <option value="2" <%=selectedPeriod[1] %>>2</option>
                     <option value="3" <%=selectedPeriod[2] %>>3</option>
                     <option value="4" <%=selectedPeriod[3] %>>4</option>
                  </select></td>
               </tr>

               <tr>
                  <td class="tb_content">챌린지 시작일</td>
                  <td><input type="date" name="startDate" style="color:#252525b6;font-size:15px; font-weight:bolder;" value="<%=ch.getChallStart()%>"></td>
               </tr>

               <tr>
                  <td class="tb_content">참가비</td>
                  <td><input style="color:#252525b6;font-size:15px; font-weight:bolder;" type="text" class="chall_text" name="payment" maxlength="50" value="<%=ch.getChallPay()%>">
                  </td>
               </tr>

               <tr>
                  <td class="tb_content">참가 인원수</td>
                  <td><input style="color:#252525b6;font-size:15px; font-weight:bolder;" type="text" class="chall_text" name="people" maxlength="50" value="<%=ch.getChallPeople()%>">
                  </td>
               </tr>

               <tr>
					<td class="tb_content">소개</td>
					<td>
					<%if(ch.getChallContent() == null) {%>
					<textarea id="chall_textArea" style="color:#252525b6;font-size:15px; font-weight:bolder;" name="content"></textarea>
					<% } else { %>
					<textarea style="color:#252525b6;font-size:15px; font-weight:bolder;" id="chall_textArea" name="content"><%=ch.getChallContent() %></textarea>
					<% } %>
					</td>
				</tr>
            </table>

         <!-- 총인증갯수도 숨겨서 보내기 -->
         <!-- <input type="hidden" name="confirmCnt" value="0"> -->

         <section id="btn_content">
            <!-- 등록 버튼 -->
            <button type="button" onclick="javascript:history.back();"
               id="back_btn">뒤로가기</button>
            <button type="submit" id="challenge_btn">수정하기</button>
         </section>
      </form>
   </section>

   <script>
      $(document).on("change", "#file-input", function() {
         var filename = $(this).val();
         console.log(filename);
         if (filename == "")
            filename = "파일을 선택해주세요.";
         $(".filename").text(filename);
      })
      
   </script>
   
   <%@ include file="../common/footer.jsp" %>

</body>
</html>