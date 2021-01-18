<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* content 부분 */
#challenge-form {
   width: 100%;
   height: 100%;
   float: left;
}

#content-0 {
   width: 100%;
   height: 10%;
   text-align: center;
}

#content-0 p {
   font-size: 25px;
}

#content-1 {
   width: 100%;
   height: 80%;
   padding-left: 60px;
   float: left;
   margin-top: -20px;
}

.table {
   font-family: "Do Hyeon";
   font-size: 19px;
   border-collapse: collapse;
}

tr {
   border: 1px solid #c2c1c1;
}

tr>td {
   background-color: white;
}

th {
   background-color: #ece8e8;
   padding: 5px;
   border: 1px solid #c2c1c1;
}

input[type="file"] {
   font-family: "Do Hyeon";
}

textarea {
   position: absolute;
   margin-top: 368px;
   padding-right: 522px;
   height: 80px;
   border: white;
   border-radius: 3px;
   resize: none;
}

#content-2 {
   width: 100%;
   height: 10%;
   float: left;
   margin-top: -120px;
}

#challenge_btn {
   font-family: "Do Hyeon";
   width: 170px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   float: right;
   font-size: 20px;
   margin-right: 60px;
}

#back_btn{
   font-family: "Do Hyeon";
   width: 170px;
   height: 50px;
   border-radius: 20px;
   border: solid 1px #fdc8c6;
   background-color: #fdc8c6;
   float: left;
   font-size: 20px;
   margin-left: 580px;
}

/* 파일첨부 버튼 css */
.filebox label {
   display: inline-block;
   padding: .1em .75em;
   margin-left: 2px;
   font-size: inherit;
   line-height: normal;
   vertical-align: middle;
   background-color: #d3d0d0;
   cursor: pointer;
   border: 1px solid #d3d0d0;
   border-bottom-color: #e2e2e2;
   border-radius: .25em;
   font-size: 17px;
}

.filebox input[type="file"] {
   /* 파일 필드 숨기기 */
   position: absolute;
   width: 1px;
   height: 1px;
   padding: 0;
   margin: -1px;
   overflow: hidden;
   clip: rect(0, 0, 0, 0);
   border: 0;
}

input[type="text"],input[type="date"] {
   height: 33px;
   width: 762px;
   border: white;
   border-radius: 3px;
}

tr:nth-child(2) label {
   padding-right: 8px;
}

tr:nth-child(2) input {
   margin-left: 12px;
}

input:focus, textarea:focus {
   outline: none;
}
</style>
</head>
<body>
   <%@ include file="../common/common_ui.jsp"%>

   <section id="content" class="content_css">
      <section id="content-0">
         <p>챌린지 개설</p>
      </section>
      <form action="<%= request.getContextPath()%>/chall/insert" method="POST" id="challenge-form">
         <section id="content-1">
            <table class="table">
               <tr>
                  <th>챌린지 제목</th>
                  <td><input type="text" maxlength="50" name="title" required>
                  </td>
               </tr>

               <tr>
                  <th>카테고리 선택</th>
                  <td><input type="radio" id="weight" name="category" value="1">
                     <label>체중관리</label>
                     <input type="radio" id="exercise" name="category" value="2">
                     <label>운동</label>
                     <input type="radio" id="certificate" name="category" value="3">
                     <label>자격증</label>
                     <input type="radio" id="money" name="category" value="4">
                     <label>돈관리</label>
                     <input type="radio" id="habit" name="category" value="5">
                     <label>생활습관</label>
                     <input type="radio" id="study" name="category" value="6">
                     <label>공부</label>
                     <input type="radio" id="skill" name="category" value="7">
                     <label>업무스킬</label>
                     <input type="radio" id="language" name="category" value="8">
                     <label>외국어</label>
                  </td>
               </tr>

               <tr>
                  <th>첨부파일</th>
                  <td>
                     <div class="filebox">
                        <label for="ex_file">파일 첨부</label> <input type="file"
                           id="ex_file" name="picture" required>
                     </div>
                  </td>
               </tr>

               <tr>
                  <th>인증 방법</th>
                  <td><input type="text" name="confirm" maxlength="50" required>
                  </td>
               </tr>

               <tr>
                  <th>인증 빈도</th>
                  <td><input type="text" name="frequency" maxlength="50"
                     required></td>
               </tr>

               <tr>
                  <th>챌린지 기간</th>
                  <td><input type="text" name="period" maxlength="50" required>
                  </td>
               </tr>
               
               <tr>
                  <th>챌린지 시작일</th>
                  <td><input type="date" name="startDate" required>
                  </td>
               </tr>

               <tr>
                  <th>참가비</th>
                  <td><input type="text" name="payment" maxlength="50" required>
                  </td>
               </tr>

               <tr>
                  <th>참가 인원수</th>
                  <td><input type="text" name="people" maxlength="50" required>
                  </td>
               </tr>

               <tr>
                  <th colspan="2">소개</th>
               </tr>

               <tr>
                  <p>
                     <textarea cols="50" rows="10" name="content"></textarea>
                  </p>
               </tr>

            </table>
         </section>

         <section id="content-2">
            <!-- 등록 버튼 -->
            <button type="button" onclick="javascript:history.back();" id="back_btn">뒤로가기</button>
            <button type="submit" id="challenge_btn">챌린지 등록</button>
         </section>
      </form>
   </section>


</body>
</html>